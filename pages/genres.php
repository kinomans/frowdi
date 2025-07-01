<?php
require_once '../components/header.php';
require_once '../config/db.php';

$stmt = $pdo->query("SELECT * FROM genres ORDER BY name ASC");
$genres = $stmt->fetchAll();
?>

<link rel="stylesheet" href="/assets/css/genres.css">

<main class="genres">
  <div class="container">
    <h1 class="genres__title">Жанры фильмов</h1>
    <div class="genres__grid">
      <?php foreach ($genres as $genre): ?>
        <a href="/pages/genre.php?id=<?= $genre['id'] ?>" class="genre-card">
        <img src="<?= $genre['image'] ?: '/assets/img/genre-placeholder.png' ?>" alt="<?= htmlspecialchars($genre['name']) ?>">
        <span><?= htmlspecialchars($genre['name']) ?></span>
        </a>
      <?php endforeach; ?>
    </div>
  </div>
</main>

<?php require_once '../components/footer.php'; ?>
