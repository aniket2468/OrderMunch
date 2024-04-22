<?php 
session_start();
if($_SESSION['user'] != 'res') {
    header("Location: index.php?accessdenied=true");
    exit;
}
include("config.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>View Orders</title>
</head>
<body>
<a href="res_home.php" style="margin-left: 10px;"><h3>&lt;&lt; Back</h3></a>
<div class="menu">
    <?php 
    // Using JOIN to optimize the query
    $stmt = $conn->prepare("SELECT o.*, f.name AS food_name, f.price AS food_price, f.image AS food_image, f.pref AS food_pref, c.name AS customer_name, c.phone_no AS customer_phone FROM orders o
                            JOIN food f ON f.id = o.food_id
                            JOIN customers c ON c.id = o.user_id
                            WHERE f.res_id = ? ORDER BY o.time DESC");
    $stmt->bind_param("i", $_SESSION['id']);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $pref = $row['food_pref'] ? "Non-veg" : "Veg";
            $dt = explode(" ", $row['time']);
            $date = $dt[0];
            $time = $dt[1];
            echo "<div class='food'>";
            echo "<img width='250' height='250' style='vertical-align:top;' src='".htmlspecialchars($row['food_image'])."'>" .
                 "<h2>Name: " . htmlspecialchars($row['food_name']) . "</h2>" .
                 "<h2>Price: " . htmlspecialchars($row['food_price']) . " $</h2>" .
                 "<h2>Food type: " . htmlspecialchars($pref) . "</h2>" .
                 "<h2>Quantity: " . htmlspecialchars($row['quantity']) . "</h2>" .
                 "<h2>Ordered by: " . htmlspecialchars($row['customer_name']) . "</h2>" .
                 "<h2>Phone no: " . htmlspecialchars($row['customer_phone']) . "</h2>" .
                 "<h2>Date: " . htmlspecialchars($date) . "</h2>" .
                 "<h2>Time: " . htmlspecialchars($time) . " hrs</h2>";
            echo "</div>";
        }
    } else {
        echo "NO ORDERS YET";
    }
    $conn->close();
    ?>
  </div>
</body>
</html>