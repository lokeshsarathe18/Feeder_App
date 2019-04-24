package com.kulchuri.feeder.subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kulchuri.feeder.db.Feeder_DB;

public class SubjectDao {
	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;

	public SubjectDao() {
	}

	public boolean addSubject(SubjectBean bean) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "insert into subject_master(branch, sem, sname) values(?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, bean.getBranch());
			ps.setInt(2, bean.getSem());
			ps.setString(3, bean.getSname());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Execption at addSubject:" + e);
			e.printStackTrace();

		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<SubjectBean> getAllSubjects() {
		ArrayList<SubjectBean> arrayList = new ArrayList<>();
		SubjectBean bean;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			rs = conn.prepareStatement("SELECT * FROM subject_master").executeQuery();
			while (rs.next()) {
				bean = new SubjectBean();
				bean.setSid(rs.getInt("sid"));
				bean.setBranch(rs.getString("branch"));
				bean.setSem(rs.getInt("sem"));
				bean.setSname(rs.getString("sname"));
				arrayList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllSubjects:" + e);
		} finally {
			if (arrayList.isEmpty()) {
				arrayList = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return arrayList;
		}
	}

	public ArrayList<String> getAllSubjects(int sem, String branch) {
		ArrayList<String> arrayList = new ArrayList<>();

		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("SELECT * FROM subject_master where sem=? and branch=?");
			ps.setInt(1, sem);
			ps.setString(2, branch);
			rs=ps.executeQuery();
			while (rs.next()) {
				arrayList.add(rs.getString("sname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at getAllSubjects(int,String):" + e);
		} finally {
			if (arrayList.isEmpty()) {
				arrayList = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return arrayList;
		}

	}

	public ArrayList<SubjectBean> getAllSubjectsBySem(String branch, int sem) {
		ArrayList<SubjectBean> arrayList = new ArrayList<>();
		SubjectBean bean;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("SELECT * FROM subject_master where branch=? and sem=?");
			ps.setString(1, branch);
			ps.setInt(2, sem);
			rs = ps.executeQuery();
			while (rs.next()) {
				bean = new SubjectBean();
				bean.setSid(rs.getInt("sid"));
				bean.setBranch(rs.getString("branch"));
				bean.setSem(rs.getInt("sem"));
				bean.setSname(rs.getString("sname"));
				arrayList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllSubjectsBySem:" + e);
		} finally {
			if (arrayList.isEmpty()) {
				arrayList = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return arrayList;
		}
	}

	public boolean deleteSubject(int sid) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("delete FROM subject_master where sid=?");
			ps.setInt(1, sid);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteSubject:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
}
