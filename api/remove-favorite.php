<?php
require_once '../config/db.php';
require_once '../includes/auth.php';
header('Content-Type: application/json');

if (!isLoggedIn()) {
  http_response_code(401);
  echo json_encode(['success' => false, 'message' => 'Неавторизован']);
  exit;
}

$data = json_decode(file_get_contents("php://input"), true);
$movieId = (int)($data['movieId'] ?? 0);

if (!$movieId) {
  echo json_encode(['success' => false, 'message' => 'Некорректный ID']);
  exit;
}

$userId = $_SESSION['user']['id'];

$stmt = $pdo->prepare("DELETE FROM favorites WHERE user_id = ? AND movie_id = ?");
$stmt->execute([$userId, $movieId]);

echo json_encode(['success' => true]);
