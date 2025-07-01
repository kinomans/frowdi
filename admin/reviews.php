<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

// === Фильтры ===
$movieQ = trim($_GET['movie'] ?? '');
$userQ = trim($_GET['user'] ?? '');
$ratingQ = (int)($_GET['rating'] ?? 0);

$where = [];
$params = [];

// Поиск по фильму
if ($movieQ) {
    $where[] = "m.title LIKE ?";
    $params[] = "%$movieQ%";
}
// Поиск по пользователю (имя, фамилия или email)
if ($userQ) {
    $where[] = "(u.name LIKE ? OR u.surname LIKE ? OR u.email LIKE ?)";
    $params[] = "%$userQ%";
    $params[] = "%$userQ%";
    $params[] = "%$userQ%";
}
// Поиск по оценке
if ($ratingQ) {
    $where[] = "r.rating = ?";
    $params[] = $ratingQ;
}

$filterSQL = $where ? "WHERE " . implode(" AND ", $where) : "";

// === Пагинация ===
$page = max(1, (int)($_GET['page'] ?? 1));
$limit = 20;
$offset = ($page - 1) * $limit;

// Считаем количество отзывов для пагинации
$countStmt = $pdo->prepare("
    SELECT COUNT(*) FROM reviews r
    JOIN movies m ON r.movie_id = m.id
    JOIN users u ON r.user_id = u.id
    $filterSQL
");
$countStmt->execute($params);
$total = $countStmt->fetchColumn();
$totalPages = ceil($total / $limit);

// Получаем отзывы
$stmt = $pdo->prepare("
    SELECT r.*, m.title AS movie_title, m.id AS movie_id, u.name, u.surname, u.email, u.id AS user_id
    FROM reviews r
    JOIN movies m ON r.movie_id = m.id
    JOIN users u ON r.user_id = u.id
    $filterSQL
    ORDER BY r.created_at DESC
    LIMIT $limit OFFSET $offset
");
$stmt->execute($params);
$reviews = $stmt->fetchAll();
?>
<link rel="stylesheet" href="assets/style/admin.css">
<div class="admin-container">
  <div class="admin-breadcrumbs">
    <a href="/admin/dashboard.php">Главная</a> &rarr; <span>Отзывы</span>
  </div>

  <div class="admin-card">
    <h1 class="admin-section__header">Отзывы пользователей</h1>
    <form method="get"  class="admin-filter" style="margin-bottom:18px;display:flex;gap:10px;">
      <input type="text" name="movie" placeholder="Поиск по фильму" value="<?= htmlspecialchars($movieQ) ?>" class="admin-input" style="flex:1">
      <input type="text" name="user" placeholder="Поиск по пользователю/email" value="<?= htmlspecialchars($userQ) ?>" class="admin-input" style="flex:1">
      <select name="rating" class="admin-input" style="width:120px;">
        <option value="0">Оценка</option>
        <?php for ($i = 10; $i >= 1; $i--): ?>
          <option value="<?= $i ?>" <?= $ratingQ == $i ? 'selected' : '' ?>><?= $i ?></option>
        <?php endfor; ?>
      </select>
      <button class="admin-btn admin-btn--primary" type="submit">Искать</button>
      <a href="reviews.php" class="admin-btn admin-btn--primary">Сбросить</a>
    </form>

    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Фильм</th>
            <th>Пользователь</th>
            <th>Оценка</th>
            <th>Текст</th>
            <th>Дата</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <?php if (!$reviews): ?>
          <tr>
            <td colspan="7" style="text-align:center;color:#aaa;padding:32px 0;font-size:18px;">Нет отзывов</td>
          </tr>
        <?php else: foreach ($reviews as $r): ?>
          <tr>
            <td><?= $r['id'] ?></td>
            <td>
              <a href="/pages/movie.php?id=<?= $r['movie_id'] ?>" target="_blank" style="color:#7B61FF; font-weight:500;">
                <?= htmlspecialchars($r['movie_title']) ?>
              </a>
            </td>
            <td>
              <a href="/admin/edit-user.php?id=<?= $r['user_id'] ?>" target="_blank" style="font-weight:600;">
                <?= htmlspecialchars($r['name'] . ' ' . $r['surname']) ?>
                <span style="font-size:13px;" title="Профиль пользователя">🔗</span>
              </a>
              <div style="color:#aaa;font-size:12px;"><?= htmlspecialchars($r['email']) ?></div>
              <form action="delete-user-reviews.php" method="post" style="display:inline;" onsubmit="return confirm('Удалить все отзывы пользователя?');">
                <input type="hidden" name="user_id" value="<?= $r['user_id'] ?>">
                <button type="submit" class="btn btn--danger btn--small" title="Удалить все отзывы этого пользователя">🗑️</button>
              </form>
            </td>
            <td><?= $r['rating'] ?></td>
            <td><?= nl2br(htmlspecialchars($r['comment'])) ?></td>
            <td><?= date('d.m.Y H:i', strtotime($r['created_at'])) ?></td>
            <td>
              <form method="POST" action="/admin/delete-review.php" style="display:inline;" onsubmit="return confirm('Удалить этот отзыв?');">
                <input type="hidden" name="id" value="<?= $r['id'] ?>">
                <button type="submit" class="btn btn--danger btn--small">✖</button>
              </form>
            </td>
          </tr>
        <?php endforeach; endif; ?>
        </tbody>
      </table>
    </div>
    <?php if ($totalPages > 1): ?>
      <div class="admin-pagination" style="margin-top:30px;">
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
          <a href="?<?= http_build_query(array_merge($_GET, ['page' => $i])) ?>"
             class="<?= $i == $page ? 'active' : '' ?>"><?= $i ?></a>
        <?php endfor; ?>
      </div>
    <?php endif; ?>
  </div>
</div>
