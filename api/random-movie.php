<?php
require_once __DIR__ . '/../config/db.php';

ob_start();
require __DIR__ . '/../components/random-movie-banner.php';
$html = ob_get_clean();

header('Content-Type: text/html; charset=utf-8');
echo $html;
