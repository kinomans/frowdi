<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Проверка, авторизован ли пользователь и является ли он админом
if (empty($_SESSION['user']) || empty($_SESSION['is_admin'])) {
    header('Location: /pages/home.php');
    exit;
}
