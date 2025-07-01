<?php
require_once __DIR__ . '/../includes/favorites.php';
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
if (!isLoggedIn()) {
  header('Location: /pages/home.php');
  exit;
}
require_once __DIR__ . '/../components/header.php';

$user = $_SESSION['user'];
$favorites = getFavorites($user['id']);
?>

<link rel="stylesheet" href="/assets/css/profile.css">
<main class="profile">
  <div class="container">
    <h1 class="profile__title">Мой аккаунт</h1>

    <div class="profile__tabs">
      <button class="profile__tab profile__tab--active" data-tab="favorites">
        <img src="/assets/icons/heart.svg" alt=""> Избранные фильмы
      </button>
      <button class="profile__tab" data-tab="settings">
        <img src="/assets/icons/user.svg" alt=""> Настройка аккаунта
      </button>
      <button class="profile__tab" data-tab="reviews">
        <img src="/assets/icons/review.svg" alt=""> Мои отзывы
      </button>
    </div>

    <div class="profile__content">
      <!-- Вкладка Избранные фильмы -->
      <div class="profile__section profile__section--active" id="tab-favorites">
        <?php if (count($favorites) === 0): ?>
          <p class="profile__empty">У вас пока нет избранных фильмов.</p>
        <?php else: ?>
          <div class="profile__movies">
            <?php foreach ($favorites as $movie): ?>
              <div class="movie-card">
              <a href="/pages/movie.php?id=<?= $movie['id'] ?>">
    <img src="<?= htmlspecialchars($movie['poster_url']) ?>" alt="<?= htmlspecialchars($movie['title']) ?>">
  </a>
                <button class="movie-card__remove" data-id="<?= $movie['id'] ?>">&times;</button>
              </div>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>
      </div>

      <!-- Вкладка Настройки аккаунта -->
      <div class="profile__section" id="tab-settings">
        <div class="profile__info">
          <div class="profile__row">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="22" viewBox="0 0 16 22" fill="none">
  <path d="M0 21.75C0 17.3317 3.58172 13.75 8 13.75C12.4183 13.75 16 17.3317 16 21.75H14C14 18.4363 11.3137 15.75 8 15.75C4.68629 15.75 2 18.4363 2 21.75H0ZM8 12.75C4.685 12.75 2 10.065 2 6.75C2 3.435 4.685 0.75 8 0.75C11.315 0.75 14 3.435 14 6.75C14 10.065 11.315 12.75 8 12.75ZM8 10.75C10.21 10.75 12 8.96 12 6.75C12 4.54 10.21 2.75 8 2.75C5.79 2.75 4 4.54 4 6.75C4 8.96 5.79 10.75 8 10.75Z" fill="white"/>
</svg> <div>
              <div class="profile__label">Имя Фамилия</div>
              <div class="profile__value"><?= htmlspecialchars($user['name'] . ' ' . $user['surname']) ?></div>
            </div>
          </div>

          <div class="profile__row">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M21 3C21.5523 3 22 3.44772 22 4V20.0066C22 20.5552 21.5447 21 21.0082 21H2.9918C2.44405 21 2 20.5551 2 20.0066V19H20V7.3L12 14.5L2 5.5V4C2 3.44772 2.44772 3 3 3H21ZM8 15V17H0V15H8ZM5 10V12H0V10H5ZM19.5659 5H4.43414L12 11.8093L19.5659 5Z" fill="white"/>
</svg>            <div>
              <div class="profile__label">Электронная почта</div>
              <div class="profile__value"><?= htmlspecialchars($user['email']) ?></div>
            </div>
          </div>
        </div>

        <a href="/logout.php" class="profile__logout">Выйти из аккаунта</a>
      </div>

      <div class="profile__section" id="tab-reviews">
  <div class="profile__reviews">
    <?php
    $stmt = $pdo->prepare("
      SELECT r.*, m.title, m.id AS movie_id, m.cover_url
      FROM reviews r
      JOIN movies m ON r.movie_id = m.id
      WHERE r.user_id = ?
      ORDER BY r.created_at DESC
    ");
    $stmt->execute([$user['id']]);
    $myReviews = $stmt->fetchAll();
    ?>

    <?php if (!$myReviews): ?>
      <p class="profile__empty">Вы пока не оставляли отзывов.</p>
    <?php else:
      foreach ($myReviews as $review): ?>
        <div class="review-card" data-id="<?= $review['id'] ?>" data-movie-id="<?= $review['movie_id'] ?>">
          <div class="review-card__content">
            <a href="/pages/movie.php?id=<?= $review['movie_id'] ?>" class="review-card__image">
              <img src="<?= htmlspecialchars($review['cover_url']) ?>" alt="<?= htmlspecialchars($review['title']) ?>">
            </a>

            <div class="review-card__info">
              <div class="review-card__header">
                <a href="/pages/movie.php?id=<?= $review['movie_id'] ?>" class="review-card__title"><?= htmlspecialchars($review['title']) ?></a>
                <span class="review-card__rating" data-rating="<?= $review['rating'] ?>">★ <?= $review['rating'] ?></span>
              </div>
              <p class="review-card__comment"><?= nl2br(htmlspecialchars($review['comment'])) ?></p>

              <div class="review-card__actions">
                <form method="POST" class="review-card__delete-form" data-id="<?= $review['id'] ?>">
                  <button type="submit" class="review-card__delete">Удалить</button>
                </form>
                <button type="button" class="review-card__edit-btn">Редактировать</button>
              </div>
            </div>
          </div>
        </div>
      <?php endforeach;
    endif; ?>
  </div>
</div>

      <div class="toast-container" id="toast-container"></div>
    </div>
  </div>
</main>
<script src="/assets/js/profile.js"></script>
<?php require_once __DIR__ . '/../components/footer.php'; ?>
