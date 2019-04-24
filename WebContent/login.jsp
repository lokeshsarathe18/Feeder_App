<%-- 
    Document   : login
    Created on : Mar 12, 2018, 9:22:35 AM
    Author     : win7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.html"%>
<style>
input[type=text] {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=password] {
	width: 50%;
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
	<%@include file="main_header.html"%>
	<div style="margin-top: 6%; margin-left: 30%">
		<form action="LogingController" method="post">
			<div>
				<input type="text" autocomplete="off" name="uname"
					placeholder="Enter Username" required="" />
			</div>
			<div>
				<input type="password" name="pwd" placeholder="Enter Password"
					required="">
			</div>
			<div>
				<input type="submit" value="Login" />
			</div>
		</form>

	</div>
</body>
</html>
