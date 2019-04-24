<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%@page import="com.kulchuri.feeder.attendance.AttendanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.html"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

input[type=text], select {
	width: 24%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
<script>
	function getSemester() {
		ajaxReq = new XMLHttpRequest();
		ajaxBranch = new XMLHttpRequest();
		var course = document.getElementById("course").value;
		ajaxBranch.onreadystatechange = showBranch;
		ajaxBranch.open("POST", "GetData.jsp?course=" + course, true);
		ajaxBranch.send(null);
		ajaxReq.onreadystatechange = showData;
		ajaxReq.open("GET", "GetData.jsp?course=" + course, true);
		ajaxReq.send(null);

	}
	function showData() {
		if (ajaxReq.readyState == 4) {
			var data = ajaxReq.responseText;
			document.getElementById("sem").innerHTML = data;
			document.getElementById("lectureno").innerHTML = data;
		}
	}
	function showBranch() {
		if (ajaxBranch.readyState == 4) {
			var data = ajaxBranch.responseText;
			document.getElementById("branch").innerHTML = data;
		}
	}
	function getSection() {

		ajaxSec = new XMLHttpRequest();
		ajaxSub = new XMLHttpRequest();
		var college = document.getElementById("college").value;
		var course = document.getElementById("course").value;
		var branch = document.getElementById("branch").value;
		var sem = document.getElementById("sem").value;
		ajaxSec.onreadystatechange = showSec;
		ajaxSec.open("GET", "GetSection.jsp?course=" + course + "&branch="
				+ branch + "&sem=" + sem + "&college=" + college, true);
		ajaxSec.send(null);

		ajaxSub.onreadystatechange = showSub;
		ajaxSub.open("POST", "GetSection.jsp?course=" + course + "&branch="
				+ branch + "&sem=" + sem, true);
		ajaxSub.send(null);
	}
	function showSec() {
		if (ajaxSec.readyState == 4) {
			var data = ajaxSec.responseText;
			document.getElementById("sec").innerHTML = data;
		}
	}
	function showSub() {
		if (ajaxSub.readyState == 4) {
			var data = ajaxSub.responseText;
			document.getElementById("subject").innerHTML = data;
		}
	}
</script>

</head>
<body>
	<%@include file="faculty_header.jsp"%>
	<%@include file="menu.html"%>
	<%
		AttendanceDTO dto = (AttendanceDTO) session.getAttribute("dto");
		ArrayList<AttendanceDTO> al = new AttendanceDAOImp().getAllStudentAttendance(dto);
		if (al != null) {
	%>
	<div style="margin-left: 30%">
		<h3 style="color: red; margin-left: 20%; margin-top: 10px;">List
			of Students</h3>
		<table id="customers" style="width: 60%; margin: 10px;">
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
			<%
				int s = 0;
					for (AttendanceDTO bean : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=bean.getName()%></td>
				<td><%=bean.getStatus()%></td>
				<td><a
					href="faculty_updateAttendance.jsp?aid=<%=bean.getAid()%>&status=<%=bean.getStatus()%>">Edit</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<div style="margin: 10px; padding: 10px;">
		<form action="faculty_viewAttendance.jsp" method="post">
			<%
				HashMap<String, String> colleges = FeederUtility.getColleges();
					Set<String> keys = colleges.keySet();
			%>
			<div>
				<span style="color: red;">College</span> <span
					style="color: red; margin-left: 20%">Course</span> <span
					style="color: red; margin-left: 20%">Branch</span> <span
					style="color: red; margin-left: 20%">Semester</span>
			</div>
			<div>
				<input type="hidden" name="fid" value="<%=fdto.getEno()%>" /> <select
					name="college" id="college">
					<option value="--------">---select college---</option>
					<%
						for (String key : keys) {
					%>
					<option value="<%=key%>"><%=colleges.get(key)%></option>
					<%
						}
					%>
				</select> <select name="course" id="course" onchange="getSemester()">
					<option value="--------">---select Course---</option>
					<%
						for (String course : FeederUtility.getCourses()) {
					%>
					<option value="<%=course%>"><%=course%></option>
					<%
						}
					%>
				</select> <select name="branch" id="branch">
					<option value="--------">---select Branch---</option>
				</select> <select name="sem" id="sem" onchange="getSection()">
					<option value="--------">---select Semester---</option>
				</select>
			</div>
			<div>
				<span style="color: red;">Section</span> <span
					style="color: red; margin-left: 20%">Subject</span> <span
					style="color: red; margin-left: 20%">Lecture Number</span>
			</div>
			<div>
				<select name="sec" id="sec">
					<option value="--------">---select Section---</option>
				</select> <select name="subject" id="subject">
					<option value="--------">---select Subject---</option>
				</select> <select name="lectureno" id="lectureno">
					<option value="--------">---Select Lectureno---</option>
				</select> <input type="submit" value="Show" name="opn" />
			</div>
		</form>
	</div>
	<%
		}
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="fdao"
		class="com.kulchuri.feeder.attendance.AttendanceDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="fdao" />
	<%
		ArrayList<AttendanceDTO> all = new AttendanceDAOImp().getAllStudentAttendance12(fdao);
			if (all != null) {
	%>
	<div style="margin-left: 30%">
		<h3 style="color: red; margin-left: 20%; margin-top: 10px;">List
			of Students</h3>
		<table id="customers" style="width: 60%; margin: 10px;">
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Status</th>
				<th>Date</th>
			</tr>
			<%
				int s = 0;
						for (AttendanceDTO bean : all) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=bean.getName()%></td>
				<td><%=bean.getStatus()%></td>
				<td><%=bean.getDatetime()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
			} else {
			}
		%>
	</div>
</body>
</html>