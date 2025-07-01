<?php
require_once '../components/header.php';
require_once '../config/db.php';

$genreId = (int)($_GET['id'] ?? 0);
if (!$genreId) {
  echo "<p>Жанр не найден</p>";
  exit;
}

// Получаем жанр
$stmtGenre = $pdo->prepare("SELECT name FROM genres WHERE id = ?");
$stmtGenre->execute([$genreId]);
$genre = $stmtGenre->fetch();

if (!$genre) {
  echo "<p>Жанр не найден</p>";
  exit;
}

// Получаем фильмы этого жанра
$stmtMovies = $pdo->prepare("SELECT * FROM movies WHERE genre_id = ?");
$stmtMovies->execute([$genreId]);
$movies = $stmtMovies->fetchAll();
?>
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="/assets/css/genre.css">

<main class="genre-page">
  <div class="container">
    <h1 class="genre-page__title">Фильмы жанра: <?= htmlspecialchars($genre['name']) ?></h1>

    <?php if (empty($movies)): ?>
      <p class="genre-page__empty">Фильмы этого жанра пока не добавлены.</p>
    <?php else: ?>
      <div class="genre-page__list">
        <?php foreach ($movies as $movie): ?>
          <div class="movie-card">
            <a href="/pages/movie.php?id=<?= $movie['id'] ?>">
              <img src="<?= htmlspecialchars($movie['poster_url']) ?>" alt="<?= htmlspecialchars($movie['title']) ?>">
              <h2><?= htmlspecialchars($movie['title']) ?></h2>
              <p><?= htmlspecialchars($movie['year']) ?> • <?= htmlspecialchars($movie['duration']) ?></p>
            </a>
          </div>
        <?php endforeach; ?>
      </div>
    <?php endif; ?>
  </div>
</main>

<?php require_once '../components/footer.php'; ?>
