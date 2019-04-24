
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#fdate").datepicker();
	});
	$(function() {
		$("#tdate").datepicker();
	});
</script>
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
<style>
input[type=text] {
	width: 25%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 10%;
	background-color: gray;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}
</style>

</head>
<body>
	<%@include file="admin_header.jsp"%>
	<div style="margin-left: 12%">
		<span style="color: red; font-weight: bold; font-size: 20px;">Attendance
			Between Dates</span>
		<form method="post" action="admin_attendanceByFaculty.jsp">
			<%
				if (request.getMethod().equalsIgnoreCase("post")) {
			%>
			<input value="<%=request.getParameter("fdate")%>" required="required"
				placeholder="From Date" type="text" name="fdate" id="fdate" /> <input
				value="<%=request.getParameter("tdate")%>" required="required"
				placeholder="To Date" type="text" name="tdate" id="tdate" /> <input
				required="required" value="<%=request.getParameter("fid")%>"
				placeholder="Enter Faculty Number" type="text" name="fid" />
			<%
				} else {
			%>
			<input required="required" placeholder="From Date" type="text"
				name="fdate" id="fdate" /> <input required="required"
				placeholder="To Date" type="text" name="tdate" id="tdate" /> <input
				required="required" placeholder="Enter Faculty Number" type="text"
				name="fid" />
			<%
				}
			%>
			<input type="submit" value="View">
		</form>
	</div>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
			String tdate = request.getParameter("tdate");
			String fdate = request.getParameter("fdate");
			String fid = request.getParameter("fid");
			ArrayList<AttendanceDTO> al = new AttendanceDAOImp().getAttendanceFacultyByDate(fdate, tdate,
					Integer.parseInt(fid));
			if (al != null) {
	%>
	<div style="margin-left: 12%;">
		<h3 style="margin: 1%; color: red;">
			Faculty:<%=" " + al.get(0).getName()%>
		</h3>
		<table id="customers" style="width: 86.5%">
			<tr>
				<th style="width: 1%">S.No.</th>
				<th>Date</th>
				<th>College</th>
				<th>Course</th>
				<th>Branch</th>
				<th>Sem</th>
				<th>Subject</th>
				<th>Lecture No.</th>
				<th>lcount</th>
			</tr>
			<%
				int sn = 1;
						for (AttendanceDTO dto : al) {
			%>
			<tr>
				<td><%=sn++%></td>
				<td><%=dto.getDatetime()%></td>
				<td><%=dto.getStatus()%></td>
				<td><%=dto.getCourse()%></td>
				<td><%=dto.getBranch()%></td>
				<td><%=dto.getSem()%></td>
				<td><%=dto.getSname()%></td>
				<td><%=dto.getLectureno()%></td>
				<td><%=dto.getLcount()%></td>


			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<h2>There are no any Faculty Attendance Available</h2>
	<%
		}
		}
	%>

</body>
</html>
