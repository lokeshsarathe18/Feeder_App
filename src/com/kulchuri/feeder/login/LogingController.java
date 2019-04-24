package com.kulchuri.feeder.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.crypto.EncryptedPrivateKeyInfo;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kulchuri.feeder.faculty.FacultyDAOImp;
import com.kulchuri.feeder.faculty.FacultyDTO;
import com.kulchuri.feeder.student.StudentDAOImp;
import com.kulchuri.feeder.student.StudentDTO;
import com.kulchuri.feeder.utility.FeederPassword;;
@WebServlet(name = "LogingController", urlPatterns = { "/LogingController" })
public class LogingController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			LoginDTO ldto = new LoginDAO().login(uname, pwd);
			if (ldto != null) {
				if (ldto.getType().equals("admin")) {
					HttpSession hs = request.getSession();
					hs.setAttribute("uname", uname);
					RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
					rd.forward(request, response);
				} else if (ldto.getType().equals("faculty")) {
					FacultyDTO fdto = new FacultyDAOImp().getFacultyByEmpid(uname);
					HttpSession session = request.getSession();
					session.setAttribute("fdto", fdto);
					RequestDispatcher rd = request.getRequestDispatcher("faculty_home.jsp");
					rd.forward(request, response);
				} else {
					StudentDTO sdto = new StudentDAOImp().getStudentByEmpId(uname);
					HttpSession session = request.getSession();
					session.setAttribute("sdto", sdto);
					RequestDispatcher rd = request.getRequestDispatcher("student_home.jsp");
					rd.forward(request, response);
				}
			} else {
				out.print("<script>alert('Please Enter Valid Uname & Password')</script>\n" + "    ");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}
	}

}
