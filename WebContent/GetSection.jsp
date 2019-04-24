
<%@page import="com.kulchuri.feeder.subject.SubjectDao"%>
<%@page import="com.kulchuri.feeder.subject.SubjectBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%
	String branch = request.getParameter("branch");
	String sem = request.getParameter("sem");
	if (request.getMethod().equalsIgnoreCase("post")) {
		ArrayList<SubjectBean> al = new SubjectDao().getAllSubjectsBySem(branch, Integer.parseInt(sem));
		if (al != null) {
			for (SubjectBean s : al) {
				%>
				out.println("
				<option value='<%=s.getSid() %>'><%=s.getSname()%></option>
				");
				<%
			}
		}
	}

	if (request.getMethod().equalsIgnoreCase("get")) {
		String college = request.getParameter("college");
		String course = request.getParameter("course");
		ArrayList<String> arrayList = new AttendanceDAOImp().getSection(college, branch, sem, course);
		if (arrayList != null) {
			for (String s : arrayList) {
%>
out.println("
<option value='<%=s%>'><%=s%></option>
");
<%
	}
		}
	}
%>