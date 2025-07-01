<?php
require_once '../config/db.php';

$genreId = (int)($_GET['id'] ?? 0);
$page = max(1, (int)($_GET['page'] ?? 1));
$limit = 12;
$offset = ($page - 1) * $limit;

// Проверка жанра
$stmtGenre = $pdo->prepare("SELECT name FROM genres WHERE id = ?");
$stmtGenre->execute([$genreId]);
$genre = $stmtGenre->fetch();

if (!$genre) {
  echo '<p class="genre-page__empty">Жанр не найден.</p>';
  exit;
}

// Получаем фильмы по жанру
$stmt = $pdo->prepare("SELECT * FROM movies WHERE genre_id = ? LIMIT $limit OFFSET $offset");
$stmt->execute([$genreId]);
$movies = $stmt->fetchAll();

// Подсчёт общего количества фильмов
$countStmt = $pdo->prepare("SELECT COUNT(*) FROM movies WHERE genre_id = ?");
$countStmt->execute([$genreId]);
$totalMovies = $countStmt->fetchColumn();
$totalPages = ceil($totalMovies / $limit);

// HTML карточек
if (count($movies) === 0) {
  echo '<p class="genre-page__empty">Фильмы этого жанра пока не добавлены.</p>';
} else {
  echo '<div class="genre-page__list">';
  foreach ($movies as $movie) {
    echo '<div class="movie-card">';
    echo '<a href="/pages/movie.php?id=' . $movie['id'] . '">';
    echo '<img src="' . htmlspecialchars($movie['poster_url']) . '" alt="' . htmlspecialchars($movie['title']) . '">';
    echo '<h2>' . htmlspecialchars($movie['title']) . '</h2>';
    echo '<p>' . htmlspecialchars($movie['year']) . ' • ' . htmlspecialchars($movie['duration']) . '</p>';
    echo '</a>';
    echo '</div>';
  }
  echo '</div>';

  // Пагинация
  if ($totalPages > 1) {
    echo '<div class="pagination">';
    for ($i = 1; $i <= $totalPages; $i++) {
      $activeClass = ($i === $page) ? 'active' : '';
      echo '<a href="#" class="pagination__link ' . $activeClass . '" data-page="' . $i . '">' . $i . '</a>';
    }
    echo '</div>';
  }
}
?>
