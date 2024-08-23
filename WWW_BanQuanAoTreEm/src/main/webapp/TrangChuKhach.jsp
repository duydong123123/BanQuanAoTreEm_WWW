<%@ page import="java.util.List"%>
<%@ page import="dao.QuanAoTreEmDAO"%>
<%@ page import="entities.QuanAoTreEm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
QuanAoTreEmDAO quanAoTreEmDAO = new QuanAoTreEmDAO();
List<QuanAoTreEm> quanAoTreEmList = quanAoTreEmDAO.getAllQuanAoTreEm();
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ Khách Hàng</title>
<link rel="stylesheet" href="css/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f2f5;
        color: #333;
        background-image: url('img/ADN.jpg'); /* Thay đổi đường dẫn này tới ảnh nền của bạn */
        background-size: cover;
        background-position: center;
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
    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 20px;
        gap: 20px;
    }
    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 220px;
        padding: 20px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .card img {
        max-width: 100%;
        height: auto;
        border-bottom: 1px solid #eee;
        margin-bottom: 15px;
        border-radius: 10px 10px 0 0;
    }
    .card h2 {
        font-size: 20px;
        margin: 10px 0;
        color: #4CAF50;
    }
    .card p {
        color: #777;
        margin: 5px 0;
    }
    .card a {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 15px;
        background-color: #4CAF50;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .card a:hover {
        background-color: #45A049;
    }
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>
	<header>
		<h1>Trang Chủ Khách Hàng</h1>
		<nav>
			<ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHang.jsp">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                 <li><a href="LogoutServlet">Đăng Xuất</a></li> 
			</ul>
		</nav>
	</header>
	<section class="card-container">
		<%
		for (QuanAoTreEm quanAoTreEm : quanAoTreEmList) {
		%>
		<div class="card">
		<%
			String maQuanAo = quanAoTreEm.getMaQuanAo();
            if (maQuanAo != null && !maQuanAo.isEmpty()) {
                String imagePath = request.getContextPath() + "/img/" + maQuanAo + ".jpg";
        %>
            <img src="<%= imagePath %>" alt="Hình Ảnh" width="100" />
        <%
            } else {
        %>
            Không có hình ảnh
        <%
            }
        %>
			<h2><%=quanAoTreEm.getTenQuanAo()%></h2>
			<p>
				Giá:
				<%=quanAoTreEm.getGia()%>
				VND
			</p>
			<p>
				Tình Trạng:
				<%=quanAoTreEm.getTinhTrang()%></p>
			<a
				href="ChiTietQuanAoTreEmServlet?maQuanAo=<%=quanAoTreEm.getMaQuanAo()%>">Xem
				Chi Tiết</a>
		</div>
		<%
		}
		%>
	</section>
</body>
</html>
