<?php
session_start();
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM members WHERE Username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user && password_verify($password, $user['Password'])) {
        $_SESSION['user'] = $user['Username'];
		$_SESSION['memberId'] = $user['MemberID'];
		$_SESSION['role'] = $user['PrivilegeLevel'];
		if($_SESSION['role']==1){
			header("Location: manager_dashboard.php");
			exit;
		}
		else{
			header("Location: dashboard.php");
			exit;
		}
    } else {
        echo "Invalid username or password.";
    }
}
?>


