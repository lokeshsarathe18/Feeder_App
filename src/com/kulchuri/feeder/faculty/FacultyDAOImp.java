package com.kulchuri.feeder.faculty;

import com.kulchuri.feeder.db.Feeder_DB;
import com.kulchuri.feeder.student.StudentDTO;
import com.kulchuri.feeder.utility.FeederDate;
import com.kulchuri.feeder.utility.FeederPassword;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

public class FacultyDAOImp extends FeederPassword implements FacultyDAO {

	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;
	InputStream photo;

	@Override
	public boolean addFaculty(FacultyDTO fdto, InputStream photo) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("insert into login_master values(?,?,?)");
			ps.setString(1, fdto.getEmpid());
			ps.setString(2, encrypt(fdto.getPassword()));
			ps.setString(3, "faculty");
			if (ps.executeUpdate() > 0) {
				ps = null;
				String query = "insert into faculty_master(empid, name, gender, mno, dob, email, password, hobby, gname, gmno,"
						+ " qualification, certification, experiance, doj, bgroup, state, city, pincode, address,photo) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(query);
				ps.setString(1, fdto.getEmpid());
				ps.setString(2, fdto.getName());
				ps.setString(3, fdto.getGender());
				ps.setString(4, fdto.getMno());
				ps.setString(5, fdto.getDob());
				ps.setString(6, fdto.getEmail());
				ps.setString(7, encrypt(fdto.getPassword()));
				ps.setString(8, fdto.getHobby());
				ps.setString(9, fdto.getGname());
				ps.setString(10, fdto.getGmno());
				ps.setString(11, fdto.getQualification());
				ps.setString(12, fdto.getCertification());
				ps.setFloat(13, fdto.getExperiance());
				ps.setString(14, fdto.getDoj());
				ps.setString(15, fdto.getBgroup());
				ps.setString(16, fdto.getState());
				ps.setString(17, fdto.getCity());
				ps.setInt(18, fdto.getPincode());
				ps.setString(19, fdto.getAddress());
				ps.setBlob(20, photo);

				if (ps.executeUpdate() > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			System.out.println("Execption at addFaculty:" + e);
			e.printStackTrace();

		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean copyFaculty(FacultyDTO fdto, InputStream photo) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {

			String query = "insert into faculty_backup(empid, name, gender, mno, dob, email, password, hobby, gname, gmno,"
					+ " qualification, certification, experiance, doj, bgroup, state, city, pincode, address,photo) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, fdto.getEmpid());
			ps.setString(2, fdto.getName());
			ps.setString(3, fdto.getGender());
			ps.setString(4, fdto.getMno());
			ps.setString(5, fdto.getDob());
			ps.setString(6, fdto.getEmail());
			ps.setString(7, encrypt(fdto.getPassword()));
			ps.setString(8, fdto.getHobby());
			ps.setString(9, fdto.getGname());
			ps.setString(10, fdto.getGmno());
			ps.setString(11, fdto.getQualification());
			ps.setString(12, fdto.getCertification());
			ps.setFloat(13, fdto.getExperiance());
			ps.setString(14, fdto.getDoj());
			ps.setString(15, fdto.getBgroup());
			ps.setString(16, fdto.getState());
			ps.setString(17, fdto.getCity());
			ps.setInt(18, fdto.getPincode());
			ps.setString(19, fdto.getAddress());
			ps.setBlob(20, photo);

			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Execption at addFaculty:" + e);
			e.printStackTrace();

		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public boolean updateFaculty(FacultyDTO fdto) {
		boolean flag = false;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {

			String query = ("update  faculty_master set empid=?, name=?, gender=?, mno=?, dob=?, email=?, password=?, hobby=?, gname=?, gmno=?,"
					+ " qualification=?, certification=?, experiance=?, doj=?, bgroup=?, state=?, city=?, pincode=?, address=?"
					+ "where eno=?");
			ps = conn.prepareStatement(query);
			ps.setString(1, fdto.getEmpid());
			ps.setString(2, fdto.getName());
			ps.setString(3, fdto.getGender());
			ps.setString(4, fdto.getMno());
			ps.setString(5, fdto.getDob());
			ps.setString(6, fdto.getEmail());
			ps.setString(7, encrypt(fdto.getPassword()));
			ps.setString(8, fdto.getHobby());
			ps.setString(9, fdto.getGname());
			ps.setString(10, fdto.getGmno());
			ps.setString(11, fdto.getQualification());
			ps.setString(12, fdto.getCertification());
			ps.setFloat(13, fdto.getExperiance());
			ps.setString(14, fdto.getDoj());
			ps.setString(15, fdto.getBgroup());
			ps.setString(16, fdto.getState());
			ps.setString(17, fdto.getCity());
			ps.setInt(18, fdto.getPincode());
			ps.setString(19, fdto.getAddress());

			ps.setInt(20, fdto.getEno());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateFaculty:" + e);
		} finally {
			return flag;
		}

	}

	@Override
	public boolean deleteFaculty(int eno) {
		boolean flag = false;
		FacultyDTO dto = getFacultyByEno(eno);
		copyFaculty(dto, photo);
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("delete from faculty_master where eno=?");
			ps.setInt(1, eno);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteFaculty:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	@Override
	public FacultyDTO getFacultyByEno(int eno) {
		FacultyDTO fdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from faculty_master where eno=?");
			ps.setInt(1, eno);
			rs = ps.executeQuery();
			if (rs.next()) {
				fdto = new FacultyDTO();
				fdto.setEno(eno);
				fdto.setEmpid(rs.getString("empid"));
				fdto.setName(rs.getString("name"));
				fdto.setGender(rs.getString("gender"));
				fdto.setMno(rs.getString("mno"));
				fdto.setDob(rs.getString("dob"));
				fdto.setEmail(rs.getString("email"));
				fdto.setPassword(rs.getString("password"));
				fdto.setHobby(rs.getString("hobby"));
				fdto.setGname(rs.getString("gname"));
				fdto.setGmno(rs.getString("gmno"));
				fdto.setQualification(rs.getString("qualification"));
				fdto.setCertification(rs.getString("certification"));
				fdto.setExperiance(rs.getFloat("experiance"));
				fdto.setDoj(rs.getString("doj"));
				fdto.setBgroup(rs.getString("Bgroup"));
				fdto.setState(rs.getString("state"));
				fdto.setCity(rs.getString("city"));
				fdto.setPincode(rs.getInt("pincode"));
				fdto.setAddress(rs.getString("address"));
				fdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				photo = rs.getBinaryStream("photo");

			}
		} catch (Exception e) {
			System.out.println("Exception at getFacultyByEno:" + e);
		} finally {

			rs = null;
			ps = null;
			conn = null;
			return fdto;
		}
	}

	@Override

	public FacultyDTO getFacultyByEmpid(String empid) {
		FacultyDTO fdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from faculty_master where empid=?");
			ps.setString(1, empid);
			rs = ps.executeQuery();
			if (rs.next()) {
				fdto = new FacultyDTO();
				fdto.setEno(rs.getInt("eno"));
				fdto.setEmpid(rs.getString("empid"));
				fdto.setName(rs.getString("name"));
				fdto.setGender(rs.getString("gender"));
				fdto.setMno(rs.getString("mno"));
				fdto.setDob(rs.getString("dob"));
				fdto.setEmail(rs.getString("email"));
				fdto.setPassword(rs.getString("password"));
				fdto.setHobby(rs.getString("hobby"));
				fdto.setGname(rs.getString("gname"));
				fdto.setGmno(rs.getString("gmno"));
				fdto.setQualification(rs.getString("qualification"));
				fdto.setCertification(rs.getString("certification"));
				fdto.setExperiance(rs.getFloat("experiance"));
				fdto.setDoj(rs.getString("doj"));
				fdto.setBgroup(rs.getString("Bgroup"));
				fdto.setState(rs.getString("state"));
				fdto.setCity(rs.getString("city"));
				fdto.setPincode(rs.getInt("pincode"));
				fdto.setAddress(rs.getString("address"));
				fdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				photo = rs.getBinaryStream("photo");

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at getFacultyByEno:" + e);
		} finally {

			rs = null;
			ps = null;
			conn = null;
			return fdto;
		}
	}

	@Override
	public ArrayList<FacultyDTO> getAllFaculty() {
		ArrayList<FacultyDTO> list = new ArrayList<>();
		FacultyDTO fdto = null;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from faculty_master");
			rs = ps.executeQuery();
			while (rs.next()) {
				fdto = new FacultyDTO();
				fdto.setEno(rs.getInt("eno"));
				fdto.setEmpid(rs.getString("empid"));
				fdto.setName(rs.getString("name"));
				fdto.setGender(rs.getString("gender"));
				fdto.setMno(rs.getString("mno"));
				fdto.setDob(rs.getString("dob"));
				fdto.setEmail(rs.getString("email"));
				fdto.setPassword(rs.getString("password"));
				fdto.setHobby(rs.getString("hobby"));
				fdto.setGname(rs.getString("gname"));
				fdto.setGmno(rs.getString("gmno"));
				fdto.setQualification(rs.getString("qualification"));
				fdto.setCertification(rs.getString("certification"));
				fdto.setExperiance(rs.getFloat("experiance"));
				fdto.setDoj(rs.getString("doj"));
				fdto.setBgroup(rs.getString("Bgroup"));
				fdto.setState(rs.getString("state"));
				fdto.setCity(rs.getString("city"));
				fdto.setPincode(rs.getInt("pincode"));
				fdto.setAddress(rs.getString("address"));
				fdto.setPhoto(Base64.getEncoder().encodeToString(rs.getBytes("photo")));
				photo = rs.getBinaryStream("photo");
				list.add(fdto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllFaculty:" + e);
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

	@Override
	public boolean checkFacultyDuplicateInfo(String s) {
		boolean flag = true;
		if (conn == null) {
			conn = Feeder_DB.getFeederDB();
		}
		try {
			ps = conn.prepareStatement("select * from faculty_master where mno=? or email=? or empid=?");
			ps.setString(1, s);
			ps.setString(2, s);
			ps.setString(3, s);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("Exception at checkFacultyDuplicateInfo:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;

			return flag;
		}
	}
	public static void main(String[] args) {
		System.out.println(new FacultyDAOImp().getFacultyByEmpid("1"));
	}
}
