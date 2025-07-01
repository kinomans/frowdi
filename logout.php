<?php
require_once __DIR__ . '/includes/auth.php';

// Удаляем пользователя из сессии
unset($_SESSION['user']);

// Перенаправляем на главную
header('Location: /pages/home.php');
exit;
