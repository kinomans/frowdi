<?php
require_once __DIR__ . '/../config/db.php';

$genreId = (int)($_GET['id'] ?? 0);
$page = max(1, (int)($_GET['page'] ?? 1));
$limit = 12;
$offset = ($page - 1) * $limit;

$stmt = $pdo->prepare("SELECT * FROM movies WHERE genre_id = ? LIMIT $limit OFFSET $offset");
$stmt->execute([$genreId]);
$movies = $stmt->fetchAll();

if (count($movies) === 0) {
  echo ''; // ничего не возвращаем, чтобы скрыть кнопку
  exit;
}

foreach ($movies as $movie) {
  ?>
  <div class="movie-card">
    <a href="/pages/movie.php?id=<?= $movie['id'] ?>">
      <img src="<?= htmlspecialchars($movie['poster_url']) ?>" alt="<?= htmlspecialchars($movie['title']) ?>">
      <h2><?= htmlspecialchars($movie['title']) ?></h2>
      <p><?= htmlspecialchars($movie['year']) ?> • <?= htmlspecialchars($movie['duration']) ?></p>
    </a>
  </div>
  <?php
}
