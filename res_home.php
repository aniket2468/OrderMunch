<?php
session_start();
if($_SESSION['user'] != 'res') {
    header("Location: index.php?accessdenied=true");
    exit;
}
include("config.php");
$stmt = $conn->prepare("SELECT name FROM restaurants WHERE id = ?");
$stmt->bind_param("i", $_SESSION['id']);
$stmt->execute();
$result = $stmt->get_result();
$name = $result->fetch_assoc()['name'];
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Home</title>
</head>
<body>
    <nav style="text-align: center;">
        <h3>Welcome, <?php echo htmlspecialchars($name); ?></h3>
        <h1>Order Munch</h1>
        <ul class="nav">
            <li><a href="menu.php">Menu</a></li>
            <li><a href="add_food.php">Add Menu item</a></li>
            <li><a href="delete_food.php">My Food</a></li>
            <li><a href="res_orders.php">View Orders</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </nav>
</body>
</html>
