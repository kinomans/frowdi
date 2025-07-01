<?php
header('Content-Type: application/json');
session_start();
require_once '../config/db.php';

// Проверка авторизации
$userId = $_SESSION['user']['id'] ?? null;
$movieId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if (!$userId) {
    echo json_encode(['success' => false, 'message' => 'Вы не авторизованы']);
    exit;
}
if (!$movieId) {
    exit;
}

// Проверка, есть ли уже фильм в избранном
$stmt = $pdo->prepare("SELECT * FROM favorites WHERE user_id = ? AND movie_id = ?");
$stmt->execute([$userId, $movieId]);
$exists = $stmt->fetch();

if ($exists) {
    // Удалить из избранного
    $stmt = $pdo->prepare("DELETE FROM favorites WHERE user_id = ? AND movie_id = ?");
    $stmt->execute([$userId, $movieId]);
    echo json_encode(['success' => true, 'action' => 'removed']);
    exit;
} else {
    // Добавить в избранное
    $stmt = $pdo->prepare("INSERT INTO favorites (user_id, movie_id) VALUES (?, ?)");
    $stmt->execute([$userId, $movieId]);
    echo json_encode(['success' => true, 'action' => 'added']);
    exit;
}
