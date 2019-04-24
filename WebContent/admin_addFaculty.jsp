
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
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
<script type="text/javascript">
	$(function() {
		$("#doj1").datepicker({
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
		ajaxReq.open("GET", "checkFacultyDuplicate.jsp?data=" + mno, true);
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
		ajaxReq.open("GET", "checkFacultyDuplicate.jsp?data=" + email, true);
		ajaxReq.send(null);
	}
	function takeEmailResponse() {
		if (ajaxReq.readyState === 4) {
			document.getElementById("email1").innerHTML = ajaxReq.responseText;
		}
	}

	function checkDuplicateEmpID() {
		ajaxReq = new XMLHttpRequest();
		var empid = document.getElementById("empid").value;
		ajaxReq.onreadystatechange = takeEmpIDResponse;
		ajaxReq.open("GET", "checkFacultyDuplicate.jsp?data=" + empid, true);
		ajaxReq.send(null);
	}
	function takeEmpIDResponse() {
		if (ajaxReq.readyState === 4) {
			document.getElementById("empid1").innerHTML = ajaxReq.responseText;
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
	<div style="margin: 1%">
		<form action="FacultyController" method="post"
			enctype="multipart/form-data">
			<div>
				<span style="color: red; margin-left: 25%" id="empid1"></span> <span
					style="color: red; margin-left: 24%" id="mno1"></span> <span
					style="color: red; margin-left: 24%" id="email1"></span>
			</div>

			<div>
				<input type="text" placeholder="Name" required="" autofocus=""
					name="name" /> 
					<input type="text" onchange="checkDuplicateEmpID()" placeholder="Employee Id" required="" name="empid" id="empid" /> 
					<input type="text" onchange="checkDuplicateMno()" placeholder="Mobile Number" required="" name="mno" id="mno" /> 
					<input type="email" onchange="checkDuplicateEmail()" placeholder="Email ID" required="" name="email" id="email" />

			</div>
			<div>
				<input type="password" placeholder="Password" required="" name="pwd" />
			<input type="text" placeholder="Select Date Of Birth" required=""
					name="dob" id="dob1" /> <input type="text"
					placeholder="Select Date Of Joining" required="" name="doj"
					id="doj1" /> <select name="bgroup">
					<option value="--------">---select Blood Group---</option>
					<%
						for (String bgroup : FeederUtility.getBloodGroups()) {
					%>
					<option value="<%=bgroup%>"><%=bgroup%></option>
					<%
						}
					%>
				</select>

			</div>
			<div>
				<input type="text" placeholder="State" required="" name="state" />
				<input type="text" placeholder="City" required="" name="city" /> <input
					type="text" placeholder="Address" required="" name="address" /> <input
					type="text" placeholder="Pincode" required="" name="pincode" />

			</div>
			<div>
				<input type="text" placeholder="Father/Husband Name" required=""
					name="gname" /> <input type="text"
					placeholder="Father/Husband Mobile Number" required="" name="gmno" />
				<select name="experience">
					<option value="--------">---select Experience---</option>
					<%
						for (Integer exe : FeederUtility.getExperience()) {
					%>
					<option value="<%=exe%>"><%=exe%></option>
					<%
						}
					%>
				</select> <input type="text" placeholder="Qualification" required=""
					name="qualification" /> <input type="text"
					placeholder="Certification" required="" name="certfication" /> <b>Gender:</b>
				<input style="margin-left: 20px;" type="radio" value="male"
					checked="checked" name="gender" />Male <input type="radio"
					value="female" name="gender" />Female <b style="margin-left: 2%">Hobbies:</b>
				<input style="margin-left: 2%" type="checkbox" checked="checked"
					value="Singing" name="hobby" />Singing <input type="checkbox"
					value="Playing" name="hobby" />Playing <input type="checkbox"
					value="Dancing" name="hobby" />Dancing <input type="file"
					name="photo" /> <input type="submit" value="register" name="opn" />

			</div>
		</form>
	</div>
	<%@include file="menu.html"%>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>