<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.XoaDAO"%>
<%@ page import="entities.QuanAoTreEm"%>
<%
    XoaDAO xoaDAO = new XoaDAO();
    List<QuanAoTreEm> quanAoTreEmList = xoaDAO.getAllQuanAoTreEm();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xóa Quần Áo</title>
<link rel="stylesheet" href="css/style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('img/ADN.jpg');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        color: #333;
        
    }
    header {
        background-color: rgba(76, 175, 80, 0.9);
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
    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        border-radius: 8px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
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
    footer {
        background-color: rgba(76, 175, 80, 0.9);
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
            <h2>Xóa Quần Áo</h2>
            <table>
                <tr>
                    <th>Mã Quần Áo</th>
                    <th>Tên Quần Áo</th>
                    <th>Giá</th>
                    <th>Tình Trạng</th>
                    <th>Loại Quần Áo</th>
                    <th>Ảnh</th>
                    <th>Hành Động</th>
                </tr>
                <%
                for (QuanAoTreEm quanAoTreEm : quanAoTreEmList) {
                %>
                <tr>
                    <td><%= quanAoTreEm.getMaQuanAo() %></td>
                    <td><%= quanAoTreEm.getTenQuanAo() %></td>
                    <td><%= quanAoTreEm.getGia() %></td>
                    <td><%= quanAoTreEm.getTinhTrang() %></td>
                    <td><%= quanAoTreEm.getLoaiQuanAo() %></td>
                    <td>
                        <%
                        if (quanAoTreEm.getAnh() != null) {
                        %>
                        <img src="<%= request.getContextPath() %>/getImageServlet?maQuanAo=<%= quanAoTreEm.getMaQuanAo() %>" alt="Hình Ảnh" width="100" height="100"/>
                        <%
                        } else {
                        %>
                        No Image
                        <%
                        }
                        %>
                    </td>
                    <td>
                        <form action="XoaServlet" method="post">
                            <input type="hidden" name="maQuanAo" value="<%= quanAoTreEm.getMaQuanAo() %>" />
                            <input type="submit" value="Xóa" />
                        </form>
                    </td>
                </tr>
                <%
                }
                %>
            </table>
            <a href="TrangChuAdmin.jsp" class="button">Quay lại Trang Chủ Admin</a>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quản lý bán quần áo</p>
    </footer>
</body>
</html>
