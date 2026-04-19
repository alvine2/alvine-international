<?php
$server = "localhost";
$user = "root";
$password = "";
$db = "lehi_school";

$conn = mysqli_connect($server, $user, $password, $db);

if (!$conn) {
    echo json_encode([
        "status" => "error",
        "message" => "Database connection failed"
    ]);
    exit();
}
?>