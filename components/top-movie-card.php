<div class="top-movie-card" data-aos="fade-up" data-aos-delay="<?= $delay; ?>">
  <div class="top-movie-card__number"><?= $number; ?></div>
  <a href="../pages/movie.php?id=<?= $movie['id']; ?>" class="top-movie-card__link">
    <img src="<?= htmlspecialchars($movie['poster_url']); ?>" alt="<?= htmlspecialchars($movie['title']); ?>">
  </a>
</div>
