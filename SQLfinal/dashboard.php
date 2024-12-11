<?php
session_start();

// Check if the user is logged in, otherwise redirect to login page
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit;
}

require 'db_config.php';

$username = $_SESSION['user'];

// Get user details from the database
$sql = "SELECT * FROM members WHERE Username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();


if (!$user) {
    // If no user found, redirect to login page
    header("Location: login.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Welcome, <?php echo htmlspecialchars($user['Username']); ?>!</h1>
        
        <div class="card mt-3">
            <div class="card-body">
                <h5 class="card-title">Your Profile</h5>
                <p><strong>Username:</strong> <?php echo htmlspecialchars($user['Username']); ?></p>
                <p><strong>Email:</strong> <?php echo htmlspecialchars($user['Email']); ?></p>
                <p><strong>Phone:</strong> <?php echo htmlspecialchars($user['Phone']); ?></p> <!-- Placeholder if you don't have phone -->
                <p><strong>Address:</strong> <?php echo htmlspecialchars($user['Address']); ?></p> <!-- Placeholder if you don't have address -->
            </div>
        </div>

        <!-- Add links for the user -->
        <div class="mt-3">
            <a href="edit_profile.php" class="btn btn-warning">Edit Profile</a>
            <a href="logout.php" class="btn btn-danger">Logout</a>
			<a href="http://127.0.0.1/SQLfinal/" class="btn btn-danger">Go to Home</a>
        </div>
    </div>
</body>
</html>
