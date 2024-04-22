<?php 
session_start();
if($_SESSION['user'] != 'cus')
{
    header("Location: index.php?accessdenied=true");
    die();
}
include("config.php");

$sql = "SELECT orders.*, food.name as food_name, food.price as food_price, food.image as food_image, food.pref as food_pref, restaurants.name as restaurant_name, restaurants.location as restaurant_location 
        FROM orders 
        JOIN food ON orders.food_id = food.id 
        JOIN restaurants ON food.res_id = restaurants.id 
        WHERE orders.user_id = ?
        ORDER BY orders.time DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $_SESSION['id']);
$stmt->execute();
$result = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>My Orders</title>
</head>
<body>
<a href="res_home.php"><h3 style="margin-left: 10px;"><< Back</h3></a>
<div class="menu">
    <?php 
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $pref = $row['food_pref'] ? "Non-veg" : "Veg";
            $dt = explode(" ", $row['time']);
            $date = $dt[0];
            $time = $dt[1];
            echo "<div class='food'>";
            echo "<img width='250' height='250' style='vertical-align:top;' src='" . htmlspecialchars($row['food_image']) . "'>" .
                "<h2>Name: " . htmlspecialchars($row['food_name']) . "</h2>" .
                "<h2>Price: " . htmlspecialchars($row['food_price']) . " $</h2>" .
                "<h2>Food type: " . htmlspecialchars($pref) . "</h2>" .
                "<h2>Quantity: " . htmlspecialchars($row['quantity']) . "</h2>" .
                "<h2>Restaurant: " . htmlspecialchars($row['restaurant_name']) . "</h2>" .
                "<h2>Location: " . htmlspecialchars($row['restaurant_location']) . "</h2>" .
                "<h2>Date: " . htmlspecialchars($date) . "</h2>" .
                "<h2>Time: " . htmlspecialchars($time) . " hrs</h2></div>";
        }
    } else {
        echo "NO ORDERS YET";
    }
    $conn->close();
    ?>
  </div>
</body>
</html>
