package entities;

import java.io.InputStream;

public class QuanAoTreEm {
	private String maQuanAo;
	private String tenQuanAo;
	private int gia;
	private String tinhTrang;
	private String loaiQuanAo;
	private InputStream anh;
	public QuanAoTreEm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuanAoTreEm(String maQuanAo, String tenQuanAo, int gia, String tinhTrang, String loaiQuanAo,
			InputStream anh) {
		super();
		this.maQuanAo = maQuanAo;
		this.tenQuanAo = tenQuanAo;
		this.gia = gia;
		this.tinhTrang = tinhTrang;
		this.loaiQuanAo = loaiQuanAo;
		this.anh = anh;
	}
	public String getMaQuanAo() {
		return maQuanAo;
	}
	public void setMaQuanAo(String maQuanAo) {
		this.maQuanAo = maQuanAo;
	}
	public String getTenQuanAo() {
		return tenQuanAo;
	}
	public void setTenQuanAo(String tenQuanAo) {
		this.tenQuanAo = tenQuanAo;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getLoaiQuanAo() {
		return loaiQuanAo;
	}
	public void setLoaiQuanAo(String loaiQuanAo) {
		this.loaiQuanAo = loaiQuanAo;
	}
	public InputStream getAnh() {
		return anh;
	}
	public void setAnh(InputStream anh) {
		this.anh = anh;
	}
	
}