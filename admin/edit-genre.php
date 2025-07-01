<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

$id = (int)($_GET['id'] ?? 0);
$stmt = $pdo->prepare("SELECT * FROM genres WHERE id = ?");
$stmt->execute([$id]);
$genre = $stmt->fetch();
if (!$genre) die('Жанр не найден');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $image = trim($_POST['image'] ?? '');

    if ($name !== '') {
      $stmt = $pdo->prepare("UPDATE genres SET name = ?, image = ? WHERE id = ?");
      $stmt->execute([$name, $image, $id]);
      header('Location: /admin/genres.php');
      exit;
    }
  }


?>
  <link rel="stylesheet" href="assets/style/admin.css">
  <link rel="stylesheet" href="assets/style/normalize.css">
  <main class="admin-main">
  <div class="admin-container">
    <?php
  $breadcrumbs = [
    ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
    ['title' => 'Жанры', 'url' => '/admin/genres.php'],
    ['title' => 'Редактировать жанр']
  ];
  include __DIR__ . '/components/breadcrumbs.php';
  ?>
  <h1>Редактировать жанр</h1>
  <form method="POST" class="admin-form">
    <label>Название жанра:</label>
    <input type="text" name="name" value="<?= htmlspecialchars($genre['name']) ?>" required>

    <label>URL картинки жанра:</label>
    <input type="text" name="image" value="<?= htmlspecialchars($genre['image']) ?>" placeholder="https://...">

    <?php if (!empty($genre['image'])): ?>
      <div style="margin-bottom:10px;">
        <img src="<?= htmlspecialchars($genre['image']) ?>" alt="Текущая картинка" style="height:50px;max-width:100px;object-fit:cover;">
      </div>
    <?php endif; ?>

    <button class="admin-btn admin-btn--primary" type="submit">Сохранить</button>
  </form>
  </div>
</main>
