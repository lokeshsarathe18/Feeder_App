<%@page import="com.kulchuri.feeder.student.StudentDAOImp"%>
<%@page import="com.kulchuri.feeder.student.StudentDAO"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="head.html"%>
<style type="text/css">
tr {
	width: 100%;
}

td {
	padding-left: 2%;
	padding-top: 1.5%;
}
</style>
</head>
<body>
	<%@include file="admin_header.jsp"%>
	<%@include file="menu.html"%>
	<%
		String sno = request.getParameter("sno");
		StudentDTO sdto = new StudentDAOImp().getStudentBySno(sno);
	%>
	<div style="margin: 2%">
		<h1>
			STUDENT DETAILS:
		</h1>
		<img src="data:image/jpeg;base64,<%=sdto.getPhoto()%>" width="100"
			height="100" />
		<table style="width: 98%; margin: 2%">
			<tr>
				<th>Name</th>
				<td><%=sdto.getName()%></td>
				<th>MobileNO</th>
				<td><%=sdto.getMno()%></td>
				<th>Blood Group</th>
				<td><%=sdto.getBgroup()%></td>
				<th>DOB</th>
				<td><%=sdto.getDob()%></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=sdto.getEmail()%></td>
				<th>Category</th>
				<td><%=sdto.getCategory()%></td>
				<th>Hobby</th>
				<td><%=sdto.getHobby()%></td>
			</tr>
			<tr>
				<th>EnrollmentNo</th>
				<td><%=sdto.getEno()%></td>
				<th>Course</th>
				<td><%=sdto.getCourse()%></td>
				<th>College</th>
				<td><%=sdto.getCollege()%></td>
				<th>Branch</th>
				<td><%=sdto.getBranch()%></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td><%=sdto.getGender()%></td>
				<th>Sem</th>
				<td><%=sdto.getSem()%></td>
				<th>Sec</th>
				<td><%=sdto.getSec()%></td>
			</tr>
			<tr>
				<th>State</th>
				<td><%=sdto.getState()%></td>
				<th>City</th>
				<td><%=sdto.getCity()%></td>
				<th>Address</th>
				<td><%=sdto.getAddress()%></td>
				<th>Pincode</th>
				<td><%=sdto.getPincode()%></td>
			</tr>
			<tr>
				<th>Father Name</th>
				<td><%=sdto.getFname()%></td>
				<th>Parent's M.No.</th>
				<td><%=sdto.getPmno()%></td>
				<th>Mother Name</th>
				<td><%=sdto.getMname()%></td>
				</td>
			</tr>

		</table>
	</div>

</body>
</html>