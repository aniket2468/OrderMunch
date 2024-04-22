<?php 
session_start();
include("redirect_to_home.php");
include("config.php");

if(isset($_POST['submit'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $location = $_POST['location'];

    // Prepare SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM restaurants WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result_chk = $stmt->get_result();

    if($result_chk->num_rows > 0) {
        echo '<script type="text/javascript">alert("Restaurant account with that email already exists!");</script>';
    } else {
        // Securely hash the password
        $hashedpass = password_hash($password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("INSERT INTO restaurants (name, email, password, location) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $name, $email, $hashedpass, $location);
        if($stmt->execute()) {
            header("Location: index.php?reg_success=yes");
            exit;
        } else {
            echo '<script type="text/javascript">alert("Error in registration!");</script>';
        }
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Restaurant Registration</title>
</head>
<body>
    <a href="index.php"><h3 style="margin-left: 10px;"><< Back</h3></a>
    <div>
        <h2 style="text-align: center; color: #FFFFFF; margin-left: 45px;">Register Restaurant</h2>
        <br>
        <form action="register_res.php" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter restaurant name" required>
            <label for="InputEmail">Email address</label>
            <input type="email" id="InputEmail" name="email" placeholder="Enter your Email" required>
            <label for="InputPassword">Password</label>
            <input type="password" id="InputPassword" name="password" placeholder="Enter password" required>
            <label for="location">Location</label>
            <input type="text" id="location" name="location" placeholder="Enter location" required>
            <button style="width: 100%" type="submit" id="button" name="submit">Register</button>
        </form>
    </div>
</body>
</html>
