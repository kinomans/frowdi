<?php 
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

// Фильтрация
$filter = trim($_GET['filter'] ?? '');
$sql = "SELECT * FROM genres";
$params = [];
if ($filter !== '') {
    $sql .= " WHERE name LIKE ?";
    $params[] = "%$filter%";
}
$sql .= " ORDER BY id DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$genres = $stmt->fetchAll();
?>
  <link rel="stylesheet" href="assets/style/admin.css">
  <main class="admin-main">
    <div class="admin-container">
      <?php
      $breadcrumbs = [
        ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
        ['title' => 'Жанры']
      ];
      include __DIR__ . '/components/breadcrumbs.php';
      ?>
    <h1>Управление жанрами</h1>
  <!-- Фильтр по названию -->
  <form class="admin-filter" method="get" style="margin-bottom:18px;display:flex;gap:10px;">
    <input type="text" name="filter" placeholder="Фильтр по названию..." value="<?= htmlspecialchars($filter) ?>" class="admin-input" style="width:220px;">
    <button type="submit" class="admin-btn admin-btn--primary">Поиск</button>
    <?php if ($filter): ?>
      <a href="/admin/genres.php" class="admin-btn admin-btn--small">Сбросить</a>
    <?php endif; ?>
    <a href="/admin/add-genre.php" class="admin-btn admin-btn--primary">Добавить жанр</a>
  </form>

  <form method="post" action="/admin/delete-genres.php" id="bulk-delete-form">
  <div class="admin-table-wrap">
    <table class="admin-table">
      <thead>
        <tr>
          <th style="width:30px;"><input type="checkbox" id="check-all"></th>
          <th>ID</th>
          <th>Название</th>
          <th>Картинка</th> <!-- Новая колонка! -->
          <th>Действия</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($genres as $genre): ?>
        <tr>
          <td><input type="checkbox" name="ids[]" value="<?= $genre['id'] ?>"></td>
          <td><?= $genre['id'] ?></td>
          <td><?= htmlspecialchars($genre['name']) ?></td>
          <td>
            <?php if (!empty($genre['image'])): ?>
              <img src="<?= htmlspecialchars($genre['image']) ?>" alt="Картинка жанра" style="height:40px;max-width:80px;object-fit:cover;">
            <?php else: ?>
              <span style="color:#999;">Нет</span>
            <?php endif; ?>
          </td>
          <td>
            <a href="/admin/edit-genre.php?id=<?= $genre['id'] ?>" class="admin-btn admin-btn--small">✎</a>
            <form method="POST" action="/admin/delete-genres.php" style="display:inline;" onsubmit="return confirm('Удалить жанр?');">
              <input type="hidden" name="id" value="<?= $genre['id'] ?>">
              <button type="submit" class="admin-btn admin-btn--danger admin-btn--small">✖</button>
            </form>
          </td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
  <button type="submit" class="admin-btn admin-btn--danger" style="margin-top:10px;" onclick="return confirm('Удалить выбранные жанры?')">Удалить выбранные</button>
  </form>
  </div>
</main>

<script>
  // Чекбокс "Выбрать все"
  document.getElementById('check-all').addEventListener('change', function(){
    document.querySelectorAll('input[name="ids[]"]').forEach(ch => ch.checked = this.checked);
  });
</script>
