<?php require_once __DIR__ . '/includes/admin-check.php'; ?>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Админ-панель | Frowdi</title>
  <link rel="stylesheet" href="assets/style/admin.css">
  <link rel="stylesheet" href="assets/style/normalize.css">
</head>
<body>
<div class="admin-container">
  <div class="admin-breadcrumbs">
    <a href="/admin/dashboard.php">Админ-панель</a>
  </div>
  <div class="admin-card">
    <h1 class="admin-section__header">Добро пожаловать, администратор!</h1>
    <div class="admin-dashboard__links">
      <a class="btn btn--primary" href="/admin/movies.php">Управление фильмами</a>
      <a class="btn btn--primary" href="/admin/genres.php">Управление жанрами</a>
      <a class="btn btn--primary" href="/admin/users.php">Пользователи</a>
      <a class="btn btn--primary" href="/admin/reviews.php">Отзывы</a>
    </div>
    <!-- Кнопка выхода -->
    <button id="logout-btn" class="btn btn--danger" style="margin-top:28px;width:100%;">Выйти из аккаунта</button>
  </div>
</div>

<!-- Модалка подтверждения выхода -->
<div id="logout-modal" style="display:none;position:fixed;inset:0;z-index:9999;align-items:center;justify-content:center;">
  <div class="confirm-modal__overlay" style="position:fixed;inset:0;background:rgba(22,22,30,0.70);backdrop-filter:blur(3px);"></div>
  <div class="confirm-modal__content" style="background:#24242b;border:2px solid #B4A9FF;border-radius:20px;box-shadow:0 0 60px 0 rgba(180,169,255,0.18);padding:38px 38px 28px 38px;min-width:330px;max-width:95vw;text-align:center;z-index:2;">
    <div class="confirm-modal__text" style="font-size:20px;color:#fff;font-weight:600;margin-bottom:32px;letter-spacing:0.01em;">
      Вы действительно хотите выйти из аккаунта?
    </div>
    <div class="confirm-modal__actions" style="display:flex;gap:20px;justify-content:center;">
      <a href="/logout.php" class="confirm-modal__btn confirm-modal__btn--yes" style="font-size:16px;font-weight:600;padding:11px 32px;border-radius:13px;border:none;cursor:pointer;background:linear-gradient(90deg,#ff4665 80%,#B4A9FF 100%);color:#fff;box-shadow:0 2px 20px rgba(255,70,101,0.12);">Выйти</a>
      <button id="logout-cancel" class="confirm-modal__btn confirm-modal__btn--no" style="font-size:16px;font-weight:600;padding:11px 32px;border-radius:13px;border:none;cursor:pointer;background:#232333;color:#B4A9FF;">Отмена</button>
    </div>
  </div>
</div>
<script>
  const logoutBtn = document.getElementById('logout-btn');
  const logoutModal = document.getElementById('logout-modal');
  const logoutCancel = document.getElementById('logout-cancel');
  logoutBtn.addEventListener('click', function() {
    logoutModal.style.display = 'flex';
  });
  logoutCancel.addEventListener('click', function() {
    logoutModal.style.display = 'none';
  });
  logoutModal.querySelector('.confirm-modal__overlay').onclick = function() {
    logoutModal.style.display = 'none';
  }
</script>
</body>
</html>
