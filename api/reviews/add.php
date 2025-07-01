<?php
require_once '../../config/db.php';
require_once '../../includes/auth.php';
header('Content-Type: application/json');

if (!isLoggedIn()) {
  http_response_code(401);
  echo json_encode(['success' => false, 'message' => 'Требуется авторизация']);
  exit;
}

$userId = $_SESSION['user']['id'];
$data = json_decode(file_get_contents("php://input"), true);
$movieId = (int)($data['movie_id'] ?? 0);
$rating = (int)($data['rating'] ?? 0);
$comment = trim($data['comment'] ?? '');

if (!$movieId || $rating < 1 || $rating > 10) {
  echo json_encode(['success' => false, 'message' => 'Неверные данные']);
  exit;
}

$stmt = $pdo->prepare("SELECT id FROM reviews WHERE user_id = ? AND movie_id = ?");
$stmt->execute([$userId, $movieId]);
$exists = $stmt->fetch();

if ($exists) {
  $stmt = $pdo->prepare("UPDATE reviews SET rating = ?, comment = ?, created_at = NOW() WHERE id = ?");
  $stmt->execute([$rating, $comment, $exists['id']]);
} else {
  $stmt = $pdo->prepare("INSERT INTO reviews (user_id, movie_id, rating, comment) VALUES (?, ?, ?, ?)");
  $stmt->execute([$userId, $movieId, $rating, $comment]);
}

echo json_encode(['success' => true, 'message' => 'Отзыв сохранён']);
