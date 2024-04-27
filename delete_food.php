<?php 
session_start();
if($_SESSION['user'] != 'res')
{
    header("Location: index.php?accessdenied=true");
    die();
}
include("config.php");
if(isset($_GET['id'])) {
    $food_id = $_GET['id'];
    $stmt = $conn->prepare("DELETE FROM food WHERE id = ?");
    $stmt->bind_param("i", $food_id);
    $stmt->execute();

    $stmt2 = $conn->prepare("DELETE FROM orders WHERE food_id = ?");
    $stmt2->bind_param("i", $food_id);
    $stmt2->execute();

    $stmt3 = $conn->prepare("DELETE FROM cart WHERE food_id = ?");
    $stmt3->bind_param("i", $food_id);
    $stmt3->execute();
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>My Food</title>

</head>
<body>
<a  href="res_home.php"><h3 style = "margin-left: 10px;"><< Back</h3></a>
<div class="menu">
    <?php 
        $sql = "SELECT * FROM food WHERE res_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_SESSION['id']);
        $stmt->execute();
        $result = $stmt->get_result();
    if ($result->num_rows > 0) 
    {
        // output data of each row
        while($row = $result->fetch_assoc()) 
        {
            //Showing all the food items a Restaurant created.
            $pref = $row['pref']?"Non-veg":"Veg";
            echo "<div class='food'>";
            echo "<img width='250' height='250' style='vertical-align:top;' src='" . htmlspecialchars($row['image']) . "'>" .
                "<h2>Name: " . htmlspecialchars($row['name']) . "</h2>" .
                "<h2>Price: " . htmlspecialchars($row['price']) . " $</h2>" .
                "<h2>Food type: " . htmlspecialchars($pref) . "</h2>" .
                "<a style='font-size:20px; margin-right: 10px;' href='update_food.php?id=" . htmlspecialchars($row['id']) . "'>Update</a>" . "<a style='font-size:20px; margin-right: 10px;' href='delete_food.php?id=" . htmlspecialchars($row['id']) . "'>Delete</a>";
            echo "</div>";

        }
    } 
    else
        echo "NO FOOD";
        
    $conn->close();
    ?>
  </div>
</body>
</html>
  
    
