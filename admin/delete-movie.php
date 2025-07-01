<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

// Проверяем, что запрос — POST (безопасно)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)($_POST['id'] ?? 0);
    if ($id) {
        // Удаляем фильм с указанным id
        $stmt = $pdo->prepare("DELETE FROM movies WHERE id = ?");
        $stmt->execute([$id]);
    }
}
// После удаления возвращаемся на страницу списка фильмов
header('Location: /admin/movies.php');
exit;
