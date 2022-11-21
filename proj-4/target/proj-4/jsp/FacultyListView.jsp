<%@page import="in.co.sunrays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.FacultyListCtl"%>
<%@page import="java.util.*"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp"%>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.FacultyBean"
		scope="request"></jsp:useBean>

	<jsp:useBean id="model" class="in.co.sunrays.proj4.model.FacultyModel"
		scope="request"></jsp:useBean>
	<input type="hidden" name="id" value="<%=bean.getId()%>">
	<center>
		<h1>Faculty List</h1>

		<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">
			<%
				List list1 = (List) request.getAttribute("courseList");
				List clgList = (List) request.getAttribute("collegeList");
			%>
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				List list = ServletUtility.getList(request);
				if (list == null || list.size() == 0) {
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
				value="<%=FacultyListCtl.OP_BACK%>">
			<%
				} else {
			%>

			<table width="100%">
				<tr>
					<td align="center"><label>FirstName :</label> <input
						type="text" name="firstName"
						value="<%=ServletUtility.getParameter("firstName", request)%>"
						placeholder="Enter First Name Here"> &emsp; <label>LoginId:</label>
						<input type="text" name="login"
						value="<%=ServletUtility.getParameter("login", request)%>"
						placeholder="Enter Login Id Here">&emsp; <label>College:
					</label><%=HTMLUtility.getList("collegeId",
						String.valueOf(ServletUtility.getParameter("collegeId", request)), clgList)%>&emsp;
						<label>Course: </label><%=HTMLUtility.getList("courseId",
						String.valueOf(ServletUtility.getParameter("courseId", request)), list1)%>
						&emsp;<input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_SEARCH%>">&emsp;<input
						type="submit" name="operation"
						value="<%=FacultyListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b><font color="red" size="5px"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b><font color="green" size="5px"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%"">
				<tr>
					<th style="width: 7%;"><input type="checkbox"
						onchange="selectall(this)" id="mainbox">SelectAll</th>
					<th style="width: 3%;">S.No</th>
					<th style="width: 7%;">FirstName</th>
					<th style="width: 7%;">LastName</th>
					<th style="width: 10%;">LoginId</th>
					<th style="width: 4%;">Gender</th>
					<th style="width: 7%;">PhoneNo</th>
					<th style="width: 4%;">Qualification</th>
					<th style="width: 7%;">CollegeName</th>
					<th style="width: 7%;">CourseName</th>
					<th style="width: 12%;">SubjectName</th>
					<th style="width: 7%;">DOJ</th>
					<th style="width: 4%;">Edit</th>
				</tr>

				<%
					Iterator<FacultyBean> it = list.iterator();
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids"
						onclick="selectone(this)" value="<%=bean.getId()%>"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getEmailId()%></td>
					<td align="center"><%=bean.getGender()%></td>
					<td align="center"><%=bean.getMobileNo()%></td>
					<td align="center"><%=bean.getQualification()%></td>
					<td align="center"><%=bean.getCollegeName()%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><%=bean.getSubject()%></td>
					<td align="center"><%=bean.getDOB()%></td>
					<td align="center"><a href="FacultyCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<%
						if (pageNo == 1) {
					%>
					<td><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (model.nextPk() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_NEXT%>"></td>
					<%
						}
					%>


				</tr>
			</table>

			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">

		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>