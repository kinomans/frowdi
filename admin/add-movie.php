<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

// Получаем жанры для выпадающего списка
$genres = $pdo->query("SELECT * FROM genres ORDER BY name")->fetchAll();

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
        'revenue' => $_POST['box_office'] !== '' ? (int)$_POST['box_office'] : null, // 'revenue' вместо 'box_office'
        'director' => trim($_POST['director'] ?? ''),
        'producer' => trim($_POST['production'] ?? ''), // 'producer' вместо 'production'
        'awards' => trim($_POST['awards'] ?? ''),
        'genre_id' => (int)($_POST['genre_id'] ?? 0),
    ];

    // Валидация обязательных полей
    if ($fields['title'] && $fields['genre_id']) {
        $stmt = $pdo->prepare("
            INSERT INTO movies
                (title, description, year, duration, rating, poster_url, cover_url, trailer_url, original_language,
                country, budget, revenue, director, producer, awards, genre_id)
            VALUES
                (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $fields['title'], $fields['description'], $fields['year'], $fields['duration'], $fields['rating'],
            $fields['poster_url'], $fields['cover_url'], $fields['trailer_url'], $fields['original_language'],
            $fields['country'], $fields['budget'], $fields['revenue'], $fields['director'],
            $fields['producer'], $fields['awards'], $fields['genre_id']
        ]);
        header("Location: /admin/movies.php?msg=added");
        exit;
    } else {
        $error = "Заполните обязательные поля (название, жанр)";
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Добавить фильм — Админ-панель</title>
  <link rel="stylesheet" href="assets/style/admin.css">
  <link rel="stylesheet" href="assets/style/normalize.css">
</head>
<body>
<div class="admin-container">
<?php
$breadcrumbs = [
  ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
  ['title' => 'Фильмы', 'url' => '/admin/movies.php'],
  ['title' => 'Добавить фильм']
];
include __DIR__ . '/components/breadcrumbs.php';
?>
  <div class="admin-card">
    <h1 class="admin-section__header">Добавить фильм</h1>
    <?php if (!empty($error)): ?>
      <div class="admin-error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>
    <form class="admin-form" action="/admin/add-movie.php" method="POST" enctype="multipart/form-data">
      <label for="title">Название фильма</label>
      <input type="text" name="title" id="title" required>

      <label for="description">Описание</label>
      <textarea name="description" id="description" required></textarea>

      <div class="admin-form__row">
        <div>
          <label for="year">Год</label>
          <input type="number" name="year" id="year" min="1900" max="2100" required>
        </div>
        <div>
          <label for="duration">Длительность</label>
          <input type="text" name="duration" id="duration" placeholder="2ч 15м, 5 серий по 45 мин">
        </div>
      </div>

      <div class="admin-form__row">
        <div>
          <label for="rating">Рейтинг</label>
          <input type="number" step="0.1" name="rating" id="rating" min="0" max="10" value="0">
        </div>
        <div>
          <label for="genre">Жанр</label>
          <select name="genre_id" id="genre" required>
            <option value="">— выберите жанр —</option>
            <?php foreach ($genres as $g): ?>
              <option value="<?= $g['id'] ?>"><?= htmlspecialchars($g['name']) ?></option>
            <?php endforeach; ?>
          </select>
        </div>
      </div>

      <label for="poster_url">Ссылка на постер</label>
      <input type="url" name="poster_url" id="poster_url" placeholder="https://site.com/poster.jpg">

      <label for="cover_url">Ссылка на обложку</label>
      <input type="url" name="cover_url" id="cover_url" placeholder="https://site.com/cover.jpg">

      <label for="trailer_url">Ссылка на трейлер (YouTube)</label>
      <input type="url" name="trailer_url" id="trailer_url" placeholder="https://youtube.com/embed/xxxx">

      <label for="original_language">Язык оригинала</label>
      <input type="text" name="original_language" id="original_language">

      <label for="country">Страна</label>
      <input type="text" name="country" id="country">

      <div class="admin-form__row">
        <div>
          <label for="budget">Бюджет (₽)</label>
          <input type="number" name="budget" id="budget">
        </div>
        <div>
          <label for="box_office">Сборы (₽)</label>
          <input type="number" name="box_office" id="box_office">
        </div>
      </div>

      <label for="director">Режиссёр</label>
      <input type="text" name="director" id="director">

      <label for="production">Продюсер/Студия</label>
      <input type="text" name="production" id="production">

      <label for="awards">Награды</label>
      <textarea name="awards" id="awards"></textarea>

      <div class="admin-form__actions">
        <button type="submit" class="btn btn--primary">Добавить фильм</button>
        <a href="/admin/movies.php" class="btn btn--danger">Отмена</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>
