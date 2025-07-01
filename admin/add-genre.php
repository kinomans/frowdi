<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $image = trim($_POST['image'] ?? '');
    if ($name !== '') {
      $stmt = $pdo->prepare("INSERT INTO genres (name, image) VALUES (?, ?)");
      $stmt->execute([$name, $image]);
      header('Location: /admin/genres.php');
      exit;
    }
  }
?>
<link rel="stylesheet" href="assets/style/admin.css">
<link rel="stylesheet" href="assets/style/normalize.css">
<main class="admin-main">
  <?php
    $breadcrumbs = [
      ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
      ['title' => 'Жанры', 'url' => '/admin/genres.php'],
      ['title' => 'Добавить жанр']
    ];
    include __DIR__ . '/components/breadcrumbs.php';
  ?>
  <h1>Добавить жанр</h1>
  <form method="POST" class="admin-form">
    <label>Название жанра:</label>
    <input type="text" name="name" required>

    <label>URL картинки жанра:</label>
    <input type="text" name="image" placeholder="https://...">

    <button class="admin-btn admin-btn--primary" type="submit">Сохранить</button>
  </form>
</main>
