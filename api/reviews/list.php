<?php
require_once '../../config/db.php';
require_once '../../includes/auth.php'; // чтобы использовать isLoggedIn()
header('Content-Type: application/json');

$movieId = (int)($_GET['movie_id'] ?? 0);
if (!$movieId) {
  echo json_encode([]);
  exit;
}

$isLoggedIn = isLoggedIn();
$currentUserId = $isLoggedIn ? $_SESSION['user']['id'] : null;

$stmt = $pdo->prepare("
  SELECT r.*, u.name, u.surname
  FROM reviews r
  JOIN users u ON r.user_id = u.id
  WHERE r.movie_id = ?
  ORDER BY r.created_at DESC
");
$stmt->execute([$movieId]);
$reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Добавим поле can_delete для каждого отзыва
foreach ($reviews as &$r) {
  $r['can_delete'] = $isLoggedIn && $r['user_id'] == $currentUserId;
}

echo json_encode($reviews);
