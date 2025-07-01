<?php
require_once '../config/db.php';
require_once '../components/header.php';

// Случайный фильм
$stmt = $pdo->query("SELECT * FROM movies ORDER BY RAND() LIMIT 1");
$movie = $stmt->fetch();
require_once '../components/random-movie-banner.php';

// Топ 10 фильмов
$stmt = $pdo->query("SELECT * FROM movies ORDER BY rating DESC LIMIT 10");
$movies = $stmt->fetchAll();
?>

<main class="main">
  <section class="top-movies">
    <div class="container">
      <h2 class="section-title">Топ 10 фильмов</h2>
      <div class="top-movies-grid">
        <?php 
        $number = 1;
        $delay = 0;
        foreach ($movies as $movie):
        ?>
          <?php include '../components/top-movie-card.php'; ?>
          <?php $number++; $delay += 100; ?>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
</main>

<?php require_once '../components/footer.php'; ?>
