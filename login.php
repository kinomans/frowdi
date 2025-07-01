<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/auth.php';

header('Content-Type: application/json');
session_start();

$email = trim($_POST['email'] ?? '');
$password = trim($_POST['password'] ?? '');

if (!$email || !$password) {
    echo json_encode(['success' => false, 'message' => 'Заполните все поля']);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if (!$user || !password_verify($password, $user['password_hash'])) {
    echo json_encode(['success' => false, 'message' => 'Неверный email или пароль']);
    exit;
}

// Сохраняем пользователя в сессию
$_SESSION['user'] = [
    'id' => $user['id'],
    'email' => $user['email'],
    'name' => $user['name'],
    'surname' => $user['surname']
];

// Если это админ — добавляем флаг и редиректим в админку
if (!empty($user['is_admin'])) {
    $_SESSION['is_admin'] = true;
    echo json_encode(['success' => true, 'redirect' => '/admin/dashboard.php']);
    exit;
}

// Обычный пользователь — редиректим на главную
echo json_encode(['success' => true, 'redirect' => '/pages/home.php']);
exit;

