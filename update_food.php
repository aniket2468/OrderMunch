<?php
session_start();
if($_SESSION['user'] != 'res') {
    header("Location: index.php?accessdenied=true");
    die();
}
include("config.php");

$food_id = $_GET['id'] ?? null;
if ($food_id) {
    $stmt = $conn->prepare("SELECT * FROM food WHERE id = ?");
    $stmt->bind_param("i", $food_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $food = $result->fetch_assoc();
}

if (isset($_POST['update'])) {
    $foodname = $_POST['foodname'];
    $price = $_POST['price'];
    $pref = $_POST['pref'] == "veg" ? 0 : 1;

    $stmt = $conn->prepare("UPDATE food SET name=?, price=?, pref=? WHERE id=?");
    $stmt->bind_param("siis", $foodname, $price, $pref, $food_id);
    if ($stmt->execute()) {
        echo '<script type="text/javascript">alert("Food Updated");window.location.href="delete_food.php";</script>';
    } else {
        echo '<script type="text/javascript">alert("Error updating food: ' . htmlspecialchars($conn->error, ENT_QUOTES) . '");</script>';
    }
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Update Food Item</title>
</head>
<body>
    <h2>Update Food</h2>
    <form action="update_food.php?id=<?= htmlspecialchars($food_id) ?>" method="post">
        <label for="foodname">Food Name:</label>
        <input type="text" id="foodname" name="foodname" value="<?= htmlspecialchars($food['name']) ?>" required>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" value="<?= htmlspecialchars($food['price']) ?>" required>
        <fieldset>
            <input type="radio" id="veg" name="pref" value="veg" <?= $food['pref'] == 0 ? 'checked' : '' ?>>
            <label for="veg">Veg</label>
            <input type="radio" id="non_veg" name="pref" value="non_veg" <?= $food['pref'] == 1 ? 'checked' : '' ?>>
            <label for="non_veg">Non-Veg</label>
        </fieldset>
        <button style="width: 100%" type="submit" name="update">Update Food</button>
    </form>
</body>
</html>
