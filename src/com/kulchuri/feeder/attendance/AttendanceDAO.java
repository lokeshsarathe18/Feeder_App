package com.kulchuri.feeder.attendance;

import java.util.ArrayList;

import com.kulchuri.feeder.student.StudentDTO;

public interface AttendanceDAO {
	boolean addAttendance(AttendanceDTO adto);

	boolean updateAttendance(String aid,String status);

	boolean deleteAttendance(int aid);

	ArrayList<AttendanceDTO> getAttendanceByEno(String rno);

	ArrayList<AttendanceDTO> getAttendanceStudentByDate(String fdate, String tdate, String rno);

	ArrayList<AttendanceDTO> getAttendanceFacultyByDate(String fdate, String tdate, int fid);

	AttendanceDTO getAttendanceByAid(int aid);

	ArrayList<String> getSection(String college, String branch, String sem, String course);

	ArrayList<AttendanceDTO> getAllStudentAttendance(AttendanceDTO dto);

	ArrayList<StudentDTO> getAllStudent(String college, String branch, String sem, String course, String sec);

}
