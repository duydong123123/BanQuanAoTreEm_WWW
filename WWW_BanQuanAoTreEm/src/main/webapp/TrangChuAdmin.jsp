<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ Quản Trị</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            color: #333;
        }
        header {
            background-color: #4CAF50;
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        header h1 {
            margin: 0 0 10px 0;
            font-size: 24px;
        }
        nav {
            margin-top: 10px;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        nav ul li {
            display: inline;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #66BB6A;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        nav ul li a:hover {
            background-color: #81C784;
        }
        main {
            padding: 20px;
            text-align: center;
        }
        footer {
            background-color: #4CAF50;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        footer p {
            margin: 0;
        }
        .image-container {
            width: 100%;
            height: 480px; /* Đặt chiều cao cố định cho khung ảnh */
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh bao phủ toàn bộ khung */
        }
    </style>
</head>
<body>
    <header>
        <h1>Trang Chu Quan Tri</h1>
        <nav>
           <ul>
                <li><a href="Them.jsp">Thêm</a></li>
                <li><a href="Xoa.jsp">Xóa</a></li>
                <li><a href="CapNhat.jsp">Cập Nhật</a></li>
                <li><a href="QuanLyTaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Chào Mừng Đến Với Hệ Thống Quản Lý Bán Quần Áo</h2>
        <div class="image-container">
            <img src="img/BQATE.jpg" alt="Mô tả ảnh">
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quản lý bán quần áo</p>
    </footer>
</body>
</html>
