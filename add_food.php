<?php 
session_start();
if($_SESSION['user'] != 'res') 
{
    header("Location: index.php?accessdenied=true");
    die();
} 

include("config.php");

if(isset($_POST['submit']))
{
    if($_POST['price'] > 0)
    {
    $ImageName = $_FILES['image']['name'];
    $fileElementName = 'image';
    $path = 'images/'; 
    $location = $path . $_FILES['image']['name']; 
    move_uploaded_file($_FILES['image']['tmp_name'], $location);
    
    $foodname=$_POST['foodname'];
    $price=$_POST['price'];
    $pref = NULL;
    if($_POST['pref'] == "veg")
        $pref = 0;
    else
        $pref = 1;

    $stmt = $conn->prepare("INSERT INTO food (name, price, res_id, pref, image) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("siiis", $foodname, $price, $_SESSION['id'], $pref, $location);
    $stmt->execute();
        
    if($stmt->execute()) {
        echo '<script type="text/javascript">alert("Food Added");</script>';
    } else {
        echo '<script type="text/javascript">alert("Error adding food: ' . htmlspecialchars($conn->error, ENT_QUOTES) . '");</script>';
    }    
    
    $conn->close();
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
    <title>Add Menu item</title>
</head>
<body>
    <a  href="res_home.php"><h3 style = "margin-left: 10px;"><< Back</h3></a>
    <h2 style="text-align: center; color: #FFFFFF; margin-left: 25px;">Add Food</h2>
    <br>

    <form action="add_food.php" method="POST" enctype="multipart/form-data">
        <label for="foodname">Food Name</label>
        <input type="text" id="foodname" name = "foodname" placeholder="Food Name" required>
        <label for="price">Price</label>
        <input type="number"  step = "1" id="price" name = "price" placeholder="Enter price" required>
        <fieldset>
            <input type="radio" id="veg" name="pref" value="veg" checked>
            <label for="veg">Veg</label>
            <input type="radio" id="non_veg" name="pref" value="non_veg">
            <label for="non_veg">Non-veg</label>
        </fieldset>
        <label for="image">Image:</label>
        <input type="file" id = "image" name="image">
        <button style="width: 100%" type="submit" id="button" name="submit">Add Food</button>
    </form>

</body>
</html>
