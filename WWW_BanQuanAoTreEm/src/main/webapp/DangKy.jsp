<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin-top: 20px;
            z-index: 1; /* Đặt z-index để khung đăng ký nằm trên hình ảnh */
        }
        h2 {
            color: #007bb5;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #007bb5;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #005f8b;
        }
        .background-image {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: auto;
            z-index: 0; /* Đặt z-index để hình ảnh nằm dưới khung đăng ký */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Đăng Ký Tài Khoản</h2>
        <form action="DangKyServlet" method="post">
            <input type="text" name="fullName" placeholder="Họ và Tên" required><br>
            <input type="text" name="phoneNumber" placeholder="SĐT" required><br>
            <input type="password" name="password" placeholder="Mật khẩu" required><br>
            <input type="text" name="address" placeholder="Địa chỉ" required><br>
            <input type="submit" value="Đăng Ký">
        </form>
    </div>
    <img src="img/ADN.jpg" alt="Background Image" class="background-image">
</body>
</html>
