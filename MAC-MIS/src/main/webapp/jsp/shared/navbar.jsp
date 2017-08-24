<!--Navbar Start-->
<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarNavDropdown"
		aria-controls="navbarNavDropdown" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#"><img class="logo"
		src="/assets/img/UW_Logo.png" />MAC - Management Information System</a>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="/home/index">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/home/about">About
					MAC Program</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Internship </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="/job">Jobs</a>
					<!--Show only when user logged in-->
					<%
						if (session.getAttribute("username") != null) {
					%>
					<a class="dropdown-item" href="/company">Company Profiles</a>
					<%
						}
					%>
					<!--Show only to Faculty or Staff-->
					<%
						if (session.getAttribute("username") != null && !session.getAttribute("type").equals(3)) {
					%>
					<a class="dropdown-item" href="/admin/internshipList">Student
						Intership Details</a>
					<%
						}
					%>
				</div></li>
			<!--Display only if Staff or Faculty-->
			<%
				if (session.getAttribute("username") != null && !session.getAttribute("type").equals(3)) {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Administration </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="/admin/stafflist">Staff Members</a>
					<a class="dropdown-item" href="/admin/facultylist">Faculty
						Members</a> <a class="dropdown-item" href="/admin/students">Students</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Reports </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="/admin/reports">Reports</a> <a
						class="dropdown-item" href="/admin/upload">Upload Student Data</a>
				</div></li>
			<%
				}
			%>
		</ul>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<%
			if (session.getAttribute("username") == null) {
		%>
		<li class="nav-item"><a class="nav-link" href="/home/login">Login&nbsp&nbsp<span
				class="fa fa-user-circle" style="display: inline;"></span></a></li>
		<%
			} else {
		%>
		<li class="nav-item"><a class="nav-link" href="/home/logout">Logout&nbsp&nbsp<span
				class="fa fa-user-circle" style="display: inline;"></span></a></li>
		<%
			}
		%>

	</ul>
</nav>
<!--Navbar End-->