<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.controller.TimetableCtl"%>
<%@page import="in.co.sunrays.proj4.util.*"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	
	<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.TimetableBean"
			scope="request">
		</jsp:useBean>
		<%
			List courseList = (List) request.getAttribute("courseList");
			List subjectList = (List) request.getAttribute("subjectList");
		%>

		<%
			if (bean.getId() > 0) {
		%>
		<h1 align="center">Update Timetable</h1>
		<%
			} else {
		%>
		<h1 align="center">Add Timetable</h1>
		<%
			}
		%>
		<h2 align="center">
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
		</h2>
		<h2 align="center">

			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h2>
		<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
			type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy"
			value="<%=bean.getModifiedBy()%>"> <input type="hidden"
			name="createdDatetime"
			value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime"
			value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

		<table style="margin-left: 40%;">
			<tr>

				<td><b>Course<font color="red">*</font></b></td>
				<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), courseList)%><font
					color="red"><%=ServletUtility.getErrorMessage("courseName", request)%></font></td>
			</tr>
			<tr>

				<td><b>Subject<font color="red">*</font></b></td>
				<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubjectId()), subjectList)%><font
					color="red"><%=ServletUtility.getErrorMessage("subjectName", request)%></font></td>
			</tr>
			<tr>

				<td><b>ExamTime<font color="red">*</font></b> <%
 	HashMap map1 = new HashMap();
 	map1.put("07:00AM to 10:00AM", "07:00AM to 10:00AM");
 	map1.put("10:00AM to 01:00PM", "10:00AM to 01:00PM");
 	map1.put("01:00AM to 04:00AM", "01:00AM to 04:00AM");
 	map1.put("08:00AM to 11:00AM", "08:00AM to 11:00AM");
 	map1.put("11:00AM to 02:00PM", "11:00AM to 02:00PM");
 	map1.put("02:00PM to 05:00PM", "02:00PM to 05:00PM");
 %>
				<td><%=HTMLUtility.getList("examTime", bean.getExamTime(), map1, true)%>
					<font color="red"><%=ServletUtility.getErrorMessage("examTime", request)%></font></td>
			</tr>
			<tr>

				<td><b>Semester<font color="red">*</font></b></td>
				<%
					HashMap map = new HashMap();
					map.put("1", "1st Semester");
					map.put("2", "2nd Semester");
					map.put("3", "3rd Semester");
					map.put("4", "4th Semester");
					map.put("5", "5th Semester");
					map.put("6", "6th Semester");
				%>
				<td><%=HTMLUtility.getList("semester", String.valueOf(bean.getSemester()), map, true)%>
					<font color="red"><%=ServletUtility.getErrorMessage("semester", request)%></font></td>
			</tr>
			<tr>


			</tr>
			<td><b>ExamDate<font color="red">*</font></b></td>
			<td><input type="text" id="datepicker1" name="examDate"
				readonly="readonly" placeholder="Click Here"
				value="<%=DataUtility.getDateString(bean.getExamDate())%>"><font
				color="red"><%=ServletUtility.getErrorMessage("examDate", request)%></font>
			</td>

			<tr>



				<th></th>
				<%
					if (bean.getId() > 0) {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=TimetableCtl.OP_UPDATE%>">&emsp; <input
					type="submit" name="operation" value="<%=TimetableCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=TimetableCtl.OP_SAVE%>">&emsp; <input
					type="submit" name="operation" value="<%=TimetableCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>


		</table>
	</form>
	<%@include file="Footer.jsp" %>

</body>
</html>