<?php
require_once __DIR__ . '/includes/admin-check.php';
require_once __DIR__ . '/../config/db.php';

$id = (int)($_GET['id'] ?? 0);
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$id]);
$user = $stmt->fetch();

if (!$user) {
    die("Пользователь не найден");
}

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $surname = trim($_POST['surname']);
    $email = trim($_POST['email']);
    $is_admin = isset($_POST['is_admin']) ? 1 : 0;

    // Проверим email на уникальность
    $emailCheck = $pdo->prepare("SELECT id FROM users WHERE email = ? AND id != ?");
    $emailCheck->execute([$email, $id]);
    if ($emailCheck->fetch()) {
        $error = "Этот email уже занят";
    } else {
        $stmt = $pdo->prepare("UPDATE users SET name=?, surname=?, email=?, is_admin=? WHERE id=?");
        $stmt->execute([$name, $surname, $email, $is_admin, $id]);
        header("Location: /admin/users.php");
        exit;
    }
}

// Получаем отзывы пользователя
$reviewStmt = $pdo->prepare("
    SELECT r.*, m.title AS movie_title
    FROM reviews r
    JOIN movies m ON r.movie_id = m.id
    WHERE r.user_id = ?
    ORDER BY r.created_at DESC
    LIMIT 20
");
$reviewStmt->execute([$id]);
$reviews = $reviewStmt->fetchAll();
?>

<link rel="stylesheet" href="assets/style/admin.css">
<link rel="stylesheet" href="assets/style/normalize.css">

<div class="admin-container">
  <div class="admin-breadcrumbs">
    <a href="/admin/dashboard.php">Главная</a> &rarr; 
    <a href="/admin/users.php">Пользователи</a> &rarr; 
    <span>Редактировать</span>
  </div>
  
  <div class="admin-card" style="max-width:620px;margin-bottom:38px;">
    <h1 class="admin-section__header">Редактировать пользователя #<?= $user['id'] ?></h1>

    <?php if (!empty($error)): ?>
      <div class="admin-alert admin-alert--error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form method="post" class="admin-form">
      <label>Имя:
        <input type="text" name="name" value="<?= htmlspecialchars($user['name']) ?>" required>
      </label>
      <label>Фамилия:
        <input type="text" name="surname" value="<?= htmlspecialchars($user['surname']) ?>" required>
      </label>
      <label>Email:
        <input type="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
      </label>
      <label>
        <input type="checkbox" name="is_admin" <?= $user['is_admin'] ? 'checked' : '' ?>>
        Администратор
      </label>
      <div class="admin-form__actions">
        <button class="btn btn--primary" type="submit">Сохранить</button>
        <a href="/admin/users.php" class="btn btn--primary">← Назад</a>
      </div>
    </form>
  </div>

  <div class="admin-card">
    <h2 class="admin-section__header" style="margin-bottom:20px;">Отзывы пользователя</h2>
    <?php if (!$reviews): ?>
      <div class="admin-empty" style="text-align:center;padding:30px 0;color:#aaa;font-size:18px;">Нет отзывов</div>
    <?php else: ?>
      <div class="admin-table-wrap">
        <table class="admin-table">
          <thead>
            <tr>
              <th>Фильм</th>
              <th>Оценка</th>
              <th>Текст</th>
              <th>Дата</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($reviews as $review): ?>
              <tr>
                <td>
                  <a href="/admin/edit-movie.php?id=<?= $review['movie_id'] ?>" target="_blank" style="color:#7B61FF; font-weight:500;">
                    <?= htmlspecialchars($review['movie_title']) ?>
                  </a>
                </td>
                <td><?= (int)$review['rating'] ?></td>
                <td><?= htmlspecialchars($review['comment']) ?></td>
                <td><?= date('d.m.Y H:i', strtotime($review['created_at'])) ?></td>
                <td>
                  <form action="delete-review.php" method="post" style="display:inline;" onsubmit="return confirm('Удалить отзыв?');">
                    <input type="hidden" name="id" value="<?= $review['id'] ?>">
                    <button class="btn btn--danger btn--small" type="submit">✖</button>
                  </form>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    <?php endif; ?>
  </div>
</div>
