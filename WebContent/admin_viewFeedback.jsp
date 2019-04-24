
<%@page import="com.kulchuri.feeder.feedback.FeedeBackDao"%>
<%@page import="com.kulchuri.feeder.feedback.FeedbackDto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

</head>
<body>
	<%@include file="admin_header.jsp"%>
	<%
		ArrayList<FeedbackDto> al = new FeedeBackDao().getAllFeedbackByAdmin();
		if (al != null) {
	%>
	<div style="margin: 1%">
	<h3 style="color: red; margin: 3px;">Faculties Feedbacks</h3>
		<table id="customers">
			<tr>
				<th style="text-align: center; font-weight: bold; width: 1%">S.No.</th>
				<th style="text-align: center; font-weight: bold;">Faculty</th>
				<th style="text-align: center; font-weight: bold;">Subject</th>
				<th style="text-align: center; font-weight: bold;">Branch</th>
				<th style="text-align: center; font-weight: bold;">Sem</th>
				
				<th style="text-align: center; font-weight: bold;">Course</th>
				<th style="text-align: center; font-weight: bold;">Date</th>
				<th style="text-align: center; font-weight: bold;">Description</th>
			</tr>
			<%
				int sn = 1;
					for (FeedbackDto sdto : al) {
			%>
			<tr>

				<td><%=sn++%></td>
				<td><%=sdto.getName()%></td>
				<td><%=sdto.getSubject()%></td>
				<td><%=sdto.getBranch()%></td>
				<td><%=sdto.getSem()%></td>
				<td><%=sdto.getCourse()%></td>
				<td><%=sdto.getDate()%></td>
				<td><%=sdto.getDescription() %></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		} else {
	%>
	<h2>There are no any feedback available</h2>
	<%
		}
	%>

	<%@include file="menu.html"%>
</body>

</html>
