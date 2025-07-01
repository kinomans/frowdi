<?php
require_once '../../config/db.php';
require_once '../../includes/auth.php';
header('Content-Type: application/json');

if (!isLoggedIn()) {
  http_response_code(401);
  echo json_encode(['success' => false]);
  exit;
}

$userId = $_SESSION['user']['id'];
$reviewId = (int)($_GET['id'] ?? 0);

$stmt = $pdo->prepare("DELETE FROM reviews WHERE id = ? AND user_id = ?");
$stmt->execute([$reviewId, $userId]);

echo json_encode(['success' => true]);