<?php
$host = "127.0.0.1";
$user = "root";
$password = "11124130";
$dbname = "ogtech";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo $conn->ping() ? "" : "Database connection failed.";

?>
