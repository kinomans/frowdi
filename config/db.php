<?php
$host = 'localhost';    // или ваш сервер базы данных
$dbname = 'frowdi_db';   // имя базы
$username = 'root';      // стандартный логин локально
$password = 'root';          // стандартный пароль локально

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Ошибка подключения к базе данных: " . $e->getMessage());
}
?>
