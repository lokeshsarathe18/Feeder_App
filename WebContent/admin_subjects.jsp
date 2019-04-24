
<%@page import="com.kulchuri.feeder.subject.SubjectDao"%>
<%@page import="com.kulchuri.feeder.subject.SubjectBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<script>
	function checkDuplicateMno() {
		ajaxReq = new XMLHttpRequest();
		var mno = document.getElementById("mno").value;
		ajaxReq.onreadystatechange = takeMnoResponse;
		ajaxReq.open("GET", "checkStudentDuplicate.jsp?data=" + mno, true);
		ajaxReq.send(null);
	}
	function takeMnoResponse() {
		if (ajaxReq.readyState === 4) {
			document.getElementById("mno1").innerHTML = ajaxReq.responseText;
		}
	}

	function checkDuplicateEmail() {
		ajaxReq = new XMLHttpRequest();
		var email = document.getElementById("email").value;
		ajaxReq.onreadystatechange = takeEmailResponse;
		ajaxReq.open("GET", "checkStudentDuplicate.jsp?data=" + email, true);
		ajaxReq.send(null);
	}
	function takeEmailResponse() {
		if (ajaxReq.readyState === 4) {
			document.getElementById("email1").innerHTML = ajaxReq.responseText;
		}
	}

	function checkDuplicateEno() {
		ajaxReq = new XMLHttpRequest();
		var eno = document.getElementById("eno").value;
		ajaxReq.onreadystatechange = takeEnoResponse;
		ajaxReq.open("GET", "checkStudentDuplicate.jsp?data=" + eno, true);
		ajaxReq.send(null);
	}
	function takeEnoResponse() {
		if (ajaxReq.readyState === 4) {
			document.getElementById("eno1").innerHTML = ajaxReq.responseText;
		}
	}

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
</script>
<style type="text/css">
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 50%;
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
input[type=text], select {
	width: 20%;
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
<%
	SubjectDao dao = new SubjectDao();
	if (request.getParameter("opn") != null && request.getParameter("opn").equalsIgnoreCase("delete")) {
		String sid = request.getParameter("sid");
		dao.deleteSubject(Integer.parseInt(sid));
	}
	if (request.getMethod().equalsIgnoreCase("post"))

	{
%>
<jsp:useBean id="sbean" class="com.kulchuri.feeder.subject.SubjectBean"></jsp:useBean>
<jsp:setProperty property="*" name="sbean" />
<%
	if (dao.addSubject(sbean)) {
		}
	}
%>
</head>
<body>
	<%@include file="admin_header.jsp"%>
	<div style="margin-left: 7%;">
		<form action="admin_subjects.jsp" method="post">
			<div>
				<label>Course</label> <label style="margin-left: 16%">Branch</label>
				<label style="margin-left: 15.5%">Semester</label> <label
					style="margin-left: 14%">Subject</label>
			</div>
			<div>
				<select name="course" id="course" onchange="getSemester()">
					<option value="--------">---select Course---</option>

					<%
						for (String s : FeederUtility.getCourses()) {
					%>
					<option value="<%=s%>"><%=s%></option>
					<%
						}
					%>
				</select> <select name="branch" id="branch">
					<option value="--------">---select Branch---</option>

				</select> <select name="sem" id="sem">
					<option value="--------">---select Semester---</option>
				</select> <input type="text" name="sname" placeholder="Subject Name"
					required="required" /> <input type="submit" value="Submit" />
			</div>
		</form>
	</div>

	<%
		ArrayList<SubjectBean> al = new SubjectDao().getAllSubjects();
		if (al != null) {
	%>
	<center>
		<div>
			<h3 style="margin: 10px; color: red; font-family: cursive;">List
				Of Subjects</h3>
			<table id="customers">
				<tr>
					<th>S.No.</th>
					<th>Subject Name</th>
					<th>Branch</th>
					<th>Semester</th>
					<th>Action</th>
				</tr>
				<%
					int sn = 1;
						for (SubjectBean bean : al) {
				%>
				<tr>

					<td><%=sn++%></td>
					<td><%=bean.getSname()%></td>
					<td><%=bean.getBranch()%></td>
					<td><%=bean.getSem()%></td>
					<td><a href="admin_subjects.jsp?sid=<%=bean.getSid()%>">Edit</a>
						<a href="admin_subjects.jsp?sid=<%=bean.getSid()%>&opn=delete">Delete</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				}
			%>
		</div>
	</center>
	<%@include file="menu.html"%>
</body>
</html>
