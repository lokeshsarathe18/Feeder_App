<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kulchuri.feeder.utility.FeederUtility"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@page import="com.kulchuri.feeder.student.StudentDAOImp"%>
<%@page import="com.kulchuri.feeder.student.StudentDAO"%>
<%@page import="com.kulchuri.feeder.student.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.html"%>
<%@include file="menu.html"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="student_header.jsp"%>
	<%
		String sno = request.getParameter("sno");
		StudentDTO dto = new StudentDAOImp().getStudentBySno(sno);

		int arr[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
		if (dto != null) {
	%>
	<form action="StudentController" method="post"
		enctype="multipart/form-data">
		<input type="hidden" value="<%=sno%>" name="sno" /><br>
		<table>
			<tr>
				<td><input type="text" value="<%=dto.getName()%>"
					placeholder="Name" required="" autofocus="" name="name" /></td>
				<td><input type="text" value="<%=dto.getEno()%>"
					placeholder="Enrollment" required="" name="eno" /></td>

			</tr>
			<tr>
				<td><input type="date" value="<%=dto.getDob()%>" required=""
					name="dob" /></td>
				<td><input type="text" value="<%=dto.getMno()%>"
					placeholder="Mobile Number" required="" name="mno" /></td>
			</tr>
			<tr>
				<td>
					<%
						if (dto.getGender().equalsIgnoreCase("Male")) {
					%> <input type="radio" checked="checked" value="Male" name="gender" />Male
					<input type="radio" value="Female" name="gender" />Female <%
 	} else {
 %> <input type="radio" value="Male" name="gender" />Male <input
					type="radio" checked="checked" value="Female" name="gender" />Female
					<%
 	}
 %>
				</td>

			</tr>
			<tr>

				<td>
					<%
						String hobby = dto.getHobby();
							if (hobby.contains("Cricket")) {
					%> <input type="checkbox" checked="checked" value="Cricket"
					name="hobby" />Cricket <%
 	} else {
 %> <input type="checkbox" value="Cricket" name="hobby" />Cricket <%
 	}
 		if (hobby.contains("Football")) {
 %> <input type="checkbox" checked="checked" value="Football"
					name="hobby" />Football <%
 	} else {
 %> <input type="checkbox" value="Football" name="hobby" />Football <%
 	}
 		if (hobby.contains("Hockey")) {
 %> <input type="checkbox" checked="checked" value="Hockey" name="hobby" />Hockey
					<%
 	} else {
 %> <input type="checkbox" value="Hockey" name="hobby" />Hockey <%
 	}
 %>
				</td>


			</tr>
			<tr>
				<td><input type="email" value="<%=dto.getEmail()%>"
					placeholder="Email ID" required="" name="email" /></td>
				<td><input type="password" value="<%=dto.getPassword()%>"
					placeholder="Password" required="" name="pwd" /></td>
			</tr>
			<tr>
				<td><input type="text" value="<%=dto.getState()%>"
					placeholder="State" required="" name="state" /></td>
				<td><input type="text" value="<%=dto.getCity()%>"
					placeholder="City" required="" name="city" /></td>
			</tr>
			<tr>
				<td><input type="text" value="<%=dto.getPincode()%>"
					placeholder="Pincode" required="" name="pincode" /></td>
				<td><input type="text" value="<%=dto.getAddress()%>"
					placeholder="Address" required="" name="address" /></td>
			</tr>
			<tr>
				<td><input type="text" value="<%=dto.getFname()%>"
					placeholder="Father Name" required="" name="fname" /></td>
				<td><input type="text" value="<%=dto.getPmno()%>"
					placeholder="Father Mobile Number" required="" name="fmno" /></td>
			</tr>
			<tr>
				<td><input type="text" value="<%=dto.getMname()%>"
					placeholder="Mother Name" required="" name="mname" /></td>
				<td><select name="category">
						<option value="<%=dto.getCategory()%>"><%=dto.getCategory()%></option>

						<%
							for (String category : FeederUtility.getCategories()) {
									if (!dto.getCategory().equalsIgnoreCase(category)) {
						%>
						<option value="<%=category%>"><%=category%></option>
						<%
							}
								}
						%>
				</select></td>
			</tr>
			<tr>
				<td><select name="bgroup">
						<option value="<%=dto.getBgroup()%>"><%=dto.getBgroup()%></option>
						<%
							for (String bgroup : FeederUtility.getBloodGroups()) {
									if (!dto.getBgroup().equalsIgnoreCase(bgroup)) {
						%>
						<option value="<%=bgroup%>"><%=bgroup%></option>
						<%
							}
								}
						%>
				</select></td>




			</tr>
			<tr>
				<td>
					<%
						HashMap<String, String> colleges = FeederUtility.getColleges();
							Set<String> keys = colleges.keySet();
					%> <select name="college">
						<option value="<%=dto.getCollege()%>"><%=dto.getCollege()%>
						</option>
						<%
							for (String key : keys) {
									if (!dto.getCollege().equalsIgnoreCase(key)) {
						%>

						<option value="<%=key%>"><%=colleges.get(key)%></option>
						<%
							}
								}
						%>
				</select>
				</td>
				<td><select name="course">
						<option value="<%=dto.getCourse()%>"><%=dto.getCourse()%></option>
						<%
							for (String course : FeederUtility.getCourses()) {
									if (!dto.getCourse().equalsIgnoreCase(course)) {
						%>
						<option value="<%=course%>"><%=course%></option>
						<%
							}
								}
						%>
				</select></td>
			</tr>
			<tr>
				<td><select name="branch">
						<option value="<%=dto.getBranch()%>"><%=dto.getBranch()%></option>
						<%
							for (String branch : FeederUtility.getBranches()) {
									if (!dto.getBranch().equalsIgnoreCase(branch)) {
						%>
						<option value="<%=branch%>"><%=branch%></option>
						<%
							}
								}
						%>
				</select></td>
				<td><select name="sem">
						<option value="<%=dto.getSem()%>"><%=dto.getSem()%></option>
						<%
							for (int sem : arr) {
									if (sem != dto.getSem()) {
						%>
						<option value="<%=sem%>"><%=sem%></option>
						<%
							}
								}
						%>
				</select></td>
			</tr>
			<tr>
		<td><select name="sec">
						<option value="<%=dto.getSec()%>"><%=dto.getSec()%></option>
						<%
							for (String sec : FeederUtility.getSection()) {
									if (!dto.getSec().equalsIgnoreCase(sec)) {
						%>
						<option value="<%=sec%>"><%=sec%></option>
						<%
							}
								}
						%>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="update" name="opn" /></td>
			</tr>
		</table>





	</form>
	<%
		} else {
	%>
	<h1>Student not available</h1>
	<%
		}
	%>
</body>
</html>
