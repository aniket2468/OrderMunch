<?php 
session_start();
include("config.php");

if(isset($_POST['submit'])) {
    if(isset($_SESSION['user']) && $_SESSION['user'] == 'cus') {
        $quantity = $_POST['quantity'];
        if($quantity > 0) {
            $stmt = $conn->prepare("INSERT INTO cart VALUES (NULL, ?, ?, ?);");
            $stmt->bind_param("iii", $_POST['id'], $quantity, $_SESSION['id']);
            if($stmt->execute()) {
                echo '<script type="text/javascript">alert("Added to cart");</script>';
            } else {
                echo '<script type="text/javascript">alert("Error: "'. mysqli_error($conn) .');</script>';
            }
        } else {
            echo '<script type="text/javascript">alert("Quantity should be greater than 0");</script>';
        }
    } else if($_SESSION['user'] == 'res') {
        echo '<script type="text/javascript">alert("Restaurants cannot order");</script>';
    } else {
        header("Location: login_usr.php?login=false");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Menu</title>
</head>
<body>
    <a href='<?= isset($_SESSION['user']) ? ($_SESSION['user'] == 'cus' ? 'cus_home.php' : 'res_home.php') : 'index.php'; ?>' style='font-size:20px;'><h3 style="margin-left: 10px;"><< Back</h3></a>
    <div class="menu">
        <?php 
        if(isset($_SESSION['user']) && $_SESSION['user'] == 'cus'){
            $stmt = $conn->prepare("SELECT pref FROM customers WHERE id = ?");
            $stmt->bind_param("i", $_SESSION['id']);
            $stmt->execute();
            $prefResult = $stmt->get_result()->fetch_assoc();
            $stmt = $conn->prepare("SELECT * FROM food WHERE pref = ? ORDER BY pref DESC");
            $stmt->bind_param("i", $prefResult['pref']);
            $stmt->execute();
            $result = $stmt->get_result();
        } else {
            $result = $conn->query("SELECT * FROM food");
        }

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $res = $conn->query("SELECT * FROM restaurants WHERE id =" . $row['res_id'])->fetch_assoc();
                $pref = $row['pref'] ? "Non-veg" : "Veg";
                echo "<div class='food'>";
                echo "<img width='250' height='250' src='" . htmlspecialchars($row['image']) . "' style='vertical-align:top;'>" .
                     "<h2>Name: " . htmlspecialchars($row['name']) . "</h2>" .
                     "<h2>Price: " . htmlspecialchars($row['price']) . " $</h2>" .
                     "<h2>Food type: " . $pref . "</h2>" .
                     "<h2>Restaurant: " . htmlspecialchars($res['name']) . "</h2>" .
                     "<h2>Location: " . htmlspecialchars($res['location']) . "</h2>" .
                     "<form action='menu.php' method='POST'>" .
                     "<input type='number' name='quantity' placeholder='Enter quantity' min='1'>" .
                     "<input type='hidden' name='id' value='" . $row['id'] . "'>" .
                     "<button type='submit' name='submit'>Order</button></form>";
                echo "</div>";
            }
        } else {
            echo "NO FOOD";
        }
        
        $conn->close();
        ?>
    </div>
</body>
</html>
