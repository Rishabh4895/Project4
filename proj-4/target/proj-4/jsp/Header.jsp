<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.*"%>
<%@page import="in.co.sunrays.proj4.bean.*"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page errorPage="ErrorView.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=ORSView.APP_CONTEXT%>/css/jquery-ui.css"></link>
<script src="<%=ORSView.APP_CONTEXT%>/jq/jquery-1.12.4.js"></script>
<script src="<%=ORSView.APP_CONTEXT%>/jq/jquery-ui.js"></script>
<script>
	var date = new Date();
	var first = date.getFullYear() - 17;
	var last = date.getFullYear() - 40;
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			changeDay : true,
			yearRange : "-57:-18",
			defaultDate : "01/01/1962"

		});
	});

	$(function() {
		$("#datepickerfac").datepicker({
			changeMonth : true,
			changeYear : true,
			changeDay : true,
			yearRange : "-57:+0",
			defaultDate : date.getDay()

		});
	});

	function DisableSunday(date) {
		var day = date.getDay();
		if (day == 0) {
			return [ false ];

		} else {
			return [ true ];
		}
	}

	var dateToday = new Date();
	$(function() {
		$("#datepicker1").datepicker({
			changeMonth : true,
			changeYear : true,
			changeDay : true,
			//showWeekNumbers : true,
			//showMonthAfterYear : true,
			beforeShowDay : DisableSunday,
			yearRange : "0:+10",//"2018:2029",

			//dateFormat : "dd/mm/yy",
			minDate : 0,/* dateToday.getDate() */

		});
	});

	var dateToday = new Date();
	$(function() {
		$("#datepicker2").datepicker({
			changeMonth : true,
			changeYear : true,
			changeDay : true,
			//showWeekNumbers : true,
			//showMonthAfterYear : true,
			beforeShowDay : DisableSunday,
			yearRange : "2018:2029",

		//dateFormat : "dd/mm/yy"
		//minDate : dateToday.getDate()

		});
	});
</script>
<script type="text/javascript">
	function selectall(source) {
		checkboxes = document.getElementsByName('ids');
		for (var i = 0, n = checkboxes.length; i < n; i++) {
			checkboxes[i].checked = source.checked;
		}
	}
	function selectone(so) {
		checkboxes = document.getElementById('mainbox');
		unbox = document.getElementsByName('ids');
		var box = false;
		for (var i = 0, n = unbox.length; i < n; i++) {
			if (unbox[i].checked == true) {
				box = true;
			} else {
				box = false;
				break;
			}
		}
		checkboxes.checked = box;
	}
</script>
<style type="text/css">
select.form-control {
	height: 22px;
	width: 166px;
}

.desc {
	POSITION: ABSOLUTE;
	TOP: 321px;
	LEFT: 804px;
}
</style>


</head>
<body>

	<%
		UserBean userBean = (UserBean) session.getAttribute("user");

		boolean userLoggedIn = userBean != null;

		String welcomeMsg = "";

		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg = "Hi, " + userBean.getFirstName() + "(" + role + ")";
		} else {
			welcomeMsg = "Hi, Guest";
		}
	%>


	<table width="100%" style="margin-top: -1%">
		<tr>
			<td width="90%"><a href="<%=ORSView.WELCOME_CTL%>"><b><font
						size="4">Welcome</font></b></a>&nbsp;||&nbsp; <%
 	if (userLoggedIn) {
 %> <a href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"><b>Logout</b></a>


				<%
					} else {
				%> <a href="<%=ORSView.LOGIN_CTL%>"><b><font size="4">
							Login</font></b></a> <%
 	}
 %>
			<td rowspan="2">
				<h1 align="right">
					<img src="<%=ORSView.APP_CONTEXT%>/jsp/customLogo.png" width="270"
						height="90">
				</h1>
			</td>

		</tr>

		<tr>
			<td>
				<h3>
					<%=welcomeMsg%></h3>
			</td>
		</tr>


		<%
			if (userLoggedIn) {
		%>
		<tr>
			<%
				if (userBean.getRoleId() == RoleBean.ADMIN) {
			%>
			<td colspan="2"><a href="<%=ORSView.MY_PROFILE_CTL%>"><b><font
						size="4">My Profile</font></b></a>| <a
				href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b><font size="4">Change
							Password</font></b></a> | <a href="<%=ORSView.USER_CTL%>"><b><font
						size="4">Add User</font></b></a> | <a href="<%=ORSView.USER_LIST_CTL%>"><b><font
						size="4">User List</font></b></a> | <a href="<%=ORSView.COLLEGE_CTL%>"><b><font
						size="4">Add College</font></b></a> | <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>"><b><font size="4">College
							List</font></b></a> | <a href="<%=ORSView.STUDENT_CTL%>"><b><font
						size="4">Add Student</font></b></a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>"><b><font size="4">Student
							List</font></b></a> | <a href="<%=ORSView.COURSE_CTL%>"><b><font
						size="4">Add Course</font></b></a>| <a href="<%=ORSView.COURSE_LIST_CTL%>"><b><font
						size="4">Course List</font></b></a>| <a href="<%=ORSView.SUBJECT_CTL%>"><b><font
						size="4">Add Subject</font> </b></a>| <a
				href="<%=ORSView.SUBJECT_LIST_CTL%>"><b><font size="4">Subject
							List </font></b></a>| <a href="<%=ORSView.ROLE_CTL%>"><b><font size="4">Add
							Role</font></b></a> | <a href="<%=ORSView.ROLE_LIST_CTL%>"><b><font
						size="4">Role List</font></b></a> | <a href="<%=ORSView.TIMETABLE_CTL%>"><b><font
						size="4">Add Time Table</font> </b></a> | <a
				href="<%=ORSView.TIMETABLE_LIST_CTL%>"><b><font size="4">Time
							Table List</font> </b></a> | <a href="<%=ORSView.FACULTY_CTL%>"><b><font
						size="4">Add Faculty</font></b></a>| <a
				href="<%=ORSView.FACULTY_LIST_CTL%>"><b><font size="4">Faculty
							List </font></b></a>| <a href="<%=ORSView.MARKSHEET_CTL%>"><b><font
						size="4">Add Marksheet</font></b></a> | <a
				href="<%=ORSView.MARKSHEET_LIST_CTL%>"><b><font size="4">Marksheet
							List</font></b></a> | <a href="<%=ORSView.GET_MARKSHEET_CTL%>"><b><font
						size="4">Get Marksheet</font></b></a> | <a
				href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b><font
						size="4">Marksheet Merit List</font></b> </a> | <a
				href="<%=ORSView.JAVA_DOC_VIEW%>" target="blank"><b><font
						size="4">Java Doc</font></b></a> | <%
 	}
 %> <%
 	if (userBean.getRoleId() == RoleBean.STUDENT) {
 %>
			<td colspan="2"><a href="<%=ORSView.MY_PROFILE_CTL%>"><b><font
						size="4">My Profile</font></b></a>| <a
				href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b><font size="4">Change
							Password</font></b></a> | <a href="<%=ORSView.GET_MARKSHEET_CTL%>"><b><font
						size="4">Get Marksheet</font></b></a> | <a
				href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b><font
						size="4">Marksheet Merit List</font></b> </a> | <%
 	}
 %> <%
 	if (userBean.getRoleId() == RoleBean.FACULTY) {
 %>
			<td colspan="2"><a href="<%=ORSView.MY_PROFILE_CTL%>"><b><font
						size="4">My Profile</font></b></a>| <a
				href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b><font size="4">Change
							Password</font></b></a> | <%-- <a href="<%=ORSView.USER_LIST_CTL%>"><b><font
						size="4">User List</font></b></a> | --%> <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>"><b><font size="4">College
							List</font></b></a> | <a href="<%=ORSView.STUDENT_CTL%>"><b><font
						size="4">Add Student</font></b></a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>"><b><font size="4">Student
							List</font></b></a>| <a href="<%=ORSView.COURSE_LIST_CTL%>"><b><font
						size="4">Course List</font></b></a>| <a href="<%=ORSView.SUBJECT_CTL%>"><b><font
						size="4">Add Subject </font></b></a>| <a
				href="<%=ORSView.SUBJECT_LIST_CTL%>"><b><font size="4">Subject
							List</font> </b></a>| <%-- <a href="<%=ORSView.ROLE_LIST_CTL%>"><b><font
						size="4">Role List</font></b></a>|  <a href="<%=ORSView.TIMETABLE_CTL%>"><b><font
						size="4">Add Time Table </font></b></a>| <a
				href="<%=ORSView.TIMETABLE_LIST_CTL%>"><b><font size="4">Time
							Table List</font> </b></a> |
							<%-- <a
				href="<%=ORSView.FACULTY_CTL%>"><b><font
						size="4">Add Faculty </font></b></a>|
							<a href="<%=ORSView.FACULTY_LIST_CTL%>"><b><font
						size="4">Faculty List</font> </b></a>| <%-- <a
				href="<%=ORSView.MARKSHEET_CTL%>"><b><font size="4"></font>Add
						Marksheet</b></a> |  <a href="<%=ORSView.GET_MARKSHEET_CTL%>"><b><font
						size="4">Get Marksheet</font></b></a> |--%> <a
				href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b><font
						size="4">Marksheet Merit List</font></b> </a>| <a
				href="<%=ORSView.GET_MARKSHEET_CTL%>"><b><font size="4">Get
							Marksheet</font></b></a> <%-- <a
				href="<%=ORSView.MARKSHEET_LIST_CTL%>"><b><font size="4"></font>Marksheet
						List</b></a>| --%> <%
 	
 %> <%
 	}
 %> <%
 	if (userBean.getRoleId() == RoleBean.COLLEGE_SCHOOL) {
 %>
			<td colspan="2">
				<%-- <a href="<%=ORSView.MARKSHEET_CTL%>"><b>Add Marksheet</b></a> --%>
				<a href="<%=ORSView.MY_PROFILE_CTL%>"><b><font>My
							Profile</font></b></a>| <a href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b><font>Change
							Password</font></b></a> | <a href="<%=ORSView.MARKSHEET_LIST_CTL%>"><b>Marksheet
						List</b></a> | <%--<a
				href="<%=ORSView.USER_CTL%>"><b>Add User</b></a> | <a
				href="<%=ORSView.USER_LIST_CTL%>"><b>User List</b></a> | <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>"><b>College List</b></a> | --%>
				<a href="<%=ORSView.STUDENT_CTL%>"><b>Add Student</b></a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>"><b>Student List</b></a> | <%-- <a
				href="<%=ORSView.ROLE_CTL%>"><b>Add Role</b></a> | <a
				href="<%=ORSView.ROLE_LIST_CTL%>"><b>Role List</b></a> | --%> <a
				href="<%=ORSView.FACULTY_CTL%>"><b>Add Faculty</b></a>| <a
				href="<%=ORSView.FACULTY_LIST_CTL%>"><b>Faculty List </b></a>| <a
				href="<%=ORSView.COURSE_CTL%>"><b>Add Course</b></a>| <a
				href="<%=ORSView.COURSE_LIST_CTL%>"><b>Course List</b></a>| <a
				href="<%=ORSView.SUBJECT_CTL%>"><b>Add Subject </b></a>| <a
				href="<%=ORSView.SUBJECT_LIST_CTL%>"><b>Subject List </b></a>| <a
				href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b><font>Marksheet
							Merit List</font></b> </a> | <a href="<%=ORSView.TIMETABLE_CTL%>"><b>Add
						Time Table </b></a>| <a href="<%=ORSView.TIMETABLE_LIST_CTL%>"><b>Time
						table List </b></a> <%
 	}
 %> <%
 	if (userBean.getRoleId() == RoleBean.KIOSK) {
 %>
			
			<td colspan="2"><a href="<%=ORSView.GET_MARKSHEET_CTL%>"><b><font
						size="4">Get Marksheet</font></b></a> | <a
				href="<%=ORSView.MY_PROFILE_CTL%>"><b><font size="4">My
							Profile</font></b></a>| <a href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b><font
						size="4">Change Password</font></b></a> | <a
				href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b><font
						size="4">Marksheet Merit List</font></b> </a> | <%
 	}
 %></td>


		</tr>
		<%
			}
		%>
	</table>
	<hr>

</body>
</html>