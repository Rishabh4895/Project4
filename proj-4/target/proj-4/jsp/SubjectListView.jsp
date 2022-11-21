<%@page import="in.co.sunrays.proj4.controller.SubjectCtl"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.StudentCtl"%>
<%-- <%@page import="in.co.sunrays.proj4.model.AppRole"%> --%>
<%@page import="in.co.sunrays.proj4.controller.SubjectListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>

<html>
<body>

	<jsp:useBean id="model" scope="request"
		class="in.co.sunrays.proj4.model.SubjectModel"></jsp:useBean>
	<jsp:useBean id="bean" scope="request"
		class="in.co.sunrays.proj4.bean.SubjectBean"></jsp:useBean>

	<%@include file="Header.jsp"%>

	<center>

		<h1>Subject List</h1>

		<form action="<%=ORSView.SUBJECT_LIST_CTL%>" method="post">
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				List list = ServletUtility.getList(request);
				if (list.size() == 0 || list == null) {
			%><b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<%
				if ("".equals(ServletUtility.getSuccessMessage(request))) {
			%>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<%
				}
			%>
			<br> <br> <input type="submit" name="operation"
				value="<%=SubjectListCtl.OP_BACK%>">
			<%-- <h2>
				<button style="width: 80px; height: 30px;">
					<a style="text-decoration:none; cursor:default;" href="<%=ORSView.USER_LIST_CTL%>"><%=UserListCtl.OP_BACK%></a>
				</button>
			</h2>  --%>
			<%
				} else {
			%>

			<table width="100%">
				<tr>
					<td align="center"><label>SubjectName :</label> <input
						type="text" name="name"
						value="<%=ServletUtility.getParameter("name", request)%>"
						placeholder="Enter Subject Name Here"> &emsp;<label>Course:</label>
						<%
							List list1 = (List) request.getAttribute("courseList");
						%> <%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), list1)%>
						&emsp; <input type="submit" name="operation"
						value="<%=SubjectListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" name="operation"
						value="<%=SubjectListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%">
				<tr>
					<th style="width: 5%;"><input type="checkbox" id="mainbox"
						onchange="selectall(this)">SelectAll</th>
					<th style="width: 3%;">S.No.</th>
					<th style="width: 10%;">Name</th>
					<th style="width: 20%;">Description</th>
					<th style="width: 10%;">Course</th>
					<th style="width: 5%;">Edit</th>
				</tr>


				<%
					Iterator<SubjectBean> it = list.iterator();
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>

					<td align="center"><input type="checkbox" name="ids"
						value="<%=bean.getId()%>" onclick="selectone(this)"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getName()%></td>
					<td align="center"><%=bean.getDescription()%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><a href="SubjectCtl?id=<%=bean.getId()%>">Edit</a></td>

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
						value="<%=SubjectListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=SubjectListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=SubjectCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=SubjectListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=SubjectListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=SubjectListCtl.OP_NEXT%>"></td>
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