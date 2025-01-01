<?php
session_start(); // 啟用 Session

// 檢查用戶是否已經登入
$isLoggedIn = isset($_SESSION['user']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3C and peripheral Platform</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <!-- 頁面標題 -->
        <h1 class="text-center">Welcome !</h1>

        <!-- 登入狀態欄 -->
        <div class="text-end mb-3">
            <?php if ($isLoggedIn): ?>
                <p>Hello, <?php echo htmlspecialchars($_SESSION['user']); ?>!</p>
                <a href="logout.php" class="btn btn-danger">Logout</a>
				<a href="orders.php" class="btn btn-warning">Orders Management</a>
            <?php else: ?>
                <a href="login.html" class="btn btn-success">Login</a>
				 <a href="register.php" class="btn btn-primary">Sing up</a>
            <?php endif; ?>
        </div>

        <!-- 商品列表 -->
        <div class="row" id="items">
            <?php include 'fetch.php'; ?>
        </div>
    </div>
</body>
</html>

