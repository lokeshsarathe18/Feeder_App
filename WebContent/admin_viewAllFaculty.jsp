
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<%@include file="admin_header.jsp"%>
	<%@include file="menu.html"%>
	<%
		String opn = request.getParameter("opn");
		if (opn != null && opn.equalsIgnoreCase("delete")) {
			String eno = request.getParameter("eno");
			new FacultyDAOImp().deleteFaculty(Integer.parseInt(eno));
		}
	%>
	<%
		ArrayList<FacultyDTO> al = new FacultyDAOImp().getAllFaculty();
		if (al != null) {
	%>
	<h3 style="margin-left: 45%; color: red;">Faculty List</h3>
	<div style="margin: 1%">
		<table id="customers">
			<tr>
				<th style="width: 1%">S.No.</th>
				<th>Name</th>
				<th>M.No.</th>
				<th>Emp.ID</th>
				<th>D.O.B</th>
				<th>D.O.J</th>
				<th>Gender</th>
				<th>City</th>
				<th>Qualification</th>
				<th>Certification</th>
				<th>Experience</th>
				<th style="width: 12%">Action</th>
			</tr>
			<%
				int sn = 1;
					for (FacultyDTO fdto : al) {
			%>
			<tr>
				<td><%=sn++%></td>
				<td><%=fdto.getName()%></td>
				<td><%=fdto.getMno()%></td>
				<td><%=fdto.getEmpid()%></td>
				<td><%=fdto.getDob()%></td>
				<td><%=fdto.getDoj()%></td>
				<td><%=fdto.getGender()%></td>
				<td><%=fdto.getCity()%></td>
				<td><%=fdto.getQualification()%></td>
				<td><%=fdto.getCertification()%></td>
				<td><%=fdto.getExperiance()%></td>
				<td>
				
					<a
					href="admin_viewAllFaculty.jsp?eno=<%=fdto.getEno()%>&opn=delete">delete</a>
					<a href="admin_viewFacultyInfo.jsp?fid=<%=fdto.getEno()%>">View</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<h2>There are no any faculty available</h2>
	<%
		}
	%>
</body>
</html>