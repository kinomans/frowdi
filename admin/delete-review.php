<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['id'])) {
    $id = (int)$_POST['id'];
    $pdo->prepare("DELETE FROM reviews WHERE id=?")->execute([$id]);
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;
