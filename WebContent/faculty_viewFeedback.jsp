<%@page import="com.kulchuri.feeder.feedback.FeedeBackDao"%>
<%@page import="com.kulchuri.feeder.feedback.FeedbackDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<%@include file="faculty_header.jsp"%>
	<%@include file="menu.html"%>
	<div style="margin-left: 17%">
		<h3 style="color: red; margin-left: 30%; margin-top: 10px;">Feedback
			Details</h3>
		<table id="customers" style="width: 80%; margin: 10px;">
			<tr>
				<th>S.No.</th>
				<th>Date</th>
				<th>Branch</th>
				<th>Semester</th>
				<th>Subject</th>
				<th>Lecture</th>

				<th>Description</th>
			</tr>
			<%
				ArrayList<FeedbackDto> list = new FeedeBackDao().getAllFeedBackByFaculty(fdto.getEno() + "");
				if (!list.isEmpty()) {
					int s = 0;
					for (FeedbackDto dto : list) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getDate()%></td>
				<td><%=dto.getBranch()%></td>
				<td><%=dto.getSem()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getLectureno()%></td>
				<td><%=dto.getDescription()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>

</body>
</html>