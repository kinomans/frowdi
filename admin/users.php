<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

$search = trim($_GET['search'] ?? '');
$page = max(1, (int)($_GET['page'] ?? 1));
$limit = 12;
$offset = ($page - 1) * $limit;

$params = [];
$where = '';
if ($search) {
    $where = "WHERE name LIKE ? OR surname LIKE ? OR email LIKE ?";
    $params = ["%$search%", "%$search%", "%$search%"];
}

// Всего пользователей
$countStmt = $pdo->prepare("SELECT COUNT(*) FROM users $where");
$countStmt->execute($params);
$total = $countStmt->fetchColumn();
$totalPages = max(1, ceil($total / $limit));

// Получаем пользователей
$stmt = $pdo->prepare("SELECT * FROM users $where ORDER BY created_at DESC LIMIT $limit OFFSET $offset");
$stmt->execute($params);
$users = $stmt->fetchAll();
?>

<link rel="stylesheet" href="assets/style/admin.css">
<div class="admin-container">
  <div class="admin-breadcrumbs">
    <a href="/admin/dashboard.php">Главная</a> &rarr; <span>Пользователи</span>
  </div>

  <div class="admin-card">
    <h1 class="admin-section__header">Пользователи</h1>

    <form method="get" class="admin-filter" style="margin-bottom:18px;display:flex;gap:10px;">
      <input type="text" name="search" value="<?= htmlspecialchars($search) ?>" placeholder="Поиск по имени или email" class="admin-input" style="min-width:220px;">
      <button type="submit" class="admin-btn admin-btn--primary">Искать</button>
      <?php if ($search): ?>
        <a href="/admin/users.php" class="admin-btn admin-btn--primary">Сбросить</a>
      <?php endif; ?>
    </form>

    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Имя</th>
            <th>Email</th>
            <th>Дата регистрации</th>
            <th>Роль</th>
            <th>Действия</th>
          </tr>
        </thead>
        <tbody>
          <?php if (empty($users)): ?>
            <tr>
              <td colspan="6" style="text-align:center; color:#ccc; font-size: 18px;">Нет пользователей</td>
            </tr>
          <?php else: ?>
            <?php foreach ($users as $user): ?>
              <tr>
                <td><?= $user['id'] ?></td>
                <td><?= htmlspecialchars($user['name']) . ' ' . htmlspecialchars($user['surname']) ?></td>
                <td><?= htmlspecialchars($user['email']) ?></td>
                <td><?= date('d.m.Y H:i', strtotime($user['created_at'])) ?></td>
                <td><?= !empty($user['is_admin']) ? '<span style="color:#ffc34d;font-weight:bold;">Админ</span>' : 'Пользователь' ?></td>
                <td>
                  <a href="edit-user.php?id=<?= $user['id'] ?>" class="btn btn--small">✎</a>
                  <?php if (empty($user['is_admin'])): ?>
                    <form action="delete-user.php" method="post" style="display:inline;" onsubmit="return confirm('Удалить пользователя?');">
                      <input type="hidden" name="id" value="<?= $user['id'] ?>">
                      <button type="submit" class="btn btn--danger btn--small">✖</button>
                    </form>
                  <?php else: ?>
                    <span style="color:#aaa;">–</span>
                  <?php endif; ?>
                </td>
              </tr>
            <?php endforeach; ?>
          <?php endif; ?>
        </tbody>
      </table>
    </div>

    <?php if ($totalPages > 1): ?>
      <div class="admin-pagination" style="margin-top:22px;">
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
          <a href="?page=<?= $i ?>&search=<?= urlencode($search) ?>" class="admin-page-link<?= $i == $page ? ' active' : '' ?>">
            <?= $i ?>
          </a>
        <?php endfor; ?>
      </div>
    <?php endif; ?>
  </div>
</div>
