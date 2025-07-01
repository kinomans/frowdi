<?php
require_once '../config/db.php';

$query = $_GET['q'] ?? '';
$query = trim($query);

if (strlen($query) < 1) {
    echo json_encode([]);
    exit;
}

$stmt = $pdo->prepare("
  SELECT 
    m.id, m.title, m.year, m.duration, m.rating, 
    g.name AS genre, m.poster_url
  FROM movies m
  LEFT JOIN genres g ON m.genre_id = g.id
  WHERE m.title LIKE ?
  LIMIT 5
");
$stmt->execute(["%$query%"]);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($results);
?>
