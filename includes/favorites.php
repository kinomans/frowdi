<?php
require_once __DIR__ . '/../config/db.php';

function getFavorites($userId) {
    global $pdo;

    $stmt = $pdo->prepare("
        SELECT m.*
        FROM favorites f
        JOIN movies m ON f.movie_id = m.id
        WHERE f.user_id = ?
    ");
    $stmt->execute([$userId]);

    return $stmt->fetchAll();
}

function addFavorite($userId, $movieId) {
    global $pdo;
    $stmt = $pdo->prepare("INSERT IGNORE INTO favorites (user_id, movie_id) VALUES (?, ?)");
    return $stmt->execute([$userId, $movieId]);
}

function removeFavorite($userId, $movieId) {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM favorites WHERE user_id = ? AND movie_id = ?");
    return $stmt->execute([$userId, $movieId]);
}
?>