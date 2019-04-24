package com.kulchuri.feeder.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kulchuri.feeder.db.Feeder_DB;
import com.kulchuri.feeder.utility.FeederDate;

public class FeedeBackDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public FeedeBackDao() {
	}

	public ArrayList<FeedbackDto> getAllFeedbackByStudents(String eno) {
		ArrayList<FeedbackDto> list = new ArrayList<>();
		FeedbackDto dto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "SELECT f.lectureno,fm.name, f.subject, f.date, f.description FROM feedback_master f, faculty_master fm where f.eno="
					+ eno + " and f.fno=fm.eno ORDER BY f.fdid DESC";
			rs = conn.prepareStatement(query).executeQuery();
			while (rs.next()) {
				dto = new FeedbackDto();
				dto.setSubject(rs.getString("subject"));
				dto.setBranch(rs.getString("name"));
				dto.setDate(rs.getString("date"));
				dto.setDescription(rs.getString("description"));
				dto.setLectureno(rs.getInt("lectureno"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllFeedback:" + e);
		} finally {
			rs = null;
			conn = null;
			return list;
		}
	}
	public ArrayList<FeedbackDto> getAllFeedbackByAdmin() {
		ArrayList<FeedbackDto> list = new ArrayList<>();
		FeedbackDto dto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "SELECT f.sem,f.lectureno,fm.name,f.branch,s.course, f.subject, f.date, f.description FROM feedback_master f, student_master s,faculty_master fm where f.fno=fm.eno and s.eno=f.eno ORDER BY f.fdid DESC";
			rs = conn.prepareStatement(query).executeQuery();
			while (rs.next()) {
				dto = new FeedbackDto();
				dto.setSem(rs.getInt("sem"));
				dto.setCourse(rs.getString("course"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setBranch(rs.getString("branch"));
				dto.setDate(rs.getString("date"));
				dto.setDescription(rs.getString("description"));
				dto.setLectureno(rs.getInt("lectureno"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllFeedback:" + e);
		} finally {
			rs = null;
			conn = null;
			return list;
		}
	}

	public ArrayList<FeedbackDto> getAllFeedBackByFaculty(String fno) {
		ArrayList<FeedbackDto> list = new ArrayList<>();
		FeedbackDto dto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "SELECT f.sem, f.lectureno,f.branch, f.subject, f.date, f.description FROM feedback_master f, faculty_master fm where f.fno="
					+ fno + " and f.fno=fm.eno ORDER BY f.fdid DESC";
			rs = conn.prepareStatement(query).executeQuery();
			while (rs.next()) {
				dto = new FeedbackDto();
				dto.setSem(rs.getInt("sem"));
				dto.setSubject(rs.getString("subject"));
				dto.setBranch(rs.getString("branch"));
				dto.setDate(rs.getString("date"));
				dto.setDescription(rs.getString("description"));
				dto.setLectureno(rs.getInt("lectureno"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllFeedBackByFaculty:" + e);
		} finally {
			rs = null;
			conn = null;
			return list;
		}
	}

	public boolean addFeedback(FeedbackDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "insert into feedback_master" + "(sem, lectureno, fno, subject, branch,"
					+ " date, eno,description) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getSem());
			ps.setInt(2, dto.getLectureno());
			ps.setInt(3, dto.getFid());
			ps.setString(4, dto.getSubject());
			ps.setString(5, dto.getBranch());
			ps.setDate(6, FeederDate.getUtilToSql());
			ps.setString(7, dto.getEno());
			ps.setString(8, dto.getDescription());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at addFeedback:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
}
