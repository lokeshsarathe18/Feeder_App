
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$("#dob1").datepicker({
			dateFormat : 'mm/dd/yy',
			changeMonth : true,
			changeYear : true,
			yearRange : '-20y:c+nn',
			maxDate : '-1d'
		});
	});
</script>
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
<style>
input[type=email] {
	width: 24%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
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

input[type=password] {
	width: 24%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=date] {
	width: 24%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 2px;
	box-sizing: border-box;
}

input[type=file] {
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

</head>
<body>
	<%@include file="admin_header.jsp"%>
	<div style="margin-left: 1%">
		<form action="StudentController" method="post"
			enctype="multipart/form-data">
			<div>
				<input type="text" placeholder="Name" required="" autofocus=""
					name="name" /> <input type="text" onchange="checkDuplicateEno()"
					id="eno" placeholder="Enrollment" required="" name="eno" /> <input
					type="text" onchange="checkDuplicateMno()" id="mno"
					placeholder="Mobile Number" required="" name="mno" /> <input
					type="email" onchange="checkDuplicateEmail()" id="email"
					placeholder="Email ID" required="" name="email" />

			</div>
			<div>

				<input type="password" placeholder="Password" required="" name="pwd" />
				<input type="text" placeholder="Select Date Of Birth" required=""
					name="dob" id="dob1" /> <label>Gender</label> <input
					checked="checked" type="radio" value="male" name="gender" />Male <input
					type="radio" value="female" name="gender" />Female <label
					style="margin-left: 10%">Hobbies</label> <input type="checkbox"
					checked="checked" value="Cricket" name="hobby" />Cricket <input
					type="checkbox" value="Hockey" name="hobby" />Hockey <input
					type="checkbox" value="Football" name="hobby" />Football


			</div>

			<div>
				<input type="text" placeholder="State" required="" name="state" />
				<input type="text" placeholder="City" required="" name="city" /> <input
					type="text" placeholder="Address" required="" name="address" /> <input
					type="text" placeholder="Pincode" required="" name="pincode" />
			</div>
			<div>

				<input type="text" placeholder="Father Name" required=""
					name="fname" /> <input type="text" placeholder="Mother Name"
					required="" name="mname" /> <input type="text"
					placeholder="Father Mobile Number" required="" name="fmno" /> <select
					name="category">
					<option value="--------">---select Category---</option>

					<%
						for (String category : FeederUtility.getCategories()) {
					%>
					<option value="<%=category%>"><%=category%></option>
					<%
						}
					%>
				</select>
			</div>
			<div>

				<%
					HashMap<String, String> colleges = FeederUtility.getColleges();
					Set<String> keys = colleges.keySet();
				%>
				<select name="college">
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
				</select>
			</div>
			<div>
				<select name="sec">
					<option value="--------">---select Section---</option>

					<%
						for (String Section : FeederUtility.getSection()) {
					%>
					<option value="<%=Section%>"><%=Section%></option>
					<%
						}
					%>
				</select> <select name="bgroup">
					<option value="--------">---select Blood Group---</option>
					<%
						for (String bgroup : FeederUtility.getBloodGroups()) {
					%>
					<option value="<%=bgroup%>"><%=bgroup%></option>
					<%
						}
					%>
				</select> <label>Photo</label> <input type="file" name="photo" /> <input
					style="color: white; font-size: 20px" type="submit"
					value="Register" name="opn" />
			</div>
		</form>
	</div>
	<%@include file="menu.html"%>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>
