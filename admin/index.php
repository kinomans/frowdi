<?php
// /admin/index.php
session_start();
if (!isset($_SESSION['admin'])) {
  header('Location: /admin/login.php');
  exit;
}

$page = $_GET['page'] ?? 'movies';

require_once __DIR__ . '/components/header.php';
require_once __DIR__ . '/components/sidebar.php';
?>

<main class="admin-main">
  <div class="admin-container">
    <?php
    $pagePath = __DIR__ . "/pages/{$page}.php";
    if (file_exists($pagePath)) {
      require_once $pagePath;
    } else {
      echo "<p>Страница не найдена</p>";
    }
    ?>
  </div>
</main>

<?php require_once __DIR__ . '/components/footer.php'; ?>
