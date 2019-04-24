package com.kulchuri.feeder.login;

import com.kulchuri.feeder.db.Feeder_DB;
import com.kulchuri.feeder.utility.FeederPassword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO extends FeederPassword {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public LoginDTO login(String uname, String pwd) {
		LoginDTO ldto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "select type from login_master where eno=? and pwd=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, uname);
			ps.setString(2, encrypt(pwd));
			rs = ps.executeQuery();
			if (rs.next()) {
				ldto = new LoginDTO();
				ldto.setUname(uname);
				ldto.setType(rs.getString("type"));
			}
		} catch (Exception e) {
			System.out.println("Login Failed:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return ldto;
		}
	}

	public boolean changePassword(LoginDTO ldto) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "update login_master set pwd=? where eno=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, encrypt(ldto.getPwd()));
			ps.setString(2, ldto.getUname());

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at changePassword:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}

	public static void main(String[] args) {
		LoginDTO dto = new LoginDTO();
		dto.setPwd("admin");
		dto.setUname("admin");
		System.out.println(new LoginDAO().changePassword(dto));
	}
}
