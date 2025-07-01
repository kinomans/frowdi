<?php
// $breadcrumbs — массив вида [['title' => 'Главная', 'url' => '/admin/dashboard.php'], ...]
// Пример подключения: include __DIR__ . '/components/breadcrumbs.php';
if (!isset($breadcrumbs) || !is_array($breadcrumbs)) return;
?>
<nav class="admin-breadcrumbs">
  <?php foreach ($breadcrumbs as $i => $crumb): ?>
    <?php if (!empty($crumb['url']) && $i !== count($breadcrumbs) - 1): ?>
      <a href="<?= htmlspecialchars($crumb['url']) ?>"><?= htmlspecialchars($crumb['title']) ?></a>
      <span> / </span>
    <?php else: ?>
      <span><?= htmlspecialchars($crumb['title']) ?></span>
    <?php endif; ?>
  <?php endforeach; ?>
</nav>
