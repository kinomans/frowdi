<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

// Параметры пагинации
$page = max(1, (int)($_GET['page'] ?? 1));
$limit = 10; // сколько фильмов на страницу
$offset = ($page - 1) * $limit;

// Фильтр по названию и жанру
$where = [];
$params = [];

if (!empty($_GET['q'])) {
  $where[] = "m.title LIKE ?";
  $params[] = "%" . $_GET['q'] . "%";
}
if (!empty($_GET['genre'])) {
  $where[] = "m.genre_id = ?";
  $params[] = $_GET['genre'];
}
$whereSql = $where ? ("WHERE " . implode(" AND ", $where)) : "";

// Получаем жанры для фильтра
$allGenres = $pdo->query("SELECT id, name FROM genres ORDER BY name")->fetchAll(PDO::FETCH_ASSOC);

// Считаем общее количество для пагинации
$countStmt = $pdo->prepare("SELECT COUNT(*) FROM movies m $whereSql");
$countStmt->execute($params);
$total = $countStmt->fetchColumn();
$totalPages = ceil($total / $limit);

// Получаем фильмы
$sql = "SELECT m.*, g.name AS genre_name FROM movies m LEFT JOIN genres g ON m.genre_id = g.id $whereSql ORDER BY m.id DESC LIMIT $limit OFFSET $offset";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$movies = $stmt->fetchAll();
?>


<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Админка — Фильмы</title>
  <link rel="stylesheet" href="assets/style/admin.css">
  </head>
<body>
  <div class="admin-container">
  <?php
$breadcrumbs = [
  ['title' => 'Админ-панель', 'url' => '/admin/dashboard.php'],
  ['title' => 'Фильмы']
];
include __DIR__ . '/components/breadcrumbs.php';
?>
    <h1>Управление фильмами</h1>

    <form method="get" class="admin-filter" style="margin-bottom:18px;display:flex;gap:10px;">
      <input type="text" name="q" placeholder="Поиск по названию..." value="<?= htmlspecialchars($_GET['q'] ?? '') ?>" style="width:220px;">
      <select name="genre" style="padding:6px;">
        <option value="">Все жанры</option>
        <?php foreach ($allGenres as $g): ?>
          <option value="<?= $g['id'] ?>" <?= (isset($_GET['genre']) && $_GET['genre'] == $g['id']) ? 'selected' : '' ?>>
            <?= htmlspecialchars($g['name']) ?>
          </option>
        <?php endforeach; ?>
      </select>
      <button type="submit" class="admin-btn admin-btn--primary">Найти</button>
      <a href="movies.php" class="admin-btn admin-btn--primary">Сбросить</a>
      <a href="add-movie.php" class="admin-btn admin-btn--primary btn--add">Добавить фильм</a>
    </form>

    <table class="admin-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Постер</th>
          <th>Название</th>
          <th>Год</th>
          <th>Жанр</th>
          <th>Рейтинг</th>
          <th>Действия</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($movies as $movie): ?>
          <tr>
            <td><?= $movie['id'] ?></td>
            <td><img src="<?= htmlspecialchars($movie['poster_url']) ?>" alt="" style="height: 70px;"></td>
            <td><?= htmlspecialchars($movie['title']) ?></td>
            <td><?= htmlspecialchars($movie['year']) ?></td>
            <td><?= htmlspecialchars($movie['genre_name']) ?></td>
            <td><?= htmlspecialchars($movie['rating']) ?></td>
            <td>
              <a href="edit-movie.php?id=<?= $movie['id'] ?>" class="btn btn--small">Редактировать</a>
              <form action="delete-movie.php" method="POST" style="display:inline;" onsubmit="return confirm('Удалить фильм?');">
                <input type="hidden" name="id" value="<?= $movie['id'] ?>">
                <button type="submit" class="btn btn--danger btn--small">Удалить</button>
              </form>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>

    <?php if ($totalPages > 1): ?>
      <nav class="admin-pagination" style="margin-top:20px;">
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
          <?php
          $qParams = $_GET;
          $qParams['page'] = $i;
          $link = '?' . http_build_query($qParams);
          ?>
          <a href="<?= $link ?>" class="admin-page-link <?= $i == $page ? 'active' : '' ?>" style="margin:0 3px;<?= $i == $page ? 'font-weight:bold;' : '' ?>">
            <?= $i ?>
          </a>
        <?php endfor; ?>
      </nav>
    <?php endif; ?>

  </div>
</body>
</html>
