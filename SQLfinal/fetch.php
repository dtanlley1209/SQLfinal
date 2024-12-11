<?php
require 'db_config.php';

$sql = "SELECT * FROM items";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "
        <div class='col-md-4'>
            <div class='card mb-4 shadow-sm'>
                <img src='product_images/{$row['Image']}' class='card-img-top' alt='{$row['Name']}'>
                <div class='card-body'>
                    <h5 class='card-title'>{$row['Name']}</h5>
                    <p class='card-text'>{$row['Description']}</p>
                    <p class='card-text'><strong>Price:</strong> {$row['SellingPrice']}</p>
                    <a href='product.php?id={$row['ItemID']}' class='btn btn-primary'>View Product</a>
                </div>
            </div>
        </div>";
    }
} else {
    echo "<p>No products found!</p>";
}
$conn->close();
?>
