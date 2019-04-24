
<%@page import="com.kulchuri.feeder.login.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<style type="text/css">
input[type=password] {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: pink;
}
</style>
<script type="text/javascript">
	function changepassword() {
		var npwd = document.getElementById("npwd").value;
		var cpwd = document.getElementById("cpwd").value;
		var link = document.getElementById('btt');
		if (npwd != cpwd) {
			alert('Your password should be the same');
			link.style.display = 'none';

		} else {
			link.style.display = 'block';
		}
	}
</script>
</head>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
%>
<jsp:useBean id="ldto" class="com.kulchuri.feeder.login.LoginDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto" />
<%
	if (new LoginDAO().changePassword(ldto)) {
			response.sendRedirect("logout.jsp");
		} else {
			out.print("alert(Password Change Failed);");
		}
	}
%>
<body>
	<%@include file="student_header.jsp"%>

	<div class="container" style="margin-left: 30%; margin-top: 5%">
		<h3 style="color: red; padding-left: 10%; font-family: cursive;">Change
			Your Password</h3>
		<form action="student_changePwd.jsp" method="post">
			<div class="row">
				<div class="#">
					<label for="fname">New Password</label>
				</div>
				<div class="col-75">
					<input type="hidden" value="<%=sdto.getEno()%>" name="uname" /> <input
						type="password" id="npwd" name="pwd" required="" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Confirm Password</label>
				</div>
				<div class="col-75">
					<input type="password" id="cpwd" onchange="changepassword();"
						name="lastname" required="" />
				</div>
			</div>
			<div class="row" id="btt">
				<div class="col-25">
					<label for="lname"></label>
				</div>
				<div class="col-75">
					<input type="submit" style="color: red" value="Submit" />
				</div>
			</div>
			<%@include file="menu.html"%>
</body>
</html>
