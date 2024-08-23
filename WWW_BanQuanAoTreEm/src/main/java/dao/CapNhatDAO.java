package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DatabaseConnection;
import entities.QuanAoTreEm;

public class CapNhatDAO {

    public void updateQuanAoTreEm(QuanAoTreEm quanAoTreEm) throws SQLException {
        String sql = "UPDATE QuanAoTreEm SET tenQuanAo = ?, gia = ?, tinhTrang = ?, loaiQuanAo = ? WHERE maQuanAo = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, quanAoTreEm.getTenQuanAo());
            pstmt.setInt(2, quanAoTreEm.getGia());
            pstmt.setString(3, quanAoTreEm.getTinhTrang());
            pstmt.setString(4, quanAoTreEm.getLoaiQuanAo());
            pstmt.setString(5, quanAoTreEm.getMaQuanAo());
            pstmt.executeUpdate();
        }
    }


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
                quanAoTreEmList.add(quanAoTreEm);
            }
        }
        return quanAoTreEmList;
    }
}
