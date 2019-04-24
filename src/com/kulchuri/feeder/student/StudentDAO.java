package com.kulchuri.feeder.student;

import java.io.InputStream;
import java.util.ArrayList;

public interface StudentDAO {

    boolean addStudent(StudentDTO sdto,InputStream photo);

    boolean updateStudent(StudentDTO sdto);

    boolean deleteStudent(String sno);

    StudentDTO getStudentByEmpId(String eno);

    StudentDTO getStudentBySno(String sno);

    ArrayList<StudentDTO> getAllStudent();
    
    boolean checkStudentDuplicateInfo(String s);

}
