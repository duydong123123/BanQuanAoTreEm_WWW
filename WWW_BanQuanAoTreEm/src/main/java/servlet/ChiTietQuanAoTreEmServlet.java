package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.QuanAoTreEm;
import dao.QuanAoTreEmDAO;
import java.sql.SQLException;

@WebServlet("/ChiTietQuanAoTreEmServlet")
public class ChiTietQuanAoTreEmServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuanAoTreEmDAO quanAoTreEmDAO;

    @Override
    public void init() {
    	quanAoTreEmDAO = new QuanAoTreEmDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maQuanAo = request.getParameter("maQuanAo");
        QuanAoTreEm quanAoTreEm = null;
        try {
        	quanAoTreEm = quanAoTreEmDAO.getQuanAoTreEmByMa(maQuanAo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("quanAoTreEm", quanAoTreEm);
        request.getRequestDispatcher("ChiTietQuanAoTreEm.jsp").forward(request, response);
    }
}
