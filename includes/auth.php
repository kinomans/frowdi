<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Можно здесь же добавить хелпер-функции:
function isLoggedIn() {
    return isset($_SESSION['user']);
}

function currentUser() {
    return $_SESSION['user'] ?? null;
}
