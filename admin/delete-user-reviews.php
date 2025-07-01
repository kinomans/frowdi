<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['user_id'])) {
    $userId = (int)$_POST['user_id'];
    $pdo->prepare("DELETE FROM reviews WHERE user_id = ?")->execute([$userId]);
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;
