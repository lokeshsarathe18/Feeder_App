<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.html"%>
<style type="text/css">
tr {
	width: 100%;
}

td {
	width: 20%;
	padding-left: 2%;
	padding-top: 1.5%;
}
</style>

</head>
<body>
	<%
		String fid = request.getParameter("fid");
		FacultyDTO fdto = new FacultyDAOImp().getFacultyByEno(Integer.parseInt(fid));
	%>
	<%@include file="admin_header.jsp"%>
	<div style="margin-left: 40%">
		<h3>Faculty DETAILS:</h3>
	</div>
	<div style="margin: 3%; font-size: 20px;">
		<img src="data:image/jpeg;base64,<%=fdto.getPhoto()%>" height="100px"
			width="100px">
		<table style="width: 100%">
			<tr>
				<th>Employment ID</th>
				<td><%=fdto.getEmpid()%></td>
				<th>Name</th>
				<td><%=fdto.getName()%></td>
				<th>Gender</th>
				<td><%=fdto.getGender()%></td>

			</tr>

			<tr>
				<th>Mobile N.o</th>
				<td><%=fdto.getMno()%></td>
				<th>DOB</th>
				<td><%=fdto.getDob()%></td>
				<th>Email</th>
				<td><%=fdto.getEmail()%></td>
			</tr>
			<tr>
				<th>Hobby</th>
				<td><%=fdto.getHobby()%></td>
				<th>Guardian Name</th>
				<td><%=fdto.getGname()%></td>
				<th>Guardian M.No.</th>
				<td><%=fdto.getGmno()%></td>
			</tr>
			<tr>
				<th>Qualification</th>
				<td><%=fdto.getQualification()%></td>
				<th>Certification</th>
				<td><%=fdto.getCertification()%></td>
				<th>Experience</th>
				<td><%=fdto.getExperiance()%></td>

			</tr>
			<tr>
				<th>D.O.J</th>
				<td><%=fdto.getDoj()%></td>
				<th>Blood Group</th>
				<td><%=fdto.getBgroup()%></td>
				<th>State</th>
				<td><%=fdto.getState()%></td>
			</tr>
			<tr>
				<th>City</th>
				<td><%=fdto.getCity()%></td>
				<th>Pincode</th>
				<td><%=fdto.getPincode()%></td>
				<th>Address</th>
				<td><%=fdto.getAddress()%></td>
			</tr>
		</table>

	</div>
	<%@include file="menu.html"%>
</body>
</html>