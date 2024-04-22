<?php 
session_start();
include("redirect_to_home.php");
include("config.php");

if (isset($_POST['submit'])) {
    $email = $_POST['email'];
    $pass = $_POST['password'];

    $stmt = $conn->prepare("SELECT id, password FROM restaurants WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($pass, $row['password'])) {
            $_SESSION['id'] = $row['id'];
            $_SESSION['user'] = 'res';

            if(isset($_POST['rememberme'])) {
                setcookie("user_session_id", session_id(), time() + 3600);
            }

            header('Location: res_home.php');
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
    <link rel="stylesheet" type="text/css" href="https://yui.yahooapis.com/3.18.1/build/cssnormalize/cssnormalize-min.css">
    <link rel="stylesheet" href="style.css">
    <title>Restaurant Login</title>
</head>
<body>
    <a href="index.php"><h3 style="margin-left: 10px;"><< Back</h3></a>
    <h2 style="text-align: center; color: #FFFFFF; margin-left: 5px;">Restaurant Login</h2>
    <br>
    <form action="login_res.php" method="POST">
        <label for="InputEmail">Email address</label>
        <input type="email" id="InputEmail" name="email" placeholder="Enter your Email" required>
        <label for="InputPassword">Password</label>
        <input type="password" id="InputPassword" name="password" placeholder="Enter password" required>
        <fieldset>
            <label for="rememberme">Remember me? </label>
            <input type="checkbox" id="rememberme" name="rememberme">
        </fieldset>
        <button style="width: 100%" type="submit" id="button" name="submit">Login</button>
    </form>
</body>
</html>
