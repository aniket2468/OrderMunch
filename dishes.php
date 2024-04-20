<?php
include("connection/connect.php"); // connection to database
error_reporting(0);
session_start();

include_once 'product-action.php'; // Include the file for handling product actions

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Dishes || Online Food Ordering System</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <header id="header" class="header-scroll top-header headrom">
        <nav class="navbar navbar-dark">
            <div class="container">
                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                <a class="navbar-brand" href="index.php"> <img class="img-rounded" src="images/logo.png" alt="" width="18%"> </a>
                <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                    <ul class="nav navbar-nav">
                        <li class="nav-item"> <a class="nav-link active" href="index.php">Home <span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link active" href="restaurants.php">Restaurants</a> </li>
                        <?php
                        if(empty($_SESSION["user_id"])) {
                            echo '<li class="nav-item"><a href="login.php" class="nav-link active">Login</a> </li>
                                  <li class="nav-item"><a href="registration.php" class="nav-link active">Register</a> </li>';
                        } else {
                            echo  '<li class="nav-item"><a href="your_orders.php" class="nav-link active">My Orders</a> </li>';
                            echo  '<li class="nav-item"><a href="logout.php" class="nav-link active">Logout</a> </li>';
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-wrapper">
        <?php
        $restaurant = array(); // Initialize the restaurant array to avoid undefined errors
        if(isset($_GET['res_id'])) { // Changed from 'id' to 'menu_id'
    $res_id = $_GET['res_id'];
    $stmt = $db->prepare("SELECT * FROM RESTAURANTS WHERE id = ?");
    $stmt->bind_param("i", $res_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows > 0) {
        $restaurant = $result->fetch_assoc();
    } else {
        echo '<p>Restaurant with specified ID not found.</p>'; // Debug output
    }
} else {
    echo '<p>No restaurant ID provided.</p>'; // Debug output
}
        ?>
        <section class="inner-page-hero bg-image" data-image-src="images/img/restrrr.png">
            <div class="profile">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 profile-img">
                            <div class="image-wrap">
                               
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 profile-desc">
                            <div class="pull-left right-text white-txt">
                                <h6><a href="#"><?php echo $restaurant['tag']; ?></a></h6>
                                <p><?php echo $restaurant['categories']; ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="container m-t-30">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                    <div class="widget widget-cart">
                        <div class="widget-heading">
                            <h3 class="widget-title text-dark">Your Cart</h3>
                            <div class="clearfix"></div>
                        </div>
                        <div class="widget-body">
                            <?php
                            $item_total = 0;
                            if (!empty($_SESSION["cart_item"])) {
                                foreach ($_SESSION["cart_item"] as $item) {
                                    ?>
                                    <div class="title-row"><?php echo $item["title"]; ?><a href="dishes.php?res_id=<?php echo $_GET['res_id']; ?>&action=remove&id=<?php echo $item["id"]; ?>"><i class="fa fa-trash pull-right"></i></a></div>
                                    <div class="form-group row no-gutter">
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control b-r-0" value="<?php echo "$".$item["price"]; ?>" readonly>
                                        </div>
                                        <div class="col-xs-4">
                                            <input class="form-control" type="text" readonly value='<?php echo $item["quantity"]; ?>'>
                                        </div>
                                    </div>
                                    <?php
                                    $item_total += ($item["price"]*$item["quantity"]);
                                }
                            }
                            ?>
                        </div>
                        <div class="widget-body">
                            <div class="price-wrap text-xs-center">
                                <p>TOTAL</p>
                                <h3 class="value"><strong><?php echo "$".$item_total; ?></strong></h3>
                                <p>Free Delivery!</p>
                                <a href="checkout.php?res_id=<?php echo $_GET['res_id'];?>&action=check" class="btn btn-success btn-lg <?php if($item_total==0) echo 'disabled'; ?>">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="menu-widget m-b-30">
                        <h3 class="widget-title text-dark">MENU</h3>
                        <?php
                        // Use the correct GET parameter 'id' instead of 'res_id' as per your updated information
                        if(isset($_GET['res_id'])) {
                            $stmt = $db->prepare("SELECT * FROM MENUS WHERE restaurant_id = ?");
                            $stmt->bind_param("i", $_GET['res_id']);
                            $stmt->execute();
                            $result = $stmt->get_result();
                            if($result->num_rows == 0) {
                                echo '<p>No menu items found for this restaurant.</p>'; // Debug output
                            }
                            while($menu = $result->fetch_assoc()) {
                                ?>
                                <div class="food-item">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-8">
                                            <form method="post" action='dishes.php?res_id=<?php echo $_GET['res_id'];?>&action=add&id=<?php echo $menu['id']; ?>'>
                                                
                                                <div class="rest-descr">
                                                    <h6><a href="#"><?php echo htmlspecialchars($menu['menus_name']); ?></a></h6>
                                                    <p><?php echo htmlspecialchars($menu['menus_description']); ?></p>
                                                </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-lg-4 pull-right item-cart-info">
                                            <span class="price pull-left">$<?php echo $menu['menus_amountMin']; ?></span>
                                            <input class="b-r-0" type="text" name="quantity" value="1" size="2" />
                                            <input type="submit" class="btn theme-btn" value="Add To Cart" />
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                <?php
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <?php include "include/footer.php"; ?>
    </div>
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
