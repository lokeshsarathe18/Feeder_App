
<%
	String uname = (String) session.getAttribute("uname");
	if (uname == null) {
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
				<a class="linkedin" href="admin_changePwd.jsp"><span
					style="color: white; margin: 10px; font-size: 20px; font-weight: bold;">Change
						Password</span> </a> <a class="linkedin" href="logout.jsp"><i
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
					<a class="navbar-brand" href="admin_home.jsp">
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
							<li class="active"><a href="admin_home.jsp" class="effect-3">Home</a></li>
							<li><a href="admin_subjects.jsp" class="effect-3">Subject</a></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle effect-3" data-toggle="dropdown">Student
									<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="admin_addStudent.jsp">Add</a></li>
									<li><a href="admin_viewAllStudents.jsp">View</a></li>
								</ul></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle effect-3" data-toggle="dropdown">Faculty
									<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="admin_addFaculty.jsp">Add</a></li>
									<li><a href="admin_viewAllFaculty.jsp">View</a></li>
								</ul>
								</li>
								<li class="dropdown"><a href="#"
								class="dropdown-toggle effect-3" data-toggle="dropdown">Attendance
									<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									
									<li><a href="admin_attendanceByStudent.jsp">Attendance By Student</a></li>
									<li><a href="admin_attendanceByFaculty.jsp">Attendance By Faculty</a></li>
								</ul>
								</li>
							<li><a href="admin_viewFeedback.jsp" class="effect-3">Feedback</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</nav>
	</div>
</div>