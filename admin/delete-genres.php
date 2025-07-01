<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Массовое удаление
    if (!empty($_POST['ids'])) {
        $ids = array_map('intval', $_POST['ids']);
        $placeholders = implode(',', array_fill(0, count($ids), '?'));
        $stmt = $pdo->prepare("DELETE FROM genres WHERE id IN ($placeholders)");
        $stmt->execute($ids);
    }
    // Одиночное удаление
    elseif (!empty($_POST['id'])) {
        $id = (int)$_POST['id'];
        $stmt = $pdo->prepare("DELETE FROM genres WHERE id = ?");
        $stmt->execute([$id]);
    }
}
header('Location: /admin/genres.php');
exit;

?>
