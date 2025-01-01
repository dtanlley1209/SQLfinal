<?php
session_start();
require 'db_config.php';
// Check if the user is logged in and has manager privileges
if (!isset($_SESSION['user']) || $_SESSION['role'] !== 0){
    header("Location: login.html");
    exit;
}
$memberId = $_SESSION['memberId'];
if($_SERVER['REQUEST_METHOD'] == 'POST'){
	$orderid=$_POST['order_id'];
	
	$del_sql="DELETE from orders where orderid=?";
	$stmt = $conn->prepare($del_sql);
	$stmt->bind_param("s", $orderid);
	$stmt->execute();
}
// Get user details from the database
$sql = "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status, m.Username 
             FROM orders o
             JOIN members m ON o.MemberID = m.MemberID where o.MemberID=?
             ORDER BY o.OrderDate DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $memberId);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
 <!-- Orders Management Section -->
        <h2 class="mt-5">Orders Management</h2>
		<a href="index.php" class="btn btn-warning">Go to Home</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Username</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['OrderID']; ?></td>
                        <td><?php echo htmlspecialchars($row['Username']); ?></td>
                        <td><?php echo $row['OrderDate']; ?></td>
                        <td>$<?php echo number_format($row['TotalAmount'], 2); ?></td>
                        <td><?php echo htmlspecialchars($row['Status']); ?></td>
                        <td>
                            <form action="orders.php" method="POST" class="d-inline">
                                <input type="hidden" name="order_id" value="<?php echo $row['OrderID']; ?>">
                                
                                <button type="submit" name="update_order_status" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
</body>