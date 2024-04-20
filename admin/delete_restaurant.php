<?php
include("../connection/connect.php");
error_reporting(E_ALL);
session_start();

if(isset($_GET['res_del'])) {
    $res_id = $_GET['res_del'];

    // Prepare a statement for safer execution
    $stmt = $db->prepare("DELETE FROM Restaurants WHERE id = ?");

    // Check if preparation was successful
    if ($stmt === false) {
        die('MySQL prepare error: ' . $db->error);
    }

    // Bind parameters and execute
    $stmt->bind_param("i", $res_id);
    if($stmt->execute()) {
        // Check for successful row deletion
        if ($stmt->affected_rows > 0) {
            header("location:all_restaurant.php");
            exit();
        } else {
            echo "<script>alert('No such restaurant found.'); window.location.href='all_restaurant.php';</script>";
        }
    } else {
        // Log detailed error
        die('Execute error: ' . $stmt->error);
    }
} else {
    echo "<script>alert('No restaurant specified.'); window.location.href='all_restaurant.php';</script>";
}
?>
