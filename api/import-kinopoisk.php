<?php
$pdo = new PDO('mysql:host=localhost;dbname=frowdi_db;charset=utf8', 'root', 'root'); // Укажи свои данные
$apiKey = 'cfc15e2d-3f9e-4b28-a07e-9ecaec60490a';

$movies = [
    "Брат", "Брат 2", "Левиафан", "Москва слезам не верит", "Ирония судьбы",
    "Сталкер", "Возвращение", "Движение вверх", "9 рота", "Легенда №17","Гладиатор" 
    // Добавь оставшиеся
];

$context = stream_context_create([
    "http" => [
        "header" => "X-API-KEY: $apiKey\r\nContent-Type: application/json\r\n"
    ]
]);

function genreToId($genreName) {
    static $map = [
        'Боевик' => 1, 'Приключения' => 2, 'Комедия' => 3, 'Драма' => 4, 'Фантастика' => 5,
        'Ужасы' => 6, 'Триллер' => 7, 'Фэнтези' => 8, 'Мультфильм' => 9, 'Детектив' => 10,
        'Мелодрама' => 11, 'Криминал' => 12, 'Семейный' => 13, 'Документальный' => 14,
        'Биография' => 15, 'Военный' => 16, 'Вестерн' => 17, 'Спорт' => 18, 'Музыка' => 19, 'История' => 20
    ];
    return $map[$genreName] ?? null;
}

foreach ($movies as $title) {
    $searchUrl = 'https://kinopoiskapiunofficial.tech/api/v2.2/films?keyword=' . urlencode($title);
    $response = file_get_contents($searchUrl, false, $context);
    $data = json_decode($response, true);

    if (!empty($data['items'][0])) {
        $film = $data['items'][0];
        $filmId = $film['kinopoiskId'];
        $name = $film['nameRu'] ?? $title;
        $description = $film['description'] ?? 'Описание отсутствует';
        $poster = $film['posterUrl'] ?? null;
        $cover = $film['posterUrlPreview'] ?? $poster;
        $rating = $film['ratingKinopoisk'] ?? 0;
        $year = $film['year'] ?? null;
        $duration = $film['filmLength'] ?? null;
        $lang = $film['languages'][0] ?? 'Русский';
        $country = $film['countries'][0]['country'] ?? 'Россия';
        $budget = $film['budget'] ?? 0;
        $boxOffice = $film['boxOffice'] ?? 0;
        $director = $film['slogan'] ?? '';
        $production = $film['type'] ?? '';
        $awards = $film['shortDescription'] ?? '';
        $genre_id = isset($film['genres'][0]['genre']) ? genreToId($film['genres'][0]['genre']) : null;

        // Трейлер
        $videoUrl = '';
        $videoApiUrl = "https://kinopoiskapiunofficial.tech/api/v2.2/films/$filmId/videos";
        $videoJson = file_get_contents($videoApiUrl, false, $context);
        $videoData = json_decode($videoJson, true);
        if (!empty($videoData['items'])) {
            foreach ($videoData['items'] as $video) {
                if (stripos($video['url'], 'youtube.com') !== false) {
                    $videoUrl = $video['url'];
                    break;
                }
            }
        }

        // Проверка на дубликат
        $check = $pdo->prepare("SELECT COUNT(*) FROM movies WHERE title = ?");
        $check->execute([$name]);
        if ($check->fetchColumn() > 0) {
            echo "⚠️ '$name' уже есть в базе.\n";
            continue;
        }

        $stmt = $pdo->prepare("INSERT INTO movies (
            title, description, poster_url, year, duration, rating, trailer_url,
            cover_url, original_language, country, budget, box_office,
            director, production, awards, genre_id
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

        $stmt->execute([
            $name, $description, $poster, $year, $duration, $rating, $videoUrl,
            $cover, $lang, $country, $budget, $boxOffice, $director, $production, $awards, $genre_id
        ]);

        echo "✅ Добавлен фильм: $name\n";
    } else {
        echo "❌ Не найден фильм: $title\n";
    }
    sleep(1);
}
?>
