
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		String aid = request.getParameter("aid");
		String status = request.getParameter("status1");
		if (new AttendanceDAOImp().updateAttendance(aid, status)) {
%>
<<jsp:forward page="faculty_viewAttendance.jsp"></jsp:forward>
<%
	}
	}
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<style type="text/css">
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

th {
	border: 1px solid #ddd;
	padding: 8px;
	background-color: skyblue;
}
</style>
</head>
<body>
	<%@include file="faculty_header.jsp"%>
	<%@include file="menu.html"%>
	<%
		String aid = request.getParameter("aid");
		String status = request.getParameter("status");
		if (aid != null && status != null) {
	%>
	<div>
		<form action="" method="post">
			<div>
				<input type="text" value="<%=aid%>" name="aid" />
				<%
					if (status.equalsIgnoreCase("P")) {
				%>
				<input type="radio" checked="checked" name="status1" value="P" />P <input
					type="radio" name="status1" value="A" />A <input type="radio"
					name="status1" value="N" />NA
				<%
					} else if (status.equalsIgnoreCase("A")) {
				%>
				<input type="radio" name="status1" value="P" />P <input
					type="radio" name="status1" checked="checked" value="A" />A <input
					type="radio" name="status1" value="N" />NA
				<%
					} else {
				%>
				<input type="radio" name="status1" value="P" />P <input
					type="radio" name="status1" value="A" />A <input type="radio"
					name="status1" checked="checked" value="N" />NA
				<%
					}
				%>
			</div>
			<div>
				<input type="submit" value="update">
			</div>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>
