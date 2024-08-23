<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="entities.QuanAoTreEm"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.QuanAoTreEmDAO"%>
<%
    String maQuanAo = request.getParameter("maQuanAo");
    QuanAoTreEmDAO quanAoTreEmDAO = new QuanAoTreEmDAO();
    QuanAoTreEm quanAoTreEm = null;
    String errorMessage = null;

    try {
        quanAoTreEm = quanAoTreEmDAO.getQuanAoTreEmByMa(maQuanAo);
        if (quanAoTreEm == null) {
            errorMessage = "Sản phẩm không tồn tại.";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        errorMessage = "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi Tiết Quần Áo</title>
<link rel="stylesheet" href="css/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
        color: #333;
    }
    header {
        background-color: #28a745; /* Màu nền cũ */
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
    .detail-container {
        width: 90%;
        max-width: 700px;
        margin: 20px auto;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        background-color: #fff;
    }
    .detail-container img {
        width: 80%; /* Kích thước nhỏ hơn */
        height: auto;
        border-radius: 8px;
        display: block;
        margin: 0 auto 15px;
    }
    .detail-container h2 {
        font-size: 20px;
        margin: 10px 0;
        text-align: center;
        color: #28a745;
    }
    .detail-container p {
        font-size: 16px;
        margin: 8px 0;
    }
    .button-group {
        margin-top: 15px;
        text-align: center;
    }
    .button {
        display: inline-block;
        padding: 8px 15px;
        font-size: 14px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
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
        <h1>Chi Tiết Quần Áo</h1>
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
        <div class="detail-container">
            <%
            if (quanAoTreEm != null) {
            %>
            <h2><%= quanAoTreEm.getTenQuanAo() %></h2>
            <img src="img/<%= quanAoTreEm.getMaQuanAo() %>.jpg" alt="<%= quanAoTreEm.getTenQuanAo() %>">
            <p><strong>Giá:</strong> <%= quanAoTreEm.getGia() %> VND</p>
            <p><strong>Tình Trạng:</strong> <%= quanAoTreEm.getTinhTrang() %></p>
            <p><strong>Loại Quần Áo:</strong> <%= quanAoTreEm.getLoaiQuanAo() %></p>
            <div class="button-group">
                <form action="GioHangServlet" method="post">
                    <input type="hidden" name="maQuanAo" value="<%= quanAoTreEm.getMaQuanAo() %>">
                    <button type="submit" class="button">Mua Hàng</button>
                </form>
                <a href="TrangChuKhach.jsp" class="button">Quay Lại</a>
            </div>
            <%
            } else {
            %>
            <p><%= errorMessage %></p>
            <%
            }
            %>
        </div>
    </section>
</body>
</html>
