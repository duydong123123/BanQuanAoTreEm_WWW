package dao;

import entities.QuanAoTreEm;
import jdbc.DatabaseConnection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ThemDAO {
    private Connection connection;

    public ThemDAO() {
        this.connection = DatabaseConnection.initializeDatabase();
    }

    public void addQuanAoTreEm(QuanAoTreEm quanAoTreEm) {
        String sql = "INSERT INTO QuanAoTreEm (maQuanAo, tenQuanAo, gia, tinhTrang, loaiQuanAo, anh) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, quanAoTreEm.getMaQuanAo());
            statement.setString(2, quanAoTreEm.getTenQuanAo());
            statement.setInt(3, quanAoTreEm.getGia());
            statement.setString(4, quanAoTreEm.getTinhTrang());
            statement.setString(5, quanAoTreEm.getLoaiQuanAo());
            statement.setBlob(6, quanAoTreEm.getAnh());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
