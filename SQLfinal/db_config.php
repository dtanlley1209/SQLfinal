<?php
$host = "127.0.0.1";
$user = "root";
$password = "2m=.zg3G1+s6";
$dbname = "ogtech";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo $conn->ping() ? "" : "Database connection failed.";

?>
