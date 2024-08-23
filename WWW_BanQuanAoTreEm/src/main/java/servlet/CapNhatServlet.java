package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CapNhatDAO;
import entities.QuanAoTreEm;

@WebServlet("/CapNhatServlet")
public class CapNhatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CapNhatDAO capNhatDAO;

    public void init() {
        capNhatDAO = new CapNhatDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<QuanAoTreEm> quanAoTreEmList = capNhatDAO.getAllQuanAoTreEm();
            request.setAttribute("quanAoTreEmList", quanAoTreEmList);
            request.getRequestDispatcher("CapNhat.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maQuanAo = request.getParameter("maQuanAo");
        String tenQuanAo = request.getParameter("tenQuanAo");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String tinhTrang = request.getParameter("tinhTrang");
        String loaiQuanAo = request.getParameter("loaiQuanAo");

        QuanAoTreEm quanAoTreEm = new QuanAoTreEm();
        quanAoTreEm.setMaQuanAo(maQuanAo);
        quanAoTreEm.setTenQuanAo(tenQuanAo);
        quanAoTreEm.setGia(gia);
        quanAoTreEm.setTinhTrang(tinhTrang);
        quanAoTreEm.setLoaiQuanAo(loaiQuanAo);

        try {
            capNhatDAO.updateQuanAoTreEm(quanAoTreEm);
            response.sendRedirect("CapNhat.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
