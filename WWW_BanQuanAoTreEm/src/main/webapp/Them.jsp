<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Quần Áo Trẻ Em</title>
<link rel="stylesheet" href="css/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f2f5;
        color: #333;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        background-image: url('img/ADN.jpg'); /* Đặt ảnh làm nền cho toàn bộ trang */
        background-size: cover;
        background-position: center;
    }
    header {
        background-color: rgba(76, 175, 80, 0.8); /* Nền mờ cho header */
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
        flex: 1;
        padding: 20px;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.9); /* Nền mờ cho phần nội dung chính */
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 800px;
        margin: 20px auto;
    }
    .container {
        text-align: left;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f9f9f9;
    }
    .button {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #66BB6A;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        margin-top: 20px;
        transition: background-color 0.3s;
    }
    .button:hover {
        background-color: #81C784;
    }
    .centered {
        text-align: center;
        margin-top: 20px; 
    }
    h2 {
        margin-top: 20px;
        color: #007bb5;
    }
    footer {
        background-color: rgba(76, 175, 80, 0.8); /* Nền mờ cho footer */
        color: #fff;
        text-align: center;
        padding: 10px 0;
        position: relative;
        bottom: 0;
        width: 100%;
    }
    footer p {
        margin: 0;
    }
</style>
</head>
<body>
    <header>
        <h1>Trang Chủ Quản Trị</h1>
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
        <div class="container">
            <h2>Thêm Quần Áo</h2>
            <form action="them" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td><label for="maQuanAo">Mã Quần Áo</label></td>
                        <td><input type="text" id="maQuanAo" name="maQuanAo" required></td>
                    </tr>
                    <tr>
                        <td><label for="tenQuanAo">Tên Quần Áo</label></td>
                        <td><input type="text" id="tenQuanAo" name="tenQuanAo" required></td>
                    </tr>
                    <tr>
                        <td><label for="gia">Giá</label></td>
                        <td><input type="number" id="gia" name="gia" required></td>
                    </tr>
                    <tr>
                        <td><label for="tinhTrang">Tình Trạng</label></td>
                        <td><input type="text" id="tinhTrang" name="tinhTrang" required></td>
                    </tr>
                    <tr>
                        <td><label for="loaiQuanAo">Loại Quần Áo</label></td>
                        <td><input type="text" id="loaiQuanAo" name="loaiQuanAo" required></td>
                    </tr>
                    <tr>
                        <td><label for="anh">Ảnh</label></td>
                        <td><input type="file" id="anh" name="anh" accept="image/*" required></td>
                    </tr>
                </table>
                <div class="centered">
                    <input type="submit" value="Thêm Quần Áo" class="button">
                    <a href="TrangChuAdmin.jsp" class="button">Quay lại Trang Chủ</a>
                </div>
                <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
            </form>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quản lý bán quần áo</p>
    </footer>
</body>
</html>
