<%@ page import="entities.QuanAoTreEm" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('img/ThanhToan.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
        }
        header {
            background-color: rgba(40, 167, 69, 0.9); /* Slightly transparent background */
            color: #fff;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        header h1 {
            margin: 0;
            font-size: 22px;
        }
        nav ul {
            list-style-type: none;
            margin: 10px 0 0;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        nav ul li {
            display: inline;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 8px 15px;
            background-color: #66BB6A;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        nav ul li a:hover {
            background-color: #81C784;
        }
        .cart-container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
        }
        .cart-container h2 {
            font-size: 22px;
            margin-bottom: 20px;
            text-align: center;
            color: #28a745;
        }
        .cart-container table {
            width: 100%;
            border-collapse: collapse;
        }
        .cart-container table, .cart-container th, .cart-container td {
            border: 1px solid #ddd;
        }
        .cart-container th, .cart-container td {
            padding: 12px;
            text-align: left;
        }
        .cart-container th {
            background-color: #f4f4f4;
        }
        .total-price {
            font-size: 18px;
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
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            margin: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Giỏ Hàng</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHangServlet">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <div class="cart-container">
            <h2>Giỏ Hàng của bạn</h2>
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
                        if (gioHang != null) {
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
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                Tổng tiền: <%= totalPrice %> VND
            </div>
            <div class="button-group">
                <form action="GioHangServlet" method="post">
                    <input type="hidden" name="action" value="checkout">
                    <button type="submit" class="button">Thanh Toán Ngay</button>
                </form>
                <a href="TrangChuKhach.jsp" class="button">Mua Tiếp</a>
            </div>
        </div>
    </section>
</body>
</html>
