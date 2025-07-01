<?php
// random-movie-banner.php
// Получение одного случайного фильма
session_start(); // если ещё не вызван
require_once __DIR__ . '/../config/db.php'; // если не подключён

//Для цвета рейтинга

function getRatingClass($rating) {
  $rating = str_replace(',', '.', $rating);
  $rating = floatval($rating);

  if ($rating >= 8.6) {
      return 'rating--excellent'; // #A59400
  } elseif ($rating >= 7.5) {
      return 'rating--good';      // #308E21
  } elseif ($rating >= 6.3) {
      return 'rating--poor';      // #777
  } else {
      return 'rating--bullshit';  // #C82020
  }
}

$stmt = $pdo->query("
  SELECT m.*, g.name AS genre_name
  FROM movies m
  LEFT JOIN genres g ON m.genre_id = g.id
  ORDER BY RAND()
  LIMIT 1
");
$movie = $stmt->fetch();


$isFavorite = false;
require_once __DIR__ . '/../includes/auth.php';
if (isLoggedIn()) {
    $userId = $_SESSION['user']['id'];
    $stmt = $pdo->prepare("SELECT 1 FROM favorites WHERE user_id = ? AND movie_id = ?");
    $stmt->execute([$userId, $movie['id']]);
    $isFavorite = (bool) $stmt->fetchColumn();
}
?>

<section class="banner " id="random-banner">
  <div class="banner__loader" id="banner-loader">
  <span class="spinner"></span>
  </div>
  <div class="banner__container container">
    <div class="banner__info">
      <div class="banner__meta">
      <span class="banner__meta-txt banner__rating <?= getRatingClass($movie['rating']) ?>">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
  <path d="M8.00105 12.1734L3.29875 14.8055L4.34897 9.51997L0.392578 5.86124L5.74394 5.22675L8.00105 0.333374L10.2581 5.22675L15.6095 5.86124L11.6531 9.51997L12.7033 14.8055L8.00105 12.1734Z" fill="white"/>
</svg> <?= htmlspecialchars($movie['rating']) ?>
</span>

        <span class="banner__meta-txt banner__year"><?= htmlspecialchars($movie['year'] ?? 'Год?') ?></span>
        <span class="banner__meta-txt banner__genre"><?= htmlspecialchars($movie['genre_name'] ?? 'Жанр?') ?></span>
        <span class="banner__meta-txt banner__duration"><?= htmlspecialchars($movie['duration'] ?? '—') ?></span>
      </div>

      <h1 class="banner__title">
        <a href="../pages/movie.php?id=<?= $movie['id']; ?>">
          <?= htmlspecialchars($movie['title']) ?>
        </a>
      </h1>

      <p class="banner__description">
        <?= htmlspecialchars($movie['description']) ?>
      </p>

      <div class="banner__buttons">
        <button class="btn btn--light js-open-trailer" data-trailer="<?= $movie['trailer_url'] ?>">Смотреть</button>
        <a href="../pages/movie.php?id=<?= $movie['id']; ?>" class="btn btn--dark">О фильме</a>
        <button
  class="favorite-btn  btn--icon js-toggle-favorite <?= $isFavorite ? 'active' : '' ?>"
  data-id="<?= $movie['id']; ?>"
>
  <img src="/assets/icons/heart.svg" alt="Избранное">
</button>


        <button class=" btn--icon js-refresh-random">
          <img src="/assets/icons/refresh.svg" alt="Обновить фильм">
        </button>
      </div>
    </div>

    <div class="banner__image">
      <img src="<?= htmlspecialchars($movie['cover_url']) ?>" alt="<?= htmlspecialchars($movie['title']) ?>">
    </div>
  </div>
</section>


