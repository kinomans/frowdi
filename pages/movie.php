<?php
require_once '../components/header.php';
require_once '../config/db.php';
require_once '../includes/utils.php';
require_once '../includes/auth.php';

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

$id = (int)($_GET['id'] ?? 0);
if (!$id) {
  echo "<p>Фильм не найден</p>";
  exit;
}

$stmt = $pdo->prepare("
  SELECT m.*, g.name AS genre_name
  FROM movies m
  LEFT JOIN genres g ON m.genre_id = g.id
  WHERE m.id = ?
");
$stmt->execute([$id]);
$movie = $stmt->fetch();


if (!$movie) {
  echo "<p>Фильм не найден</p>";
  exit;
}

$isFavorite = false;
if (isLoggedIn()) {
  $stmt = $pdo->prepare("SELECT 1 FROM favorites WHERE user_id = ? AND movie_id = ?");
  $stmt->execute([$_SESSION['user']['id'], $movie['id']]);
  $isFavorite = $stmt->fetch() ? true : false;
}
?>

<link rel="stylesheet" href="/assets/css/movie.css">

<main class="movie-page">
  <div class="container movie-page__container">
    <!-- Левая часть: текст -->
    <div class="movie-page__info">
      <div class="movie-page__meta">
      <span class="banner__rating movie-page__rating <?= getRatingClass($movie['rating']) ?>">
  ★ <?= htmlspecialchars($movie['rating']) ?>
</span>


        <span><?= htmlspecialchars($movie['year']) ?></span>
        <span><?= htmlspecialchars($movie['genre_name'] ?? 'Жанр не указан') ?></span>
        <span><?= htmlspecialchars($movie['duration']) ?></span>
      </div>

      <h1 class="movie-page__title"><?= htmlspecialchars($movie['title']) ?></h1>
      <p class="movie-page__description"><?= formatMultilineText($movie['description']) ?></p>

      <div class="movie-page__actions">
        <button class="btn btn--trailer js-open-trailer" data-trailer="<?= $movie['trailer_url'] ?>">Смотреть</button>
        <button class="favorite-btn js-toggle-favorite <?= $isFavorite ? 'active' : '' ?>" data-id="<?= $movie['id'] ?>">
          <img src="/assets/icons/heart.svg" alt="Избранное">
        </button>
      </div>

      <div class="movie-page__section">
        <h2 class="movie-page__section-title">О фильме</h2>
        <div class="movie-page__details">
          <div class="movie-page__details-row">
            <span>Язык оригинала</span>
            <span><?= formatField($movie['original_language']) ?></span>
          </div>
          <div class="movie-page__details-row">
            <span>Бюджет</span>
            <span><?= formatNumber($movie['budget']) ?></span>
          </div>
          <div class="movie-page__details-row">
            <span>Выручка</span>
            <span><?= formatNumber($movie['revenue']) ?></span>
          </div>
          <div class="movie-page__details-row">
            <span>Режиссёр</span>
            <span><?= formatField($movie['director']) ?></span>
          </div>
          <div class="movie-page__details-row">
            <span>Продакшен</span>
            <span><?= formatField($movie['producer']) ?></span>
          </div>
          <div class="movie-page__details-row">
            <span>Награды</span>
            <span><?= formatField($movie['awards']) ?></span>
          </div>
        </div>
      </div>
    </div>

    <!-- Правая часть: обложка -->
    <div class="movie-page__poster">
      <img src="<?= htmlspecialchars($movie['cover_url']) ?>" alt="<?= htmlspecialchars($movie['title']) ?>">
    </div>


  </div>
  <section id="review-section" data-movie-id="<?= $movie['id'] ?>" class="review-section">
  <div class="container review-section-block">
    <h2 class="movie-page__section-title">Отзывы</h2>

    <?php if (isLoggedIn()): ?>
      <div class="review-form-block">
        <div class="review-form-title">Оставить отзыв</div>
        <form id="review-form" class="review-form">
          <label for="rating">Оценка:</label>
          <select name="rating" required>
            <option value="">—</option>
            <?php for ($i = 10; $i >= 1; $i--): ?>
              <option value="<?= $i ?>"><?= $i ?></option>
            <?php endfor; ?>
          </select>

          <label for="comment">Комментарий:</label>
          <textarea name="comment" placeholder="Напишите ваш отзыв..." required></textarea>
          <button type="submit" class="btn">Оставить отзыв</button>
        </form>
      </div>
    <?php else: ?>
      <p class="review-login-note">Авторизуйтесь, чтобы оставить отзыв</p>
    <?php endif; ?>

    <div id="reviews-container" class="reviews-list"></div>
  </div>
</section>

</main>

<?php require_once '../components/footer.php'; ?>
