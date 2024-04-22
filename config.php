<?php
// Sets up the conection to database.
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "OrderMunch";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>