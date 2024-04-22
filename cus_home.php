<?php
session_start();
if($_SESSION['user'] != 'cus')
{
    header("Location: index.php?accessdenied=true");
    die();
} 
include("config.php");
$stmt = $conn->prepare("SELECT name FROM customers WHERE id = ?");
$stmt->bind_param("i", $_SESSION['id']);
$stmt->execute();
$result = $stmt->get_result();
$name_ = $result->fetch_assoc();
$name = $name_['name'];
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Home</title>
</head>
<body>
    <nav style="text-align: center;">
        <h3>Welcome, <?php echo htmlspecialchars($name); ?></h3>
        <h1>Order Munch</h1>
        <ul class = "nav">
            <li><a href="menu.php">Menu</a></li>
            <li><a href="cart.php">My Cart</a></li>
            <li><a href="cus_orders.php">My orders</a></li>
            <li><a href="logout.php">Logout</a></li>    
        </ul>
    </nav>
</body>
</html>
