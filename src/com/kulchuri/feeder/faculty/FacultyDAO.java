package com.kulchuri.feeder.faculty;

import java.io.InputStream;
import java.util.ArrayList;

public interface FacultyDAO {
	boolean addFaculty(FacultyDTO fdto,InputStream photo);

	boolean updateFaculty(FacultyDTO fdto);

	boolean deleteFaculty(int eno);

	FacultyDTO getFacultyByEmpid(String empid);

	
	FacultyDTO getFacultyByEno(int eno);

	ArrayList<FacultyDTO> getAllFaculty();

	boolean checkFacultyDuplicateInfo(String s);

}