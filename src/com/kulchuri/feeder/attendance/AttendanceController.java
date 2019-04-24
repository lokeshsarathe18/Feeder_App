package com.kulchuri.feeder.attendance;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AttendanceController", urlPatterns = { "/AttendanceController" })
public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;

	public AttendanceController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AttendanceDAO dao = new AttendanceDAOImp();
		AttendanceDTO dto = null;
		String fid = request.getParameter("fid");
		String sec = request.getParameter("sec");
		String datetime = request.getParameter("datetime");
		String branch = request.getParameter("branch");
		String lcount = request.getParameter("lcount");
		String subject = request.getParameter("subject");
		String lectureno = request.getParameter("lectureno");
		String sem = request.getParameter("sem");
		String college = request.getParameter("college");
		String rno[] = request.getParameterValues("rno");
		String opn12 = request.getParameter("opn12");
		ArrayList<AttendanceDTO> arrayList = new ArrayList<>();
		Enumeration enumeration = request.getParameterNames();
		int n = 0;
		while (enumeration.hasMoreElements()) {
			String param = (String) enumeration.nextElement();
			if (param.contains("att")) {
				dto = new AttendanceDTO();
				dto.setEno(rno[n]);
				dto.setSec(sec);
				dto.setFid(fid);
				dto.setSem(Integer.parseInt(sem));
				dto.setLcount(Integer.parseInt(lcount));
				dto.setLectureno(Integer.parseInt(lectureno));
				dto.setDatetime(datetime);
				dto.setBranch(branch);
				dto.setStatus(request.getParameter(param));
				dto.setSubject(Integer.parseInt(subject));
				arrayList.add(dto);
				n++;
			}
		}
		int i = 0;
		for (AttendanceDTO dto2 : arrayList) {
			dao.addAttendance(dto2);
			i++;
		}
		if (i != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("dto", dto);
			response.sendRedirect("faculty_viewAttendance.jsp");
		}
	}
}
