<?php
require_once __DIR__ . '/../includes/auth.php';
?>

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FROWDI</title>
  <link rel="stylesheet" href="/assets/css/main.css">
  <link rel="stylesheet" href="/assets/css/modals.css">
  <link rel="stylesheet" href="/assets/css/banner.css">
  <link rel="stylesheet" href="/assets/css/search.css">
  <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/awesomplete/1.1.5/awesomplete.min.css" />
</head>
<body>
<header class="header">
  <div class="container header__container">
    <div class="header__logo">
      <a href="../pages/home.php">
        <span class="logo-text">FROWDI</span>
      </a>
    </div>
    <nav class="header__nav">
      <a href="../pages/home.php" class="header__link">Главная</a>
      <a href="../pages/genres.php" class="header__link">Жанры</a>
    </nav>
    <div class="header__search">
  <input type="text" placeholder="Поиск" class="search__input" id="search">
</div>

    <?php if (isLoggedIn()): ?>
      <a href="/pages/profile.php" class="header__login-btn">
        <?= htmlspecialchars($_SESSION['user']['name']) ?>
      </a>
    <?php else: ?>
      <button class="header__login-btn btn-reset"  id="open-login">Войти</button>
    <?php endif; ?>
  </div>
</header>


<!-- Модальное окно -->
<div class="auth-modal" id="auth-modal">
  <div class="auth-modal__content">
    <button class="auth-modal__close" id="close-modal"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M10.5859 12.25L2.79297 4.45706L4.20718 3.04285L12.0001 10.8357L19.793 3.04285L21.2072 4.45706L13.4143 12.25L21.2072 20.0428L19.793 21.4571L12.0001 13.6642L4.20718 21.4571L2.79297 20.0428L10.5859 12.25Z" fill="black"/>
</svg></button>

    <!-- Логотип -->
    <div class="auth-modal__logo">
      <img src="/assets/images/logo.png" alt="Логотип">
    </div>

    <!-- Форма авторизации -->
    <div id="login-form" class="auth-form active">
      <form id="loginForm" method="POST" action="../login.php">
        <div class="auth-input-group">
          <div class="auth-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M21 3C21.5523 3 22 3.44772 22 4V20.0066C22 20.5552 21.5447 21 21.0082 21H2.9918C2.44405 21 2 20.5551 2 20.0066V19H20V7.3L12 14.5L2 5.5V4C2 3.44772 2.44772 3 3 3H21ZM8 15V17H0V15H8ZM5 10V12H0V10H5ZM19.5659 5H4.43414L12 11.8093L19.5659 5Z" fill="black" fill-opacity="0.4"/>
</svg>
          </div>
          <input type="email" name="email" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" placeholder="Электронная почта" required>
          <small class="auth-error-message"></small>
        </div>

        <div class="auth-input-group">
          <div class="auth-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M12.917 13C12.441 15.8377 9.973 18 7 18C3.68629 18 1 15.3137 1 12C1 8.68629 3.68629 6 7 6C9.973 6 12.441 8.16229 12.917 11H23V13H21V17H19V13H17V17H15V13H12.917ZM7 16C9.20914 16 11 14.2091 11 12C11 9.79086 9.20914 8 7 8C4.79086 8 3 9.79086 3 12C3 14.2091 4.79086 16 7 16Z" fill="black" fill-opacity="0.4"/>
</svg>          </div>
          <input type="password" name="password" minlength="5" title="Пароль должен содержать минимум 5 символов." placeholder="Пароль" required>
          <small class="auth-error-message"></small>
        </div>

        <button type="submit" class="auth-btn-primary">Войти</button>
        <p class="auth-toggle-form" id="to-register">Регистрация</p>
      </form>
    </div>

    <!-- Форма регистрации -->
    <div id="register-form" class="auth-form">
      <form id="registerForm" method="POST" action="/register.php">
        <h2 class="auth-form-title">Регистрация</h2>

        <div class="auth-input-group">
          <div class="auth-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M21 3.75C21.5523 3.75 22 4.19772 22 4.75V20.7566C22 21.3052 21.5447 21.75 21.0082 21.75H2.9918C2.44405 21.75 2 21.3051 2 20.7566V19.75H20V8.05L12 15.25L2 6.25V4.75C2 4.19772 2.44772 3.75 3 3.75H21ZM8 15.75V17.75H0V15.75H8ZM5 10.75V12.75H0V10.75H5ZM19.5659 5.75H4.43414L12 12.5593L19.5659 5.75Z" fill="black" fill-opacity="0.4"/>
</svg>
          </div>
          <input type="email" name="email" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" placeholder="Электронная почта" required>
          <small class="auth-error-message"></small>
        </div>

        <div class="auth-input-group">
          <div class="auth-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M4 22.75C4 18.3317 7.58172 14.75 12 14.75C16.4183 14.75 20 18.3317 20 22.75H18C18 19.4363 15.3137 16.75 12 16.75C8.68629 16.75 6 19.4363 6 22.75H4ZM12 13.75C8.685 13.75 6 11.065 6 7.75C6 4.435 8.685 1.75 12 1.75C15.315 1.75 18 4.435 18 7.75C18 11.065 15.315 13.75 12 13.75ZM12 11.75C14.21 11.75 16 9.96 16 7.75C16 5.54 14.21 3.75 12 3.75C9.79 3.75 8 5.54 8 7.75C8 9.96 9.79 11.75 12 11.75Z" fill="black" fill-opacity="0.4"/>
</svg></div>
          <input type="text" name="name" placeholder="Имя" pattern="^[А-Яа-яЁё\s]+$" required>
          <small class="auth-error-message"></small>
        </div>

        <div class="auth-input-group">
          <div class="auth-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M4 22.75C4 18.3317 7.58172 14.75 12 14.75C16.4183 14.75 20 18.3317 20 22.75H18C18 19.4363 15.3137 16.75 12 16.75C8.68629 16.75 6 19.4363 6 22.75H4ZM12 13.75C8.685 13.75 6 11.065 6 7.75C6 4.435 8.685 1.75 12 1.75C15.315 1.75 18 4.435 18 7.75C18 11.065 15.315 13.75 12 13.75ZM12 11.75C14.21 11.75 16 9.96 16 7.75C16 5.54 14.21 3.75 12 3.75C9.79 3.75 8 5.54 8 7.75C8 9.96 9.79 11.75 12 11.75Z" fill="black" fill-opacity="0.4"/>
</svg></div>
          <input type="text" name="surname" placeholder="Фамилия" pattern="^[А-Яа-яЁё\s]+$" required>
          <small class="auth-error-message"></small>
        </div>

        <div class="auth-input-group">
          <div class="auth-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M12.917 13.75C12.441 16.5877 9.973 18.75 7 18.75C3.68629 18.75 1 16.0637 1 12.75C1 9.43629 3.68629 6.75 7 6.75C9.973 6.75 12.441 8.91229 12.917 11.75H23V13.75H21V17.75H19V13.75H17V17.75H15V13.75H12.917ZM7 16.75C9.20914 16.75 11 14.9591 11 12.75C11 10.5409 9.20914 8.75 7 8.75C4.79086 8.75 3 10.5409 3 12.75C3 14.9591 4.79086 16.75 7 16.75Z" fill="black" fill-opacity="0.4"/>
</svg></div>
          <input type="password" name="password" minlength="5" title="Пароль должен содержать минимум 5 символов." placeholder="Пароль" required>
          <small class="auth-error-message"></small>
        </div>

        <div class="auth-input-group">
          <div class="auth-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
  <path d="M12.917 13.75C12.441 16.5877 9.973 18.75 7 18.75C3.68629 18.75 1 16.0637 1 12.75C1 9.43629 3.68629 6.75 7 6.75C9.973 6.75 12.441 8.91229 12.917 11.75H23V13.75H21V17.75H19V13.75H17V17.75H15V13.75H12.917ZM7 16.75C9.20914 16.75 11 14.9591 11 12.75C11 10.5409 9.20914 8.75 7 8.75C4.79086 8.75 3 10.5409 3 12.75C3 14.9591 4.79086 16.75 7 16.75Z" fill="black" fill-opacity="0.4"/>
</svg></div>
          <input type="password" name="confirm_password" placeholder="Подтвердите пароль" required>
          <small class="auth-error-message"></small>
        </div>

        <button type="submit" class="auth-btn-primary">Создать аккаунт</button>
        <p class="auth-toggle-form" id="to-login">У меня есть пароль</p>
      </form>
    </div>

    <!-- Экран успешной регистрации -->
    <div id="success-form" class="auth-form">
      <h2>Регистрация завершена</h2>
      <p>Используйте вашу электронную почту для входа</p>
      <button class="auth-btn-primary" id="success-login-btn">Войти</button>
    </div>
  </div>
</div>

<!-- Универсальное модальное окно трейлера, только одно на всю страницу -->
<div class="trailer-modal" id="trailer-modal">
  <div class="trailer-modal__overlay js-close-trailer-modal"></div>
  <div class="trailer-modal__content">
    <iframe src="" frameborder="0" allowfullscreen></iframe>
  </div>
  <!-- Крестик ВНЕ контента -->
  <button class="trailer-modal__close js-close-trailer-modal" aria-label="Закрыть">×</button>
</div>


