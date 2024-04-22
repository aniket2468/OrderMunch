<?php
session_start();

if (isset($_SESSION['user']) && $_SESSION['user'] == 'cus') {
    header("Location: cus_home.php");
    exit;
}

if (isset($_SESSION['user']) && $_SESSION['user'] == 'res') {
    header("Location: res_home.php");
    exit;
}
?>