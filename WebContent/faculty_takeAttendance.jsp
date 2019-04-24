<%@page import="com.kulchuri.feeder.attendance.AttendanceDAOImp"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<style type="text/css">
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-weight: bold;
}

#customers td, #customers th {
	padding: 8px;
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
<%@include file="head.html"%>
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
	function getStudent() {

		ajaxStu = new XMLHttpRequest();
		var college = document.getElementById("college").value;
		var course = document.getElementById("course").value;
		var branch = document.getElementById("branch").value;
		var sem = document.getElementById("sem").value;
		var sec = document.getElementById("sec").value;

		ajaxStu.onreadystatechange = showStu;
		ajaxStu.open("GET", "getStudent.jsp?course=" + course + "&branch="
				+ branch + "&sem=" + sem + "&college=" + college + "&sec="
				+ sec, true);
		ajaxStu.send(null);
	}
	function showStu() {
		if (ajaxSec.readyState == 4) {
			var data = ajaxStu.responseText;
			document.getElementById("stu").innerHTML = data;
		}
	}
</script>
</head>
<body>

	<%@include file="faculty_header.jsp"%>
	<div style="margin: 10px; padding: 10px;">
		<form action=faculty_takeAttendance.jsp method="post">

			<%
				HashMap<String, String> colleges = FeederUtility.getColleges();
				Set<String> keys = colleges.keySet();
			%>
			<div>
				<select name="college" id="college">
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

				<select name="sec" id="sec">
					<option value="--------">---select Section---</option>
				</select> <select name="subject" id="subject">
					<option value="--------">---select Subject---</option>
				</select> <input type="text" name="lectureno" required="" /> <input
					type="text" name="lcount" /> <input type="hidden" name="fid"
					value="<%=fdto.getEno()%>" required="" />
			</div>
			<div>
				<input type="submit" value="Show" name="opn" />
			</div>
		</form>
	</div>
	<div style="margin-left: 30%">
		<%
			String a = "att";
			if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("opn").equalsIgnoreCase("show")) {
				String fid = request.getParameter("fid");
				String opn = request.getParameter("opn");
				String sec = request.getParameter("sec");
				String datetime = request.getParameter("datetime");
				String branch = request.getParameter("branch");
				int lcount = Integer.parseInt(request.getParameter("lcount"));
				int lectureno = Integer.parseInt(request.getParameter("lectureno"));
				String sem = request.getParameter("sem");
				String subject = request.getParameter("subject");
				String college = request.getParameter("college");
				String course = request.getParameter("course");
				ArrayList<StudentDTO> arrayList = new AttendanceDAOImp().getAllStudent(college, branch, sem, course,
						sec);
				if (arrayList != null) {
					int sn = 0;
		%>
		<form action="AttendanceController" method="post">
			<input type="hidden" name="fid" value="<%=fid%>" /> <input
				type="hidden" name="sec" value="<%=sec%>" /> <input type="hidden"
				name="subject" value="<%=subject%>" /> <input type="hidden"
				name="datetime" value="<%=datetime%>"> <input type="hidden"
				name="branch" value="<%=branch%>"> <input type="hidden"
				name="lcount" value="<%=lcount%>"> <input type="hidden"
				name="lectureno" value="<%=lectureno%>"> <input
				type="hidden" name="sem" value="<%=sem%>" /> <input type="hidden"
				name="college" value="<%=college%>">
			<div style="margin-top: 5px;">
				<table id="customers" style="width: 50%">
					<h3>STUDENT ATTENDANCE:</h3>
					<tr>
						<th>S.No.</th>
						<th>Name</th>
						<th>Status</th>
					</tr>
					<%
						for (StudentDTO sdto : arrayList) {
					%>
					<tr>
						<td><%=++sn%></td>
						<td><%=sdto.getName()%></td>
						<td class="status">
						<input type="hidden" name="rno" value=<%=sdto.getEno()%> /> 
							<input type="radio" name="<%=a + sn%>" value="P" />P 
							<input type="radio" name="<%=a + sn%>" checked="checked" value="A" />A 
							<input type="radio" name="<%=a + sn%>" value="N" />NA</td>
					</tr>

					<%
						}
					%>
				</table>
			</div>
			<div>
				<td><input type="submit" value="Submit" name="opn12" /></td>
			</div>
		</form>
		<%
			}
			}
		%>
	</div>

	<%@include file="menu.html"%>
</body>
</html>