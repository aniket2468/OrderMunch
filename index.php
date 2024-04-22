<?php 
session_start();
include("redirect_to_home.php");

$messages = [
    'reg_success' => "Registered successfully",
    'accessdenied' => "Access Denied",
    'loggedout' => "No one logged in!"
];

foreach ($messages as $key => $message) {
    if (isset($_GET[$key])) {
        echo "<script type='text/javascript'>alert('{$message}');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Order Munch</title>
</head>
<body>
    <nav style="text-align: center;">
        <h1>Order Munch</h1>
        <ul class = "nav">
            <li><a href="menu.php">Menu</a></li>
            <li><a href="login_usr.php">Login (Customer)</a></li>
            <li><a href="login_res.php">Login (Restaurant)</a></li>
            <li><a href="register_usr.php">Register (Customer)</a></li>
            <li><a href="register_res.php">Register (Restaurant)</a></li>
        </ul>
    </nav>
</body>
</html>
