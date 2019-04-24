package com.kulchuri.feeder.student;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(maxFileSize = 234567899)
@WebServlet(name = "StudentController", urlPatterns = { "/StudentController" })
public class StudentController extends HttpServlet {

	RequestDispatcher rd;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDTO sdto = new StudentDTO();
		StudentDAO sdao = new StudentDAOImp();
		PrintWriter pw = response.getWriter();
		String opn = request.getParameter("opn");
		sdto.setName(request.getParameter("name"));
		sdto.setEno(request.getParameter("eno"));
		sdto.setDob(request.getParameter("dob"));
		sdto.setMno(request.getParameter("mno"));
		sdto.setGender(request.getParameter("gender"));
		sdto.setPassword(request.getParameter("pwd"));
		sdto.setEmail(request.getParameter("email"));
		sdto.setPmno(request.getParameter("fmno"));
		sdto.setMname(request.getParameter("mname"));
		sdto.setFname(request.getParameter("fname"));
		sdto.setBgroup(request.getParameter("bgroup"));
		sdto.setState(request.getParameter("state"));
		sdto.setCity(request.getParameter("city"));
		sdto.setAddress(request.getParameter("address"));
		sdto.setSec(request.getParameter("sec"));
		sdto.setPincode(Integer.parseInt(request.getParameter("pincode")));

		sdto.setCategory(request.getParameter("category"));
		sdto.setCourse(request.getParameter("course"));
		sdto.setCollege(request.getParameter("college"));
		sdto.setSem(Integer.parseInt(request.getParameter("sem")));
		sdto.setBranch(request.getParameter("branch"));
		if (opn.equalsIgnoreCase("register")) {
			InputStream photo = request.getPart("photo").getInputStream();
			String arr[] = request.getParameterValues("hobby");
			String hobby = "";
			for (String s : arr) {
				hobby = hobby + s + ",";
			}
			sdto.setHobby(hobby);
			if (sdao.addStudent(sdto,photo)) {
				rd = request.getRequestDispatcher("admin_viewAllStudents.jsp");
				rd.forward(request, response);
			} else {
				rd = request.getRequestDispatcher("admin_addStudent.jsp");
				rd.forward(request, response);
			}

		} else if (opn.equalsIgnoreCase("update")) {
			String arr[] = request.getParameterValues("hobby");
			String hobby = "";
			for (String s : arr) {
				hobby = hobby + s + ",";
			}
			sdto.setHobby(hobby);
			String eno = request.getParameter("sno");
			sdto.setSno(Integer.parseInt(eno));
			if (sdao.updateStudent(sdto)) {
				rd = request.getRequestDispatcher("admin_viewAllStudents.jsp");
				rd.forward(request, response);
			} else {
				rd = request.getRequestDispatcher("student_info.jsp");
				rd.include(request, response);
			}
		}
	}
}