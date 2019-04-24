<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="head.html"%>
</head>
<body>
	<%@include file="menu.html"%>
	<%@include file="admin_header.jsp"%>
	<%
		String eno = request.getParameter("sno");
		FacultyDTO fdto = new FacultyDAOImp().getFacultyByEno(Integer.parseInt(eno));
	%>
	<div>
		<pre>
		<fieldset>
		<h1>
					<mark>FACULTY DETAILS:</mark>
				</h1>
		<table>
			<tr>
				<th>EmploymentID</th>
					<td><%=fdto.getEmpid()%></td>
				<th>Name</th>
					<td><%=fdto.getName()%></td>
				</tr>
				
			<tr>	
				<th>Gender</th>
					<td><%=fdto.getGender()%></td>
				
				<th>MobileNo</th>
					<td><%=fdto.getMno()%></td>
				</tr>
				<tr>
				<th>DOB</th>
					<td><%=fdto.getDob()%></td>
				<th>Email</th>
					<td><%=fdto.getEmail()%></td>	</tr>
				<tr>
				<th>Password</th>
					<td><%=fdto.getPassword()%></td>
				<th>Hobby</th>
					<td><%=fdto.getHobby()%></td>
				</tr>
				<tr>
					<th>GuardianName</th>
					<td><%=fdto.getGname()%></td>
				<th>GuardianMno</th>
					<td><%=fdto.getGmno()%></td>
				</tr>
				<tr>
					<th>Qualification</th>
					<td><%=fdto.getQualification()%></td>	
				<th>Certification</th>
					<td><%=fdto.getCertification()%></td>
				</tr>
				<tr>	<th>Experiance</th>
					<td><%=fdto.getExperiance()%></td>
				
				<th>Date_Of_Joining</th>
					<td><%=fdto.getDoj()%></td>
				</tr>
				<tr>
					<th>Blood Group</th>
					<td><%=fdto.getBgroup()%></td>
				<th>State</th>
					<td><%=fdto.getState()%></td>
				</tr>
				<tr>
					<th>City</th>	<td><%=fdto.getCity()%></td>
				<th>Pincode</th>
					<td><%=fdto.getPincode()%></td>
				</tr>

			<tr>	<th>Address</th>
					<td><%=fdto.getAddress()%></td>
				<th>Photo</th>
					<td><%=fdto.getPhoto()%></td>
				</tr>
			</tr>
			<tr>	
			</tr>
		</table>
		</fieldset>
		</pre>
	</div>
</body>
</html>