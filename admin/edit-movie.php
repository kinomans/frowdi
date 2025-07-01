<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

$id = (int)($_GET['id'] ?? 0);

$stmt = $pdo->prepare("SELECT * FROM movies WHERE id = ?");
$stmt->execute([$id]);
$movie = $stmt->fetch();

if (!$movie) die("Фильм не найден");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fields = [
        'title' => trim($_POST['title'] ?? ''),
        'description' => trim($_POST['description'] ?? ''),
        'year' => (int)($_POST['year'] ?? 0),
        'duration' => trim($_POST['duration'] ?? ''),
        'rating' => floatval($_POST['rating'] ?? 0),
        'poster_url' => trim($_POST['poster_url'] ?? ''),
        'cover_url' => trim($_POST['cover_url'] ?? ''),
        'trailer_url' => trim($_POST['trailer_url'] ?? ''),
        'original_language' => trim($_POST['original_language'] ?? ''),
        'country' => trim($_POST['country'] ?? ''),
        'budget' => $_POST['budget'] !== '' ? (int)$_POST['budget'] : null,
        'revenue' => $_POST['revenue'] !== '' ? (int)$_POST['revenue'] : null,
        'director' => trim($_POST['director'] ?? ''),
        'producer' => trim($_POST['producer'] ?? ''),
        'awards' => trim($_POST['awards'] ?? ''),
        'genre_id' => (int)($_POST['genre_id'] ?? 0),
    ];

    if ($fields['title'] && $fields['genre_id']) {
        $stmt = $pdo->prepare("
            UPDATE movies SET 
                title=?, description=?, year=?, duration=?, rating=?, poster_url=?, cover_url=?,
                trailer_url=?, original_language=?, country=?, budget=?, revenue=?,
                director=?, producer=?, awards=?, genre_id=?
            WHERE id=?
        ");
        $stmt->execute([
            $fields['title'], $fields['description'], $fields['year'], $fields['duration'], $fields['rating'],
            $fields['poster_url'], $fields['cover_url'], $fields['trailer_url'], $fields['original_language'],
            $fields['country'], $fields['budget'], $fields['revenue'], $fields['director'],
            $fields['producer'], $fields['awards'], $fields['genre_id'], $id
        ]);
        header("Location: /admin/movies.php?msg=updated");
        exit;
    }
}

$genres = $pdo->query("SELECT * FROM genres ORDER BY name")->fetchAll();
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Редактировать фильм</title>
    <link rel="stylesheet" href="assets/style/admin.css">
    <link rel="stylesheet" href="assets/style/normalize.css">
</head>
<body>
<div class="admin-container">
<?php
$breadcrumbs = [
  ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
  ['title' => 'Фильмы', 'url' => '/admin/movies.php'],
  ['title' => 'Редактировать фильм']
];
include __DIR__ . '/components/breadcrumbs.php';
?>
    <div class="admin-card">
    <h1 class="admin-section__header">Редактировать фильм</h1>
    <form class="admin-form" method="post">
        <label for="title">Название фильма</label>
        <input type="text" name="title" id="title" required value="<?= htmlspecialchars($movie['title']) ?>">

        <label for="description">Описание</label>
        <textarea name="description" id="description" required><?= htmlspecialchars($movie['description']) ?></textarea>

        <div class="admin-form__row">
            <div>
                <label for="year">Год</label>
                <input type="number" name="year" id="year" min="1900" max="2100" value="<?= $movie['year'] ?>">
            </div>
            <div>
                <label for="duration">Длительность</label>
                <input type="text" name="duration" id="duration" value="<?= htmlspecialchars($movie['duration']) ?>">
            </div>
        </div>

        <div class="admin-form__row">
            <div>
                <label for="rating">Рейтинг</label>
                <input type="number" step="0.1" min="0" max="10" name="rating" id="rating" value="<?= $movie['rating'] ?>">
            </div>
            <div>
                <label for="genre">Жанр</label>
                <select name="genre_id" id="genre" required>
                    <option value="">— выберите жанр —</option>
                    <?php foreach ($genres as $g): ?>
                        <option value="<?= $g['id'] ?>" <?= $g['id'] == $movie['genre_id'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($g['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>

        <label for="poster_url">Ссылка на постер</label>
        <input type="url" name="poster_url" id="poster_url" value="<?= htmlspecialchars($movie['poster_url']) ?>">

        <label for="cover_url">Ссылка на обложку</label>
        <input type="url" name="cover_url" id="cover_url" value="<?= htmlspecialchars($movie['cover_url']) ?>">

        <label for="trailer_url">Ссылка на трейлер (YouTube)</label>
        <input type="url" name="trailer_url" id="trailer_url" value="<?= htmlspecialchars($movie['trailer_url']) ?>">

        <label for="original_language">Язык оригинала</label>
        <input type="text" name="original_language" id="original_language" value="<?= htmlspecialchars($movie['original_language']) ?>">

        <label for="country">Страна</label>
        <input type="text" name="country" id="country" value="<?= htmlspecialchars($movie['country']) ?>">

        <div class="admin-form__row">
            <div>
                <label for="budget">Бюджет (₽)</label>
                <input type="number" name="budget" id="budget" value="<?= $movie['budget'] ?>">
            </div>
            <div>
                <label for="revenue">Сборы (₽)</label>
                <input type="number" name="revenue" id="revenue" value="<?= $movie['revenue'] ?>">
            </div>
        </div>

        <label for="director">Режиссёр</label>
        <input type="text" name="director" id="director" value="<?= htmlspecialchars($movie['director']) ?>">

        <label for="producer">Продюсер/Студия</label>
        <input type="text" name="producer" id="producer" value="<?= htmlspecialchars($movie['producer']) ?>">

        <label for="awards">Награды</label>
        <textarea name="awards" id="awards"><?= htmlspecialchars($movie['awards']) ?></textarea>

        <div class="admin-form__actions">
            <button type="submit" class="btn btn--primary">Сохранить изменения</button>
            <a href="/admin/movies.php" class="btn btn--danger">Назад</a>
        </div>
    </form>
    </div>
</div>
</body>
</html>


