<%@page import="com.kulchuri.feeder.faculty.FacultyDTO"%>
<%
	FacultyDTO fdto = (FacultyDTO) session.getAttribute("fdto");
	if (fdto == null) {
%>
<<jsp:forward page="login.jsp"></jsp:forward>
<%
	}
%>


<div class="header">
	<div class="agileits_top_menu">
		<div class="w3l_header_left">
			<ul>
				<li><i class="fa fa-phone" aria-hidden="true"></i>0755-4904949</li>
				<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a
					href="mailto:info@example.com">rajeshtct96@gmail.com</a></li>
			</ul>
		</div>
		<div class="w3l_header_right">
			<div class="w3ls-social-icons text-left">
				<span
					style="margin: 2px; color: white; font-size: 20px; font-weight: bold;"><%=fdto.getName()%></span>
				<a class="linkedin" href="faculty_changePwd.jsp"><span
					style="margin: 2px; color: white; font-size: 20px; font-weight: bold;">Change
						Password</span></a> <a class="linkedin" href="logout.jsp"><i
					class="fa fa-sign-out"></i></a>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="content white agile-info">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="faculty_home.jsp">
						<h1>
							<span class="fa fa-book" aria-hidden="true"></span> Feeder <label>Application</label>
						</h1>
					</a>
				</div>
				<!--/.navbar-header-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
							<li class="active"><a href="faculty_home.jsp"
								class="effect-3">Home</a></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle effect-3" data-toggle="dropdown">Attendance
									<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="faculty_takeAttendance.jsp">Take</a></li>
									<li><a href="faculty_viewAttendance.jsp">View</a></li>
								</ul></li>
							<li><a href="faculty_viewFeedback.jsp" class="effect-3">Feedback</a></li>
							<li><a href="faculty_attendanceReport.jsp" class="effect-3">Report</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</nav>
	</div>
</div>