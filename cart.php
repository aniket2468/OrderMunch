<?php 
session_start();

if($_SESSION['user'] != 'cus')
{
    header("Location: index.php?accessdenied=true");
    die();
}

include("config.php");

if(isset($_GET['id'])) {
    $stmt = $conn->prepare("DELETE FROM cart WHERE id = ?");
    $stmt->bind_param("i", $_GET['id']);
    $stmt->execute();
}

if(isset($_GET['order'])) {
    $sql = "SELECT * FROM cart WHERE user_id =" . $_SESSION['id'];
    $result = $conn->query($sql);
    $price = 0;
    while($row = $result->fetch_assoc()) {
        $food = $conn->query("SELECT * FROM food WHERE id =" . $row['food_id'])->fetch_assoc();
        $price += $row['quantity'] * $food['price'];
        $conn->query("INSERT INTO orders VALUES (NULL, ".$food['id'].", ".$row['quantity'].", ".$_SESSION['id'].", current_timestamp())");
    }
    $conn->query("DELETE FROM cart WHERE user_id=".$_SESSION['id']);
    echo '<script type="text/javascript">alert("Successfully ordered. Pay a total of '.$price.' $ on delivery.");</script>';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>My Cart</title>
</head>
<body>
<a  href="res_home.php"><h3 style = "margin-left: 10px;"><< Back</h3></a>
<div class="menu">
    <?php 
    include("config.php");

    $sql = "SELECT * FROM cart WHERE user_id =". $_SESSION['id'];
    $result = $conn->query($sql);
    if ($result->num_rows > 0) 
    {
        while($row = $result->fetch_assoc()) 
        {
            $food = $conn->query("SELECT * FROM food WHERE id =".$row['food_id'] )->fetch_assoc();
            $res = $conn->query("SELECT * FROM restaurants WHERE id =".$food['res_id'])->fetch_assoc();
            $pref = $food['pref']?"Non-veg":"Veg";
            echo "<div class='food'>";
            echo "<img width = '250' height = '250' style='vertical-align:top;' src=".$food['image']."> 
                 <h2>Name: " . $food["name"]. "<h2><h2>Price: " . $food["price"]." $</h2>"."<h2>Food type: ".$pref."<h2>".
                 "<h2>Quantity: " . $row["quantity"]. "<h2><h2>Restaurant: " . $res["name"]."</h2>".
                 "<h2>Location: " . $res["location"]."</h2>".
                 "<a style='font-size:20px;', href='cart.php?id=".$row["id"]."'>Delete</a>";
            echo "</div>";
        }
        echo "</div><a style='font-size:30px; color:white; background-color:grey; border:solid black 2px;  margin: 10px; padding: 5px ; text-decoration:none; ', href='cart.php?order=true'>Order</a>"; 
    } 
    else 
        echo "Cart Empty</div>";
    $conn->close();
    ?>
</body>
</html>
  
    