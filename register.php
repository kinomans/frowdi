<?php
session_start();
require_once __DIR__ . '/config/db.php';

header('Content-Type: text/plain; charset=utf-8');

// Получаем данные из POST
$email = trim($_POST['email'] ?? '');
$name = trim($_POST['name'] ?? '');
$surname = trim($_POST['surname'] ?? '');
$password = trim($_POST['password'] ?? '');
$confirm_password = trim($_POST['confirm_password'] ?? '');

// Валидация
if (!$email || !$name || !$surname || !$password || !$confirm_password) {
    http_response_code(400);
    echo 'Все поля обязательны';
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo 'Неверный формат email';
    exit;
}

if ($password !== $confirm_password) {
    http_response_code(400);
    echo 'Пароли не совпадают';
    exit;
}

// Проверка, существует ли пользователь
$stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
$stmt->execute([$email]);

if ($stmt->fetch()) {
    http_response_code(400);
    echo 'Пользователь с таким email уже существует';
    exit;
}

// Хэширование и сохранение
$password_hash = password_hash($password, PASSWORD_DEFAULT);

$stmt = $pdo->prepare("INSERT INTO users (email, name, surname, password_hash) VALUES (?, ?, ?, ?)");

try {
    $stmt->execute([$email, $name, $surname, $password_hash]);
    $_SESSION['user'] = [
        'id' => $pdo->lastInsertId(),
        'email' => $email,
        'name' => $name,
        'surname' => $surname
    ];
    echo "OK"; // это обрабатывается в fetch() JS
} catch (Exception $e) {
    http_response_code(500);
    echo 'Ошибка при сохранении: ' . $e->getMessage();
}
?>