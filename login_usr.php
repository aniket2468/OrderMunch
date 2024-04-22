<?php 
session_start();

// Redirect if the user is already logged in
if(isset($_GET['login']))
    echo '<script type="text/javascript">alert("You need to login first");</script>';

include("redirect_to_home.php");
include("config.php");

if(isset($_POST['submit'])) {
    $email = $_POST['email'];
    $pass = $_POST['password'];

    // Prepare a statement for enhanced security
    $stmt = $conn->prepare("SELECT id, password FROM customers WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $hashed_password = $user['password'];

        if(password_verify($pass, $hashed_password)) {
            // Successful login
            $_SESSION['id'] = $user["id"];
            $_SESSION['user'] = 'cus';

            // Check for 'remember me' option
            if(isset($_POST['rememberme'])) {
                setcookie ("email", $email, time()+3600, "/", "", 0); // 1 hour
                setcookie ("password", $pass, time()+3600, "/", "", 0); // 1 hour
            }

            header('Location: cus_home.php'); 
            exit; 
        } else {
            echo '<script type="text/javascript">alert("Password Incorrect");</script>';
        }
    } else {
        echo '<script type="text/javascript">alert("Email not Found");</script>';
    }
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Customer Login</title>
</head>
<body>
    <a href="index.php"><h3 style="margin-left: 10px;"><< Back</h3></a>
    <h2 style="text-align: center; color: #FFFFFF; margin-left: 5px;">Customer Login</h2>
    <br>
    <form action="login_usr.php" method="POST">
        <label for="InputEmail">Email address</label>
        <input type="email" id="InputEmail" name="email" placeholder="Enter your Email" value="<?php echo isset($_COOKIE['email']) ? htmlspecialchars($_COOKIE['email']) : ''; ?>" required>
        <label for="InputPassword">Password</label>
        <input type="password" id="InputPassword" name="password" placeholder="Enter password" value="<?php echo isset($_COOKIE['password']) ? htmlspecialchars($_COOKIE['password']) : ''; ?>" required>
        <fieldset>
            <label for="rememberme">Remember me?</label>
            <input type="checkbox" id="rememberme" name="rememberme">
        </fieldset>
        <button style="width: 100%" type="submit" id="button" name="submit">Login</button>
    </form>
</body>
</html>
