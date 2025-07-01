<!-- Вспомогательные функции -->
<?php
function formatField($value, $fallback = 'Неизвестно') {
  return !empty($value) ? htmlspecialchars($value) : $fallback;
}

function formatNumber($number) {
  return is_numeric($number) ? number_format($number, 0, ',', ' ') . ' ₽' : '—';
}

function formatMultilineText($text) {
  return !empty($text) ? nl2br(htmlspecialchars($text)) : 'Нет данных';
}
?>