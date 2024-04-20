<?php
include("../connection/connect.php"); // Include your database connection file
error_reporting(0);
session_start();

if (!isset($_SESSION['adm_id'])) {
    header('location:../login.php');
    exit;
}

$error = $success = '';  // Initialize the variables to avoid undefined variable errors

// Fetch existing data
if (isset($_GET['res_upd']) || isset($_POST['res_upd'])) {
    $id = isset($_GET['res_upd']) ? $_GET['res_upd'] : $_POST['res_upd'];
    $query = "SELECT r.id as res_id, r.tag, r.categories, l.address, l.city, l.latitude, l.longitude, l.postalCode FROM RESTAURANTS r JOIN LOCATIONS l ON r.id = l.restaurant_id WHERE r.id = ?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
}

// Handle the form submission
if (isset($_POST['submit'])) {
    $id = $_POST['res_upd'];
    $tag = $_POST['tag'];
    $categories = $_POST['categories'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $latitude = floatval($_POST['latitude']);
    $longitude = floatval($_POST['longitude']);
    $postalCode = intval($_POST['postalCode']);

    // Validate inputs
    if (empty($tag) || empty($categories) || empty($address) || empty($city) || empty($latitude) || empty($longitude) || empty($postalCode)) {
        $error = '<div class="alert alert-danger">Please fill all fields.</div>';
    } else {
        // Update the RESTAURANTS table
        $updateRestaurant = "UPDATE RESTAURANTS SET tag=?, categories=? WHERE id=?";
        $stmt = $db->prepare($updateRestaurant);
        $stmt->bind_param("ssi", $tag, $categories, $id);
        $stmt->execute();

        // Update the LOCATIONS table
        $updateLocation = "UPDATE LOCATIONS SET address=?, city=?, latitude=?, longitude=?, postalCode=? WHERE restaurant_id=?";
        $stmt = $db->prepare($updateLocation);
        $stmt->bind_param("ssddii", $address, $city, $latitude, $longitude, $postalCode, $id);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $success = '<div class="alert alert-success">Restaurant updated successfully.</div>';
        } else {
            $error = '<div class="alert alert-danger">No changes made or error updating restaurant.</div>';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Restaurant</title>
    <link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/helper.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome for icons (you can use your own choice) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>
<body class="fix-header fix-sidebar">
    <div id="main-wrapper">
        <?php include 'include/header.php'; ?>
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
                <h2>Update Restaurant</h2>
                <?php echo $error; echo $success; ?>
                <form method="post">
                    <input type="hidden" name="res_upd" value="<?php echo $id; ?>">
                    <div class="form-group">
                        <label for="tag">Tag:</label>
                        <input type="text" class="form-control" id="tag" name="tag" required value="<?php echo htmlspecialchars($row['tag']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="categories">Categories:</label>
                        <input type="text" class="form-control" id="categories" name="categories" required value="<?php echo htmlspecialchars($row['categories']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address" required value="<?php echo htmlspecialchars($row['address']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" class="form-control" id="city" name="city" required value="<?php echo htmlspecialchars($row['city']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="latitude">Latitude:</label>
                        <input type="text" class="form-control" id="latitude" name="latitude" required value="<?php echo htmlspecialchars($row['latitude']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="longitude">Longitude:</label>
                        <input type="text" class="form-control" id="longitude" name="longitude" required value="<?php echo htmlspecialchars($row['longitude']); ?>">
                    </div>
                    <div class="form-group">
                        <label for="postalCode">Postal Code:</label>
                        <input type="number" class="form-control" id="postalCode" name="postalCode" required value="<?php echo $row['postalCode']; ?>">
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary">Update</button>
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
