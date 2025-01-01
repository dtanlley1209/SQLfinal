<?php
session_start();
require 'db_config.php';

// Check if the user is logged in and has manager privileges
if (!isset($_SESSION['user']) || $_SESSION['role'] !== 1) {
    header("Location: login.html");
    exit;
}

// Fetch inventory data
$inventorySql = "SELECT * FROM items";
$inventoryResult = $conn->query($inventorySql);

// Fetch orders data
$orderSql = "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status, m.Username 
             FROM orders o 
             JOIN members m ON o.MemberID = m.MemberID 
             ORDER BY o.OrderDate DESC";
$orderResult = $conn->query($orderSql);

// Handle inventory updates
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['update_inventory'])) {
        $itemId = $_POST['item_id'];
        $newStock = $_POST['stock'];

        $updateSql = "UPDATE items SET QuantityInStock = ? WHERE ItemID = ?";
        $stmt = $conn->prepare($updateSql);
        $stmt->bind_param("ii", $newStock, $itemId);

        if ($stmt->execute()) {
            echo "Stock updated successfully.";
        } else {
            echo "Failed to update stock.";
        }
    }

    if (isset($_POST['update_order_status'])) {
        $orderId = $_POST['order_id'];
        $newStatus = $_POST['status'];

        $updateOrderSql = "UPDATE orders SET Status = ? WHERE OrderID = ?";
        $stmt = $conn->prepare($updateOrderSql);
        $stmt->bind_param("si", $newStatus, $orderId);

        if ($stmt->execute()) {
            echo "Order status updated successfully.";
        } else {
            echo "Failed to update order status.";
        }
    }

    header("Location: manager_dashboard.php");
    exit;
}
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
    <div class="container mt-5">
        <h1 class="text-center">Manager Dashboard</h1>
        <div class="text-end mb-3">
            <a href="logout.php" class="btn btn-danger">Logout</a>
        </div>

        <!-- Inventory Management Section -->
        <h2>Inventory Management</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $inventoryResult->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['ItemID']; ?></td>
                        <td><?php echo htmlspecialchars($row['Name']); ?></td>
                        <td>$<?php echo number_format($row['SellingPrice'], 2); ?></td>
                        <td><?php echo $row['QuantityInStock']; ?></td>
                        <td>
                            <form method="POST" class="d-inline">
                                <input type="hidden" name="item_id" value="<?php echo $row['ItemID']; ?>">
                                <input type="number" name="stock" class="form-control d-inline" style="width: 80px;" value="<?php echo $row['QuantityInStock']; ?>" required>
                                <button type="submit" name="update_inventory" class="btn btn-sm btn-primary">Update</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <!-- Orders Management Section -->
        <h2 class="mt-5">Orders Management</h2>
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
                <?php while ($row = $orderResult->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['OrderID']; ?></td>
                        <td><?php echo htmlspecialchars($row['Username']); ?></td>
                        <td><?php echo $row['OrderDate']; ?></td>
                        <td>$<?php echo number_format($row['TotalAmount'], 2); ?></td>
                        <td><?php echo htmlspecialchars($row['Status']); ?></td>
                        <td>
                            <form method="POST" class="d-inline">
                                <input type="hidden" name="order_id" value="<?php echo $row['OrderID']; ?>">
                                <select name="status" class="form-select d-inline" style="width: auto;" required>
                                    <option value="Pending" <?php echo $row['Status'] === 'Pending' ? 'selected' : ''; ?>>Pending</option>
                                    <option value="Processing" <?php echo $row['Status'] === 'Processing' ? 'selected' : ''; ?>>Processing</option>
                                    <option value="Completed" <?php echo $row['Status'] === 'Completed' ? 'selected' : ''; ?>>Completed</option>
                                    <option value="Cancelled" <?php echo $row['Status'] === 'Cancelled' ? 'selected' : ''; ?>>Cancelled</option>
                                </select>
                                <button type="submit" name="update_order_status" class="btn btn-sm btn-primary">Update</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
