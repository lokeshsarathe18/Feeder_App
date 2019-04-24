package com.kulchuri.feeder.student;

import com.kulchuri.feeder.db.Feeder_DB;
import com.kulchuri.feeder.utility.FeederDate;
import com.kulchuri.feeder.utility.FeederPassword;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

public class StudentDAOImp extends FeederPassword implements StudentDAO {

	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;

	public StudentDAOImp() {
	}

	@Override
	public boolean addStudent(StudentDTO sdto, InputStream photo) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("insert into login_master values(?,?,?)");
			ps.setString(1, sdto.getEno());
			ps.setString(2, encrypt(sdto.getPassword()));
			ps.setString(3, "student");
			if (ps.executeUpdate() > 0) {
				ps = null;
				String query = "insert into student_master(eno, college, course, branch, "
						+ "name, dob, gender, mno, photo, email,sem, bgroup, "
						+ "category, hobby, state, city, pincode, address, fname, pmno,"
						+ " mname,sec) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(query);
				ps.setString(1, sdto.getEno());
				ps.setString(2, sdto.getCollege());
				ps.setString(3, sdto.getCourse());
				ps.setString(4, sdto.getBranch());
				ps.setString(5, sdto.getName());
				ps.setString(6, sdto.getDob());
				ps.setString(7, sdto.getGender());
				ps.setString(8, sdto.getMno());
				ps.setBlob(9, photo);
				ps.setString(10, sdto.getEmail());

				ps.setInt(11, sdto.getSem());
				ps.setString(12, sdto.getBgroup());
				ps.setString(13, sdto.getCategory());
				ps.setString(14, sdto.getHobby());
				ps.setString(15, sdto.getState());
				ps.setString(16, sdto.getCity());
				ps.setInt(17, sdto.getPincode());
				ps.setString(18, sdto.getAddress());
				ps.setString(19, sdto.getFname());
				ps.setString(20, sdto.getPmno());
				ps.setString(21, sdto.getMname());
				ps.setString(22, sdto.getSec());
				if (ps.executeUpdate() > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			System.out.println("Execption at addStudent:" + e);
			e.printStackTrace();

		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean copyStudent(StudentDTO sdto, InputStream filePart) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {

			String query = "insert into student_backup(eno, college, course, branch, "
					+ "name, dob, gender, mno, photo, email,sem, bgroup, "
					+ "category, hobby, state, city, pincode, address, fname, pmno,"
					+ " mname,sec) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, sdto.getEno());
			ps.setString(2, sdto.getCollege());
			ps.setString(3, sdto.getCourse());
			ps.setString(4, sdto.getBranch());
			ps.setString(5, sdto.getName());
			ps.setString(6, sdto.getDob());
			ps.setString(7, sdto.getGender());
			ps.setString(8, sdto.getMno());
			ps.setBlob(9, filePart);
			ps.setString(10, sdto.getEmail());

			ps.setInt(11, sdto.getSem());
			ps.setString(12, sdto.getBgroup());
			ps.setString(13, sdto.getCategory());
			ps.setString(14, sdto.getHobby());
			ps.setString(15, sdto.getState());
			ps.setString(16, sdto.getCity());
			ps.setInt(17, sdto.getPincode());
			ps.setString(18, sdto.getAddress());
			ps.setString(19, sdto.getFname());
			ps.setString(20, sdto.getPmno());
			ps.setString(21, sdto.getMname());
			ps.setString(22, sdto.getSec());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Execption at copyStudent:" + e);
			e.printStackTrace();

		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public boolean updateStudent(StudentDTO sdto) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			String query = "update student_master set eno=?, college=?, course=?, branch=?,"
					+ "name=?, dob=?, gender=?, mno=?, email=?,sem=?, bgroup=?, "
					+ "	category=?,state=?, city=?, pincode=?, address=?, fname=?, pmno=?,"
					+ " mname=?,hobby=?,sec=? where sno=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, sdto.getEno());
			ps.setString(2, sdto.getCollege());
			ps.setString(3, sdto.getCourse());
			ps.setString(4, sdto.getBranch());
			ps.setString(5, sdto.getName());
			ps.setString(6, sdto.getDob());
			ps.setString(7, sdto.getGender());
			ps.setString(8, sdto.getMno());

			ps.setString(9, sdto.getEmail());

			ps.setInt(10, sdto.getSem());
			ps.setString(11, sdto.getBgroup());
			ps.setString(12, sdto.getCategory());

			ps.setString(13, sdto.getState());
			ps.setString(14, sdto.getCity());
			ps.setInt(15, sdto.getPincode());
			ps.setString(16, sdto.getAddress());
			ps.setString(17, sdto.getFname());
			ps.setString(18, sdto.getPmno());
			ps.setString(19, sdto.getMname());
			ps.setString(20, sdto.getHobby());
			ps.setInt(21, sdto.getSno());
			ps.setString(22, sdto.getSec());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateStudent:" + e);
		} finally {
			return flag;
		}

	}

	InputStream filePart;

	@Override
	public boolean deleteStudent(String eno) {
		boolean flag = false;
		StudentDTO dto = getStudentBySno(eno);
		copyStudent(dto, filePart);
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("delete from student_master where sno=?");
			ps.setString(1, eno);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteStudent:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public StudentDTO getStudentByEmpId(String eno) {
		StudentDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from student_master where eno=?");
			ps.setString(1, eno);
			rs = ps.executeQuery();
			if (rs.next()) {
				sdto = new StudentDTO();
				sdto.setSno(rs.getInt("sno"));
				sdto.setName(rs.getString("name"));
				sdto.setMno(rs.getString("mno"));
				sdto.setCollege(rs.getString("college"));
				sdto.setEno(rs.getString("eno"));
				sdto.setCourse(rs.getString("course"));
				sdto.setDob(rs.getString("dob"));
				sdto.setGender(rs.getString("gender"));
				filePart = rs.getBinaryStream("photo");
				sdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				sdto.setSem(rs.getInt("sem"));
				sdto.setCategory(rs.getString("category"));
				sdto.setHobby(rs.getString("hobby"));
				sdto.setState(rs.getString("state"));
				sdto.setCity(rs.getString("city"));
				sdto.setPincode(rs.getInt("pincode"));
				sdto.setFname(rs.getString("fname"));
				sdto.setPmno(rs.getString("pmno"));
				sdto.setMname(rs.getString("mname"));
				sdto.setBranch(rs.getString("branch"));
				sdto.setBgroup(rs.getString("Bgroup"));
				sdto.setEmail(rs.getString("email"));
				sdto.setAddress(rs.getString("address"));
				sdto.setSec(rs.getString("sec"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getStudentByEno:" + e);
		} finally {

			rs = null;
			ps = null;
			conn = null;
			return sdto;
		}
	
	}

	@Override
	public StudentDTO getStudentBySno(String eno) {

		StudentDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from student_master where sno=?");
			ps.setString(1, eno);
			rs = ps.executeQuery();
			if (rs.next()) {
				sdto = new StudentDTO();
				sdto.setSno(rs.getInt("sno"));
				sdto.setName(rs.getString("name"));
				sdto.setMno(rs.getString("mno"));
				sdto.setCollege(rs.getString("college"));
				sdto.setEno(rs.getString("eno"));
				sdto.setCourse(rs.getString("course"));
				sdto.setDob(rs.getString("dob"));
				sdto.setGender(rs.getString("gender"));
				filePart = rs.getBinaryStream("photo");
				sdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				sdto.setSem(rs.getInt("sem"));
				sdto.setCategory(rs.getString("category"));
				sdto.setHobby(rs.getString("hobby"));
				sdto.setState(rs.getString("state"));
				sdto.setCity(rs.getString("city"));
				sdto.setPincode(rs.getInt("pincode"));
				sdto.setFname(rs.getString("fname"));
				sdto.setPmno(rs.getString("pmno"));
				sdto.setMname(rs.getString("mname"));
				sdto.setBranch(rs.getString("branch"));
				sdto.setBgroup(rs.getString("Bgroup"));
				sdto.setEmail(rs.getString("email"));
				sdto.setAddress(rs.getString("address"));
				sdto.setSec(rs.getString("sec"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getStudentByEno:" + e);
		} finally {

			rs = null;
			ps = null;
			conn = null;
			return sdto;
		}
	}

	public StudentDTO getStudentLogin(String eno, String pwd) {

		StudentDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from student_master where eno=? and pwd=?");
			ps.setString(1, eno);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if (rs.next()) {
				sdto = new StudentDTO();
				sdto.setSno(rs.getInt("sno"));
				sdto.setName(rs.getString("name"));
				sdto.setMno(rs.getString("mno"));
				sdto.setCollege(rs.getString("college"));
				sdto.setEno(rs.getString("eno"));
				sdto.setCourse(rs.getString("course"));
				sdto.setDob(rs.getString("dob"));
				sdto.setGender(rs.getString("gender"));
				filePart = rs.getBinaryStream("photo");
				sdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				sdto.setSem(rs.getInt("sem"));
				sdto.setCategory(rs.getString("category"));
				sdto.setHobby(rs.getString("hobby"));
				sdto.setState(rs.getString("state"));
				sdto.setCity(rs.getString("city"));
				sdto.setPincode(rs.getInt("pincode"));
				sdto.setFname(rs.getString("fname"));
				sdto.setPmno(rs.getString("pmno"));
				sdto.setMname(rs.getString("mname"));
				sdto.setBranch(rs.getString("branch"));
				sdto.setBgroup(rs.getString("Bgroup"));
				sdto.setEmail(rs.getString("email"));
				sdto.setAddress(rs.getString("address"));
				sdto.setSec(rs.getString("sec"));
			}
		} catch (Exception e) {
			System.out.println("Exception at getStudentLogin:" + e);
		} finally {

			rs = null;
			ps = null;
			conn = null;
			return sdto;
		}
	}

	@Override
	public ArrayList<StudentDTO> getAllStudent() {
		ArrayList<StudentDTO> list = new ArrayList<>();
		StudentDTO sdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from student_master");
			rs = ps.executeQuery();
			while (rs.next()) {
				sdto = new StudentDTO();
				sdto.setSno(rs.getInt("sno"));
				sdto.setName(rs.getString("name"));
				sdto.setMno(rs.getString("mno"));
				sdto.setCollege(rs.getString("college"));
				sdto.setEno(rs.getString("eno"));
				sdto.setCourse(rs.getString("course"));
				sdto.setDob(rs.getString("dob"));
				sdto.setGender(rs.getString("gender"));
				sdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				sdto.setSem(rs.getInt("sem"));
				sdto.setCategory(rs.getString("category"));
				sdto.setHobby(rs.getString("hobby"));
				sdto.setState(rs.getString("state"));
				sdto.setCity(rs.getString("city"));
				sdto.setPincode(rs.getInt("pincode"));
				sdto.setFname(rs.getString("fname"));
				sdto.setPmno(rs.getString("pmno"));
				sdto.setMname(rs.getString("mname"));
				sdto.setBranch(rs.getString("branch"));
				sdto.setBgroup(rs.getString("Bgroup"));
				sdto.setEmail(rs.getString("email"));
				sdto.setAddress(rs.getString("address"));
				sdto.setSec(rs.getString("sec"));
				list.add(sdto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudent:" + e);
		} finally {
			if (list.isEmpty()) {
				list = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}

	public static void main(String[] args) {
		for (StudentDTO dto : new StudentDAOImp().getAllStudent()) {
			System.out.println(dto.getSno());
		}
	}

	@Override
	public boolean checkStudentDuplicateInfo(String s) {
		boolean flag = true;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from student_master where mno=? or email=? or eno=?");

			ps.setString(1, s);
			ps.setString(2, s);
			ps.setString(3, s);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("Exception at checkstudentDuplicateInfo:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;

			return flag;
		}
	}

}
