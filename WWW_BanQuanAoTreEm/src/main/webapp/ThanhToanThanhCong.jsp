<%@page import="entities.QuanAoTreEm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.QuanAoTreEm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e8f5e9; /* Nền xanh lá cây nhạt */
            color: #333;
        }
        header {
            background-color: #388e3c; /* Màu xanh lá cây đậm */
            color: #fff;
            padding: 20px;
            text-align: center;
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
            background-color: #66bb6a; /* Màu xanh lá cây sáng */
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        nav ul li a:hover {
            background-color: #81c784; /* Màu xanh lá cây đậm hơn khi hover */
        }
        .invoice-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            margin-top: 20px;
        }
        .invoice-container h2 {
            font-size: 24px;
            margin: 10px 0;
            text-align: center;
            color: #388e3c; /* Màu xanh lá cây đậm */
        }
        .invoice-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .invoice-container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .invoice-container table, .invoice-container th, .invoice-container td {
            border: 1px solid #ddd;
        }
        .invoice-container th, .invoice-container td {
            padding: 10px;
            text-align: left;
        }
        .invoice-container th {
            background-color: #f4f4f4;
        }
        .total-price {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #388e3c; /* Màu xanh lá cây đậm */
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #2c6c2f; /* Màu xanh lá cây tối hơn khi hover */
        }
    </style>
</head>
<body>
    <header>
        <h1>Thanh Toán Thành Công</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHang.jsp">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <div class="invoice-container">
            <h2>Hóa Đơn Thanh Toán</h2>
            <p><strong>Ngày giờ:</strong> <%= session.getAttribute("orderDate") %></p>
            <table>
                <thead>
                    <tr>
                        <th>Mã Quần Áo</th>
                        <th>Tên Quần Áo</th>
                        <th>Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<QuanAoTreEm> gioHang = (List<QuanAoTreEm>) session.getAttribute("gioHang");
                        int totalPrice = 0;
                        if (gioHang != null && !gioHang.isEmpty()) {
                            for (QuanAoTreEm quanAoTreEm : gioHang) {
                                totalPrice += quanAoTreEm.getGia();
                                %>
                                <tr>
                                    <td><%= quanAoTreEm.getMaQuanAo() %></td>
                                    <td><%= quanAoTreEm.getTenQuanAo() %></td>
                                    <td><%= quanAoTreEm.getGia() %> VND</td>
                                </tr>
                                <% 
                            }
                        } else {
                            %>
                            <tr>
                                <td colspan="3">Không có sản phẩm nào.</td>
                            </tr>
                            <% 
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                Tổng tiền: <%= totalPrice %> VND
            </div>
            <div class="button-group">
                <form action="ResetCartServlet" method="post">
                    <input type="submit" value="Trở Về Trang Chủ" class="button">
                </form>
            </div>
        </div>
    </section>
</body>
</html>
