<?php 
session_start();
include("redirect_to_home.php");
include("config.php");

if(isset($_POST['submit'])) {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $phone_no = trim($_POST['phone_no']);
    $password = $_POST['password'];
    $pref = ($_POST['pref'] == "veg") ? 0 : 1;

    // Using prepared statements to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM customers WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result_chk = $stmt->get_result();

    if($result_chk->num_rows > 0) {
        echo '<script type="text/javascript">alert("User account with that email already exists!");</script>';
    } elseif(strlen($phone_no) != 10) {
        echo '<script type="text/javascript">alert("Phone number should be of 10 digits.");</script>';
    } else {
        // Hashing the password securely
        $hashedpass = password_hash($password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("INSERT INTO customers (name, email, password, pref, phone_no) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssis", $name, $email, $hashedpass, $pref, $phone_no);
        if ($stmt->execute()) {
            header("Location: index.php?reg_success=yes");
            exit;
        } else {
            echo '<script type="text/javascript">alert("Registration failed: ' . htmlspecialchars(mysqli_error($conn)) . '");</script>';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Customer Registration</title>
</head>
<body>
    <a href="index.php"><h3 style="margin-left: 10px;"><< Back</h3></a>
    <div>
        <h2 style="text-align: center; color: #FFFFFF; margin-left: 45px;">Register Customer</h2>
        <br>
        <form action="register_usr.php" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your Name" required>
            <label for="InputEmail">Email address</label>
            <input type="email" id="InputEmail" name="email" placeholder="Enter your Email" required>
            <label for="phone_no">Phone Number</label>
            <input type="text" id="phone_no" name="phone_no" placeholder="Phone Number" required>
            <label for="InputPassword">Password</label>
            <input type="password" id="InputPassword" name="password" placeholder="Enter password" required>
            <fieldset>
                <input type="radio" id="veg" name="pref" value="veg" checked>
                <label for="veg">Veg</label>
                <input type="radio" id="non_veg" name="pref" value="non_veg">
                <label for="non_veg">Non-veg</label>
            </fieldset>
            <button style="width: 100%" type="submit" id="button" name="submit">Register</button>
        </form>
    </div>
</body>
</html>