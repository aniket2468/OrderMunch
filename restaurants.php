<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
error_reporting(0);
session_start();
?>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Restaurants</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        h1.text-center {
            font-size: 2.5em; /* 40px */
            color: #333; /* Dark grey */
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 3px;
        }
        /* Additional custom styles */
        body {
            background-color: #f4f4f4; /* Light grey background */
        }
        /* You can add more custom styles here */
    </style>
</head>
<body>
    <?php
    include("connection/connect.php");
    error_reporting(E_ALL);
    session_start();
    ?>

    <!-- Header and Navigation -->
    <header id="header" class="header-scroll top-header headrom">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-dark">
            <div class="container">
                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                <a class="navbar-brand" href="index.php"><img class="img-rounded" src="images/logo.png" alt="" width="18%"></a>
                <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                    <ul class="nav navbar-nav">
                        <li class="nav-item"><a class="nav-link active" href="index.php">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="restaurants.php">Restaurants</a></li>
                        <?php
                        if (empty($_SESSION["user_id"])) {
                            echo '<li class="nav-item"><a href="login.php" class="nav-link active">Login</a></li>';
                            echo '<li class="nav-item"><a href="registration.php" class="nav-link active">Register</a></li>';
                        } else {
                            echo '<li class="nav-item"><a href="your_orders.php" class="nav-link active">My Orders</a></li>';
                            echo '<li class="nav-item"><a href="logout.php" class="nav-link active">Logout</a></li>';
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content Area -->
    <div class="page-wrapper">
        <div class="container">
            <div class="row">

            <h1 class="text-center"> ALL RESAURANTS </h1>
                <!-- Displaying Restaurants -->
                <?php
                $query = "SELECT * FROM restaurants"; // Assuming 'restaurants' is your table name
                $result = mysqli_query($db, $query);
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '
                    <div class="col-md-4">
                        <div class="restaurant-entry">
                            <div class="entry-logo">
                                <a class="img-fluid" href="dishes.php?res_id=' . $row['id'] . '"><img src="admin/Res_img/6290860e72d1e.jpg' . $row['image'] . '" alt="Restaurant logo"></a>
                            </div>
                            <div class="entry-dscr">
                                <h5><a href="dishes.php?res_id=' . $row['id'] . '">' . $row['title'] . '</a></h5>
                                <span>' . $row['address'] . '</span>
                                <a href="dishes.php?res_id=' . $row['id'] . '" class="btn btn-primary">View Menu</a>
                            </div>
                        </div>
                    </div>';
                }
                ?>
            </div>
        </div>
    </div>

    <!-- Include Footer -->
    <?php include "include/footer.php"; ?>

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>
</html>
