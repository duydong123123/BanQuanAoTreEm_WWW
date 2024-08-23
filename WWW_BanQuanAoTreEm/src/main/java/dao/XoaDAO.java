package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.QuanAoTreEm;
import jdbc.DatabaseConnection;


public class XoaDAO {

    
    public List<QuanAoTreEm> getAllQuanAoTreEm() throws SQLException {
        List<QuanAoTreEm> quanAoTreEmList = new ArrayList<>();
        String sql = "SELECT * FROM QuanAoTreEm";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
            	QuanAoTreEm quanAoTreEm = new QuanAoTreEm();
            	quanAoTreEm.setMaQuanAo(rs.getString("maQuanAo"));
                quanAoTreEm.setTenQuanAo(rs.getString("tenQuanAo"));
                quanAoTreEm.setGia(rs.getInt("gia"));
                quanAoTreEm.setTinhTrang(rs.getString("tinhTrang"));
                quanAoTreEm.setLoaiQuanAo(rs.getString("loaiQuanAo"));
                quanAoTreEm.setAnh(rs.getBinaryStream("anh"));
                quanAoTreEmList.add(quanAoTreEm);
            }
        }
        return quanAoTreEmList;
    }

    public void deleteQuanAoTreEm(String maQuanAo) throws SQLException {
        String sql = "DELETE FROM QuanAoTreEm WHERE maQuanAo = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, maQuanAo);
            pstmt.executeUpdate();
        }
    }
}
