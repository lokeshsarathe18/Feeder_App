<%@page import="com.kulchuri.feeder.student.StudentDAOImp"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" pageEncoding="text/html; charset=UTF-8">
<%@include file="head.html"%>
<style type="text/css">
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<%
		String opn = request.getParameter("opn");
		if (opn != null && opn.equalsIgnoreCase("delete")) {
			String sno = request.getParameter("sno");
			new StudentDAOImp().deleteStudent(sno);
		}
	%>



	<%@include file="admin_header.jsp"%>
	<%
		ArrayList<StudentDTO> al = new StudentDAOImp().getAllStudent();
		if (al != null) {
	%>
	<div>
		<table id="customers">
			<tr>
				<th style="text-align: center; font-weight: bold; width: 1%">S.No.</th>
				<th style="text-align: center; font-weight: bold; width: 10%">Name</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Mob.No</th>
				<th style="text-align: center; font-weight: bold; width: 1%">College</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Enroll.No.</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Course</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Section</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Gender</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Sem</th>
				<th style="text-align: center; font-weight: bold; width: 1%">Category</th>
				<th style="text-align: center; font-weight: bold; width: 10%">Email</th>
				<th style="text-align: center; font-weight: bold; width: 10%">Action</th>
			</tr>
			<%
				int sn = 1;
					for (StudentDTO sdto : al) {
			%>
			<tr>

				<td><%=sn++%></td>
				<td><%=sdto.getName()%></td>
				<td><%=sdto.getMno()%></td>
				<td><%=sdto.getCollege()%></td>
				<td><%=sdto.getEno()%></td>
				<td><%=sdto.getCourse()%></td>
				<td><%=sdto.getSec()%></td>
				<td><%=sdto.getGender()%></td>
				<td><%=sdto.getSem()%></td>
				<td><%=sdto.getCategory()%></td>
				<td><%=sdto.getEmail()%></td>
				<td>
				
					<a
					href="admin_viewAllStudents.jsp?sno=<%=sdto.getSno()%>&opn=delete">Delete</a>
					<a href="admin_viewStudentInfo.jsp?sno=<%=sdto.getSno()%>">View</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<h2>There are no any student available</h2>
	<%
		}
	%>
	<%@include file="menu.html"%>
</body>
</html>
