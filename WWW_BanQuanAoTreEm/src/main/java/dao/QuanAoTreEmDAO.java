package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.QuanAoTreEm;
import jdbc.DatabaseConnection;


public class QuanAoTreEmDAO {
	private Connection conn;
	public QuanAoTreEmDAO() {
		conn = DatabaseConnection.initializeDatabase();
	}
	public List<QuanAoTreEm> getAllQuanAoTreEm() throws SQLException {
		List<QuanAoTreEm> quanAoTreEmList = new ArrayList<>();
		String query = "SELECT * FROM QuanAoTreEm";
		try (Connection connection = DatabaseConnection.initializeDatabase();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				QuanAoTreEm quanAoTreEm = new QuanAoTreEm();
				quanAoTreEm.setMaQuanAo(resultSet.getString("maQuanAo"));
				quanAoTreEm.setTenQuanAo(resultSet.getString("tenQuanAo"));
				quanAoTreEm.setGia(resultSet.getInt("Gia"));
				quanAoTreEm.setTinhTrang(resultSet.getString("TinhTrang"));
				quanAoTreEm.setLoaiQuanAo(resultSet.getString("loaiQuanAo"));
				quanAoTreEm.setAnh(resultSet.getBinaryStream("Anh"));
				quanAoTreEmList.add(quanAoTreEm);
			}
		}
		return quanAoTreEmList;
	}

	public QuanAoTreEm getQuanAoTreEmByMa(String maQuanAo) throws SQLException {
		QuanAoTreEm quanAoTreEm = null;
		String query = "SELECT * FROM QuanAoTreEm WHERE MaQuanAo = ?";
		try (Connection connection = DatabaseConnection.initializeDatabase();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, maQuanAo);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				quanAoTreEm = new QuanAoTreEm();
				quanAoTreEm.setMaQuanAo(resultSet.getString("maQuanAo"));
				quanAoTreEm.setTenQuanAo(resultSet.getString("tenQuanAo"));
				quanAoTreEm.setGia(resultSet.getInt("Gia"));
				quanAoTreEm.setTinhTrang(resultSet.getString("TinhTrang"));
				quanAoTreEm.setLoaiQuanAo(resultSet.getString("loaiQuanAo"));
				quanAoTreEm.setAnh(resultSet.getBinaryStream("Anh"));
			}
		}
		return quanAoTreEm;
	}
}
