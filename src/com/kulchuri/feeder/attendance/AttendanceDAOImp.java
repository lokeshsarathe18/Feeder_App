package com.kulchuri.feeder.attendance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.kulchuri.feeder.db.Feeder_DB;
import com.kulchuri.feeder.student.StudentDTO;
import com.kulchuri.feeder.utility.FeederDate;
import com.kulchuri.feeder.utility.FeederPassword;
import com.kulchuri.feeder.utility.FeederUtility;

public class AttendanceDAOImp extends FeederPassword implements AttendanceDAO {

	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;

	public AttendanceDAOImp() {
	}

	public ArrayList<StudentDTO> getAllStudent(String college, String branch, String sem, String course, String sec) {
		ArrayList<StudentDTO> arrayList = new ArrayList<>();
		StudentDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}

		try {
			ps = conn.prepareStatement(
					"SELECT sno,eno,name FROM student_master where college=? and course=? and branch=? and sem=? and sec=?");
			ps.setString(1, college);
			ps.setString(2, course);
			ps.setString(3, branch);
			ps.setString(4, sem);
			ps.setString(5, sec);
			rs = ps.executeQuery();
			while (rs.next()) {
				sdto = new StudentDTO();
				sdto.setSno(rs.getInt("sno"));
				sdto.setEno(rs.getString("eno"));
				sdto.setName(rs.getString("name"));
				arrayList.add(sdto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudent:" + e);
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

	@Override
	public boolean addAttendance(AttendanceDTO adto) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = null;
			String query = "insert into attendance_master(fid,rno,status,date,lectureno,"
					+ "lcount,sem,branch,sec,subject,time)values(?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, adto.getFid());
			ps.setString(2, adto.getEno());
			ps.setString(3, adto.getStatus());
			ps.setDate(4, FeederDate.getUtilToSql());
			ps.setInt(5, adto.getLectureno());
			ps.setInt(6, adto.getLcount());
			ps.setInt(7, adto.getSem());
			ps.setString(8, adto.getBranch());
			ps.setString(9, adto.getSec());
			ps.setInt(10, adto.getSubject());
			ps.setString(11, FeederDate.getCurrentTime());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception At addAttendance:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public boolean updateAttendance(String aid, String status) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		String query = "update attendance_master set status=? where aid=?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, status);
			ps.setInt(2, Integer.parseInt(aid));
			System.out.println(ps);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateAttendance:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public boolean deleteAttendance(int aid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<AttendanceDTO> getAttendanceByEno(String eno) {
		ArrayList<AttendanceDTO> list = new ArrayList<>();
		AttendanceDTO dto;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "SELECT s.sname,a.lectureno,a.status, a.date,f.name FROM faculty_master f, subject_master s , attendance_master a where s.sid=a.subject and f.eno=a.fid and a.rno='"
					+ eno + "' ORDER BY a.date DESC";
			rs = conn.prepareStatement(query).executeQuery();
			while (rs.next()) {
				dto = new AttendanceDTO();
				dto.setLectureno(rs.getInt("lectureno"));
				dto.setName(rs.getString("name"));
				dto.setDatetime(rs.getString("date"));
				dto.setStatus(rs.getString("status"));
				dto.setBranch(rs.getString("sname"));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return list;
		}
	}

	@Override
	public ArrayList<AttendanceDTO> getAttendanceStudentByDate(String fdate, String tdate, String eno) {
		ArrayList<AttendanceDTO> list = new ArrayList<>();
		AttendanceDTO dto;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			fdate = FeederDate.getConvertDate(fdate);
			tdate = FeederDate.getConvertDate(tdate);
			String query = "SELECT s.sname,a.lectureno,a.status, a.date,f.name FROM faculty_master f, subject_master s , attendance_master a where s.sid=a.subject and f.eno=a.fid and a.date BETWEEN '"
					+ fdate + "' AND '" + tdate + "' and a.rno=? ORDER BY a.date DESC";
			ps = conn.prepareStatement(query);
			ps.setString(1, eno);
			System.out.println(ps);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new AttendanceDTO();
				dto.setLectureno(rs.getInt("lectureno"));
				dto.setName(rs.getString("name"));
				dto.setDatetime(rs.getString("date"));
				dto.setStatus(rs.getString("status"));
				dto.setBranch(rs.getString("sname"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at getAttendanceStudentByDate:" + e);
		} finally {
			if (list.isEmpty()) {
				list = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return list;
		}
	}

	@Override
	public ArrayList<AttendanceDTO> getAttendanceFacultyByDate(String fdate, String tdate, int fid) {
		ArrayList<AttendanceDTO> list = new ArrayList<>();
		AttendanceDTO dto;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			fdate = FeederDate.getConvertDate(fdate);
			tdate = FeederDate.getConvertDate(tdate);
			String query = "SELECT DISTINCT a.date,s.branch,f.name,s.sem,s.college,s.course,sub.sname,a.lectureno, a.lcount FROM student_master s,attendance_master a,faculty_master f,subject_master sub where f.eno=a.fid and a.rno=s.eno and sub.sid=a.subject and a.fid=? and a.date BETWEEN '"
					+ fdate + "' and '" + tdate + "' ORDER BY a.date DESC;";
			ps = conn.prepareStatement(query);
			ps.setInt(1, fid);
			rs = ps.executeQuery();
			Map map = FeederUtility.getColleges();
			while (rs.next()) {
				dto = new AttendanceDTO();
				dto.setLcount(rs.getInt("lcount"));
				dto.setCourse(rs.getString("course"));
				dto.setName(rs.getString("name"));
				dto.setSem(rs.getInt("sem"));
				dto.setLectureno(rs.getInt("lectureno"));
				dto.setDatetime(rs.getString("date"));
				dto.setStatus(map.get(rs.getString("college")) + "");
				dto.setBranch(rs.getString("branch"));
				dto.setSname(rs.getString("sname"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at getAttendanceFacultyByDate:" + e);
		} finally {
			if (list.isEmpty()) {
				list = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return list;
		}
	}

	@Override
	public AttendanceDTO getAttendanceByAid(int aid) {
		// TODO Auto-generated method stub
		return null;

	}

	@Override
	public ArrayList<String> getSection(String college, String branch, String sem, String course) {
		ArrayList<String> arrayList = new ArrayList<>();
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}

		try {
			ps = conn.prepareStatement(
					"SELECT DISTINCT sec FROM student_master where college=? and course=? and branch=? and sem=?");
			ps.setString(1, college);
			ps.setString(2, course);
			ps.setString(3, branch);
			ps.setString(4, sem);
			rs = ps.executeQuery();
			while (rs.next()) {
				arrayList.add(rs.getString("sec"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getSection:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return arrayList;
		}
	}

	@Override
	public ArrayList<AttendanceDTO> getAllStudentAttendance(AttendanceDTO dto) {
		ArrayList<AttendanceDTO> arrayList = new ArrayList<>();
		AttendanceDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement(
					"SELECT a.aid,s.name ,a.status FROM attendance_master a, student_master s where s.eno=a.rno and a.date=? and a.lectureno =? and a.sem=? and a.branch =? and a.sec=? and a.subject=? and a.fid=?");
			ps.setDate(1, FeederDate.getUtilToSql());
			ps.setInt(2, dto.getLectureno());
			ps.setInt(3, dto.getSem());
			ps.setString(4, dto.getBranch());
			ps.setString(5, dto.getSec());
			ps.setInt(6, dto.getSubject());
			ps.setString(7, dto.getFid());
			rs = ps.executeQuery();
			while (rs.next()) {
				sdto = new AttendanceDTO();
				sdto.setAid(rs.getInt("aid"));
				sdto.setStatus(rs.getString("status"));
				sdto.setName(rs.getString("name"));
				arrayList.add(sdto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudent:" + e);
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

	public ArrayList<AttendanceDTO> getAllStudentAttendance12(AttendanceDTO dto) {
		ArrayList<AttendanceDTO> arrayList = new ArrayList<>();
		AttendanceDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement(
					"SELECT a.date,a.aid,s.name ,a.status FROM attendance_master a, student_master s where s.eno=a.rno and a.lectureno =? and a.sem=? and a.branch =? and a.sec=? and a.subject=? and a.fid=?");
			ps.setInt(1, dto.getLectureno());
			ps.setInt(2, dto.getSem());
			ps.setString(3, dto.getBranch());
			ps.setString(4, dto.getSec());
			ps.setInt(5, dto.getSubject());
			ps.setString(6, dto.getFid());
			System.out.println(ps);
			rs = ps.executeQuery();
			while (rs.next()) {
				sdto = new AttendanceDTO();
				sdto.setAid(rs.getInt("aid"));
				sdto.setStatus(rs.getString("status"));
				sdto.setName(rs.getString("name"));
				sdto.setDatetime(rs.getString("date"));
				arrayList.add(sdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at getAllStudentAttendance12:" + e);
		} finally {
			System.out.println("raja:" + arrayList);
			if (arrayList.isEmpty()) {
				arrayList = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return arrayList;
		}
	}

	public static void main(String[] args) {
		ArrayList<AttendanceDTO> list = new AttendanceDAOImp().getAttendanceStudentByDate("04/10/2018", "04/13/2018",
				"12345");
		System.out.println(list.size());
	}
}
