
<%@page import="com.kulchuri.feeder.attendance.AttendanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
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
	<%@include file="student_header.jsp"%>
	<%
		ArrayList<AttendanceDTO> al = new AttendanceDAOImp().getAttendanceByEno(sdto.getEno());
		if (al != null) {
	%>
	<div style="margin-left: 20%; margin-top: 2%">
		<table id="customers" style="width: 80%">
			<tr>
				<th style="width: 1%">S.No.</th>
				<th>Date</th>
				<th>Lecture No.</th>
				<th>Subject</th>
				<th>Faculty</th>
				<th>Status</th>
			</tr>
			<%
				int sn = 1;
					for (AttendanceDTO fdto : al) {
			%>
			<tr>
				<td><%=sn++%></td>
				<td><%=fdto.getDatetime()%></td>
				<td><%=fdto.getLectureno()%></td>
				<td><%=fdto.getBranch()%></td>
				<td><%=fdto.getName()%></td>
				<td><%=fdto.getStatus()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<h2>There are no any attendance available</h2>
	<%
		}
	%>

</body>
</html>
