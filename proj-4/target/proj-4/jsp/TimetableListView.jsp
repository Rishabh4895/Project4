<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.TimetableListCtl"%>
<%@page import="java.util.*"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</style>
</head>
<body>

	<%@include file="Header.jsp"%>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.TimetableBean"
		scope="request"></jsp:useBean>
	<jsp:useBean id="model"
		class="in.co.sunrays.proj4.model.TimetableModel" scope="request"></jsp:useBean>
	<center>
		<form action="<%=ORSView.TIMETABLE_LIST_CTL%>" method="post">

			<h1>Timetable List</h1>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				List list = ServletUtility.getList(request);
				if (list.size() == 0 || list == null) {
			%>
			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<%
				if ("".equals(ServletUtility.getSuccessMessage(request))) {
			%>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<%
				}
			%>
			<br> <br> <input type="submit" name="operation"
				value="<%=TimetableListCtl.OP_BACK%>">
			<%
				} else {
					List courseList = (List) request.getAttribute("courseList");
					List subjectList = (List) request.getAttribute("subjectList");
					HashMap map = new HashMap();
					map.put("1", "1st Semester");
					map.put("2", "2nd Semester");
					map.put("3", "3rd Semester");
					map.put("4", "4th Semester");
					map.put("5", "5th Semester");
					map.put("6", "6th Semester");
			%><table width="100%">
				<tr>
					<td align="center"><label>Course: </label><%=HTMLUtility.getList("courseId",
						String.valueOf(ServletUtility.getParameter("courseId", request)), courseList)%>
						&emsp;<label>Subject: </label><%=HTMLUtility.getList("subjectId",
						String.valueOf(ServletUtility.getParameter("subjectId", request)), subjectList)%>
						&emsp;<label>Semester: </label><%=HTMLUtility.getList("semester",
						String.valueOf(ServletUtility.getParameter("semester", request)), map, true)%>
						&emsp;<label>Exam Date: </label><input type="text"
						id="datepicker2" readonly="readonly" placeholder="Click Here"
						name="examDate"
						value="<%=ServletUtility.getParameter("examDate", request)%>">
						&emsp;<input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" name="operation"
						value="<%=TimetableListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b><font color="red" size="5px"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b><font color="green" size="5px"><%=ServletUtility.getSuccessMessage(request)%></font></b>

			<br>
			<table border="4" width="100%">
				<tr>
					<th style="width: 7%;"><input type="checkbox"
						onchange="selectall(this)" id="mainbox">SelectAll</th>
					<th style="width: 3%;">S.No</th>
					<th style="width: 25%;">Subject</th>
					<th style="width: 15%;">Course</th>
					<th style="width: 20%;">ExamTime</th>
					<th style="width: 15%;">ExamDate</th>
					<th style="width: 8%;">Semester</th>
					<th style="width: 8%;">Edit</th>
				</tr>

				<%
					Iterator<TimetableBean> it = list.iterator();
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids"
						onclick="selectone(this)" value="<%=bean.getId()%>"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getSubjectName()%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><%=bean.getExamTime()%></td>
					<td align="center"><%=bean.getExamDate()%></td>
					<td align="center"><%=bean.getSemester()%></td>
					<td align="center"><a href="TimetableCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>


			<table style="width: 100%">
				<tr>
					<%
						if (pageNo == 1) {
					%>
					<td><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=TimetableListCtl.OP_NEXT%>"></td>
					<%
						}
					%>






				</tr>

			</table>








			<%
				}
			%>

		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>