
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceController"%>
<html>
<head>
<LINK href="css/table.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String a = "att";
		if (request.getMethod().equalsIgnoreCase("post")) {
			String fid = request.getParameter("fid");
			String opn = request.getParameter("opn");
			String sec = request.getParameter("sec");
			String datetime = request.getParameter("datetime");
			String branch = request.getParameter("branch");
			int lcount = Integer.parseInt(request.getParameter("lcount"));
			int lectureno = Integer.parseInt(request.getParameter("lectureno"));
			String sem = request.getParameter("sem");
			String subject = request.getParameter("subject");
			String rno[] = request.getParameterValues("rno");
			String college = request.getParameter("college");
			String course = request.getParameter("course");
			ArrayList<StudentDTO> arrayList = new AttendanceDAOImp().getAllStudent(college, branch, sem, course,
					sec);
			if (arrayList != null) {
				int sn = 1;
				for (StudentDTO sdto : arrayList) {
	%>
	<form action="AttendanceController" method="post">
	<input type="hidden" name="fid" value=<%=fid%>>
	<input type="hidden" name="opn" value=<%=opn%>>
	<input type="hidden" name="sec" value=<%=sec%>>
	<input type="hidden" name="datetime" value=<%=datetime%>>
	<input type="hidden" name="branch" value=<%=branch%>>
	<input type="hidden" name="lcount" value=<%=lcount%>>
	<input type="hidden" name="lectureno" value=<%=lectureno%>>
	<input type="hidden" name="sem" value=<%=sem%>>
	<input type="hidden" name="college" value=<%=college%>>
	<input type="hidden" name="rno" value=<%=rno%>>
	<div>
		<h1>
			<mark>STUDENT ATTENDANCE:</mark>
		</h1>
		<table>
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Status</th>
			</tr>
			<tr>
				<td><%=sn++%></td>
				<td><%=sdto.getName()%></td>
				<td class="status">
				<input type="radio" name="<%=a + sdto%>" value="p" />P
				<input type="radio" name="<%=a + sdto%>" value="a" />A
				<input type="radio" name="<%=a + sdto%>" value="n" />NA
				</td>
			</tr>
			
			<%
				}
			%>
		</table>
	</div>
	<input type="submit" value="Submit" name="opn12" />
	</form>
	<%
		}
	}
	%>
</body>
</html>