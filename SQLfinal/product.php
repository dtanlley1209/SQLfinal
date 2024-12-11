<?php
session_start();
require 'db_config.php';

// 檢查是否有產品 ID 傳遞
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo "Product ID not specified.";
    exit;
}

$productId = $_GET['id'];

// 從資料庫中獲取產品詳細信息
$sql = "SELECT * FROM items WHERE ItemID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $productId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    echo "Product not found.";
    exit;
}

$product = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($product['Name']); ?> - Product Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center"><?php echo htmlspecialchars($product['Name']); ?></h1>
        <div class="row mt-4">
            <div class="col-md-6">
                <img src="product_images/<?php echo htmlspecialchars($product['Image']); ?>" alt="Product Image" class="img-fluid">
            </div>
            <div class="col-md-6">
                <h3>Price: $<?php echo number_format($product['SellingPrice'], 2); ?></h3>
                <p><?php echo nl2br(htmlspecialchars($product['Description'])); ?></p>
                <form action="cart.php" method="POST">
                    <input type="hidden" name="productId" value="<?php echo $product['ItemID']; ?>">
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" class="form-control" value="1" min="1" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </form>
            </div>
        </div>
        <a href="index.php" class="btn btn-secondary mt-4">Back to Home</a>
    </div>
</body>
</html>
