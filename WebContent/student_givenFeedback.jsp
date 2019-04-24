<%@page import="com.kulchuri.feeder.feedback.FeedbackDto"%>
<%@page import="com.kulchuri.feeder.feedback.FeedeBackDao"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kulchuri.feeder.subject.SubjectDao"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
%>
<jsp:useBean id="fbean" class="com.kulchuri.feeder.feedback.FeedbackDto"></jsp:useBean>
<jsp:setProperty property="*" name="fbean" />
<%
	if (new FeedeBackDao().addFeedback(fbean)) {
			out.print("<script> alert('Feedback Successfully Submited');</script>");
		}
	}
%>
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

<style>
input[type=email] {
	width: 33%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=text], select {
	width: 33%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=password] {
	width: 33%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=date] {
	width: 33%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=file] {
	width: 33%;
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
<script type="text/javascript">
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
</head>
<body>
	<%@include file="student_header.jsp"%>
	<div style="margin-left: 25%">
		<h3 style="margin-left: 22%; color: red; margin-top: 2%">Feedback
			Form</h3>
		<form action="student_givenFeedback.jsp" method="post">
			<div>
				<input type="hidden" value="<%=sdto.getSem()%>" name="sem" /> <input
					type="hidden" value="<%=sdto.getEno()%>" name="eno" /> <input
					type="hidden" value="<%=sdto.getBranch()%>" name="branch" />
			</div>
			<div style="margin-top: 1%;">
				<label>Lecture Number</label> <label style="margin-left: 21.5%;">Subject</label>
			</div>
			<div>

				<select name="lectureno">
					<%
						if (sdto.getCourse().equalsIgnoreCase("BE")) {
							for (Integer lectureno : FeederUtility.getBELactures()) {
					%>
					<option value="<%=lectureno%>"><%=lectureno%></option>
					<%
						}
						} else if (sdto.getCourse().equalsIgnoreCase("MCA")) {
							for (Integer lectureno : FeederUtility.getMCALactures()) {
					%>
					<option value="<%=lectureno%>"><%=lectureno%></option>
					<%
						}
						}
					%>
				</select> <select name="subject">

					<%
						ArrayList<String> al = new SubjectDao().getAllSubjects(sdto.getSem(), sdto.getBranch());
						if (al != null) {
							for (String subject : al) {
					%>
					<option value="<%=subject%>"><%=subject%></option>
					<%
						}
						}
					%>
				</select>


			</div>
			<div>
				<label>Faculty</label> <label style="margin-left: 28%;">Description</label>
			</div>

			<div>
				<select name="fid">

					<%
						ArrayList<FacultyDTO> flist = new FacultyDAOImp().getAllFaculty();
						if (flist != null) {
							for (FacultyDTO dto : flist) {
					%>
					<option value="<%=dto.getEno()%>"><%=dto.getName()%></option>
					<%
						}
						}
					%>
				</select> <input type="text" name="description" placeholder="description"
					required="required" />
			</div>
			<div>
				<input type="submit" value="Submit" />
			</div>
		</form>
	</div>
	<div style="margin-left: 20%">

		<h3 style="color: red; margin-left: 20%; margin-top: 10px;">Feedback
			Details</h3>
		<table id="customers" style="width: 80%; margin: 10px;">
			<tr>
				<th>S.No.</th>
				<th>Date</th>
				<th>Subject</th>
				<th>Lecture</th>
				<th>Faculty</th>
				<th>Description</th>
			</tr>
			<%
				ArrayList<FeedbackDto> list = new FeedeBackDao().getAllFeedbackByStudents(sdto.getEno());
				if (!list.isEmpty()) {
					int s = 0;
					for (FeedbackDto dto : list) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getDate()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getLectureno()%></td>
				<td><%=dto.getBranch()%></td>
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
