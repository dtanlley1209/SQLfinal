<?php
session_start();
require 'db_config.php';

// Initialize the cart if not already done
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Handle adding to cart
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['productId'], $_POST['quantity'])) {
    $productId = $_POST['productId'];
    $quantity = (int)$_POST['quantity'];

    // Ensure the quantity is valid
    if ($quantity <= 0) {
        echo "Invalid quantity.";
        exit;
    }

    // Add the product to the cart or update its quantity
    if (isset($_SESSION['cart'][$productId])) {
        $_SESSION['cart'][$productId]["quantity"] += $quantity;
    } else {
        $_SESSION['cart'][$productId]["quantity"] = $quantity;
    }

    echo "Product added to cart!";
    header("Location: cart.php");
    exit;
}

// Fetch product details from the database for cart display
$cartItems = [];
$totalAmount = 0;

if (!empty($_SESSION['cart'])) {
    $productIds = implode(',', array_keys($_SESSION['cart']));
    $sql = "SELECT * FROM items WHERE ItemID IN ($productIds)";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $row['quantity'] = $_SESSION['cart'][$row['ItemID']]["quantity"];
            $row['subtotal'] = $row['SellingPrice'] * $row['quantity'];
            $cartItems[] = $row;
            $totalAmount += $row['subtotal'];
        }
    }
}

// Handle checkout (create order)
if (isset($_POST['checkout'])) {
    $memberId = $_SESSION['memberId']; // Assumes member ID is stored in session after login
    $status = 'Pending';
    $orderDate = date('Y-m-d H:i:s');

    // Insert into orders table
    $stmt = $conn->prepare("INSERT INTO orders (MemberID, OrderDate, TotalAmount, Status) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isds", $memberId, $orderDate, $totalAmount, $status);
    if ($stmt->execute()) {
        $orderId = $stmt->insert_id;

        // Clear the cart
        $_SESSION['cart'] = [];
        echo "Order placed successfully! Your order ID is: " . $orderId.'<br>';
		echo '<a href="index.php" class="btn btn-primary mt-2">Continue Shopping</a>';
    } else {
        echo "Error placing order.".'<br>';
		echo '<a href="index.php" class="btn btn-primary mt-2">Continue Shopping</a>';
    }
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Shopping Cart</h1>

        <?php if (empty($cartItems)): ?>
            <p class="text-center">Your cart is empty.</p>
            <a href="index.php" class="btn btn-primary">Continue Shopping</a>
        <?php else: ?>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($cartItems as $item): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($item['Name']); ?></td>
                            <td>$<?php echo number_format($item['SellingPrice'], 2); ?></td>
                            <td><?php echo $item['quantity']; ?></td>
                            <td>$<?php echo number_format($item['subtotal'], 2); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <h3>Total: $<?php echo number_format($totalAmount, 2); ?></h3>
            <form method="POST" action="">
                <button type="submit" name="checkout" class="btn btn-success">Checkout</button>
            </form>
            <a href="index.php" class="btn btn-primary mt-2">Continue Shopping</a>
        <?php endif; ?>
    </div>
</body>
</html>
