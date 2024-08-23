<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.Customer"%>
<%
Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông Tin Tài Khoản</title>
<link rel="stylesheet" href="css/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #e8f5e9; /* Nền xanh lá cây nhạt cho phần còn lại của trang */
        color: #333;
        text-align: center;
    }
    header {
        background-color: #388e3c; /* Màu xanh lá cây đậm cho header */
        color: #fff;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 28px;
    }
    nav ul {
        list-style-type: none;
        padding: 0;
        margin: 10px 0 0;
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    nav ul li {
        display: inline;
    }
    nav ul li a {
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        background-color: #66bb6a; /* Màu xanh lá cây sáng cho các liên kết */
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    nav ul li a:hover {
        background-color: #81c784; /* Màu xanh lá cây đậm hơn khi hover */
    }
    section {
        margin: 20px;
        padding: 20px;
        background-color: #fff; /* Nền trắng cho phần nội dung */
        border-radius: 8px;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        max-width: 800px;
        margin: 20px auto;
    }
    h2 {
        color: #388e3c; /* Màu xanh lá cây đậm cho tiêu đề */
        font-size: 24px;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f4f4f4;
    }
    .button {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #388e3c; /* Màu xanh lá cây đậm cho nút */
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        margin-top: 20px;
        transition: background-color 0.3s;
    }
    .button:hover {
        background-color: #2c6c2f; /* Màu xanh lá cây tối hơn khi hover */
    }
</style>
</head>
<body>
    <header>
        <h1>Thông Tin Tài Khoản</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <h2>Thông Tin Cá Nhân</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Địa Chỉ</th>
            </tr>
            <tr>
                <td><%= customer != null ? customer.getCustomerId() : "N/A" %></td>
                <td><%= customer != null ? customer.getFullName() : "N/A" %></td>
                <td><%= customer != null ? customer.getPhoneNumber() : "N/A" %></td>
                <td><%= customer != null ? customer.getAddress() : "N/A" %></td>
            </tr>
        </table>
    </section>
    <div>
        <a href="TrangChuKhach.jsp" class="button">Quay lại Trang Chủ</a>
    </div>
</body>
</html>
