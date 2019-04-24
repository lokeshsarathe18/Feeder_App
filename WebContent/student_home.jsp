<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.Base64"%>
<%@page import="com.kulchuri.feeder.student.StudentDAOImp"%>
<%@page import="com.kulchuri.feeder.student.StudentDAO"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
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
	<%@include file="student_header.jsp"%>
	<%
		StudentDTO dto = sdto;
	%>
	<div style="margin-left: 40%">
		<h3>STUDENT DETAILS:</h3>

	</div>
	<div style="margin: 2%; font-size: 20px;">
		<img src="data:image/jpeg;base64,<%=sdto.getPhoto()%>" height="100px"
			width="100px">

		<table style="width: 100%">
			<tr>
				<th>Name</th>
				<td><%=sdto.getName()%></td>
				<th>M.No.</th>
				<td><%=sdto.getMno()%></td>
				<th>Enrollment No.</th>
				<td><%=sdto.getEno()%></td>
			</tr>
			<tr>
				<th>DOB</th>
				<td><%=sdto.getDob()%></td>
				<th>Gender</th>
				<td><%=sdto.getGender()%></td>
				<th>Email</th>
				<td><%=sdto.getEmail()%></td>
			</tr>
			<tr>
				<th>Category</th>
				<td><%=sdto.getCategory()%></td>
				<th>Hobby</th>
				<td><%=sdto.getHobby()%></td>
				<th>Blood Group</th>
				<td><%=sdto.getBgroup()%></td>
			</tr>
			<tr>
				<th>State</th>
				<td><%=sdto.getState()%></td>
				<th>City</th>
				<td><%=sdto.getCity()%></td>
				<th>Pincode</th>
				<td><%=sdto.getPincode()%></td>

			</tr>
			<tr>
				<th>Address</th>
				<td><%=sdto.getAddress()%></td>
				<th>Father Name</th>
				<td><%=sdto.getFname()%></td>
				<th>Mother Name</th>
				<td><%=sdto.getMname()%></td>
			</tr>
			<tr>
				<th>Parent's Mno</th>
				<td><%=sdto.getPmno()%></td>
				<%
					String college = FeederUtility.getColleges().get(sdto.getCollege());
				%>
				<th>College</th>
				<td><%=college%></td>
				<th>Course</th>
				<td><%=sdto.getCourse()%></td>
			</tr>
			<tr>
				<th>Branch</th>
				<td><%=sdto.getBranch()%></td>
				<th>Sem</th>
				<td><%=sdto.getSem()%></td>
				<th>Sec</th>
				<td><%=sdto.getSec()%></td>
			</tr>

		</table>
	</div>
	<%@include file="menu.html"%>
</body>
</html>