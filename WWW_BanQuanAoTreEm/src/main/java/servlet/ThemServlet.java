package servlet;

import dao.ThemDAO;
import entities.QuanAoTreEm;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/them")
@MultipartConfig
public class ThemServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ThemDAO themDAO;

	@Override
	public void init() throws ServletException {
		themDAO = new ThemDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Them.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maQuanAo = request.getParameter("maQuanAo");
		String tenQuanAo = request.getParameter("tenQuanAo");
		String giaStr = request.getParameter("gia");
		String tinhTrang = request.getParameter("tinhTrang");
		String loaiQuanAo = request.getParameter("loaiQuanAo");

		if (maQuanAo == null || maQuanAo.isEmpty() ||
				tenQuanAo == null || tenQuanAo.isEmpty() ||
				giaStr == null || giaStr.isEmpty() ||
				tinhTrang == null || tinhTrang.isEmpty() ||
				loaiQuanAo == null || loaiQuanAo.isEmpty()) {
			request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
			request.getRequestDispatcher("Them.jsp").forward(request, response);
			return;
		}

		int gia = Integer.parseInt(giaStr);

		Part filePart = request.getPart("anh");
		InputStream anhStream = filePart != null ? filePart.getInputStream() : null;

		QuanAoTreEm quanAoTreEm = new QuanAoTreEm(maQuanAo, tenQuanAo, gia, tinhTrang, loaiQuanAo, anhStream);
		themDAO.addQuanAoTreEm(quanAoTreEm);

		response.sendRedirect("TrangChuAdmin.jsp");
	}
}
