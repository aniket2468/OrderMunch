<!DOCTYPE html>
<html lang="en">
<?php
include("../connection/connect.php");
error_reporting(0);
session_start();

if (!isset($_SESSION['adm_id'])) {
    header('location:../login.php');
    exit;
}

if (isset($_POST['submit'])) {
    $tag = $_POST['tag'];
    $categories = $_POST['categories'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];
    $postalCode = $_POST['postalCode'];

    if (empty($tag) || empty($categories) || empty($address) || empty($city) || empty($latitude) || empty($longitude) || empty($postalCode)) {
        echo '<div class="alert alert-danger">Please fill all fields.</div>';
    } else {
        $insertRestaurant = "INSERT INTO RESTAURANTS (tag, categories) VALUES (?, ?)";
$stmt = $db->prepare($insertRestaurant);
$stmt->bind_param("ss", $tag, $categories);
$stmt->execute();
$last_id = $stmt->insert_id;

$insertLocation = "INSERT INTO LOCATIONS (restaurant_id, address, city, latitude, longitude, postalCode) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $db->prepare($insertLocation);
$stmt->bind_param("issdds", $last_id, $address, $city, $latitude, $longitude, $postalCode);
$stmt->execute();

if ($stmt->execute()) {
    echo "<script>alert('Restaurant and its location added successfully.'); window.location.replace('all_restaurant.php');</script>";
} else {
    echo "<script>alert('Error adding location details.'); window.location.replace('add_restaurant.php');</script>";
}

    }
}
?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Restaurant</title>
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fix-header fix-sidebar">
    <div id="main-wrapper">
       
        <div class="left-sidebar">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li class="nav-label">Home</li>
                        <li><a href="dashboard.php"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
                        <li class="nav-label">Log</li>
                        <li><a href="all_users.php"><i class="fa fa-user f-s-20"></i><span>Users</span></a></li>
                        <li><a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-archive f-s-20 color-warning"></i><span class="hide-menu">Restaurant</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_restaurant.php">All Restaurants</a></li>
        
                                <li><a href="add_restaurant.php">Add Restaurant</a></li>
                            </ul>
                        </li>
                        <li><a href="all_orders.php"><i class="fa fa-shopping-cart"></i><span>Orders</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="container-fluid">
                <h2>Add New Restaurant</h2>
                <form method="post">
                    <div class="form-group">
                        <label for="tag">Tag:</label>
                        <input type="text" class="form-control" id="tag" name="tag" required>
                    </div>
                    <div class="form-group">
                        <label for="categories">Categories:</label>
                        <input type="text" class="form-control" id="categories" name="categories" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" class="form-control" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="latitude">Latitude:</label>
                        <input type="text" class="form-control" id="latitude" name="latitude" required>
                    </div>
                    <div class="form-group">
                        <label for="longitude">Longitude:</label>
                        <input type="text" class="form-control" id="longitude" name="longitude" required>
                    </div>
                    <div class="form-group">
                        <label for="postalCode">Postal Code:</label>
                        <input type="number" class="form-control" id="postalCode" name="postalCode" required>
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
        <?php include 'include/footer.php'; ?>
    </div>
    <script src="js/lib/jquery/jquery.min.js"></script>
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/sidebarmenu.js"></script>
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="js/custom.min.js"></script>
</body>
</html>
