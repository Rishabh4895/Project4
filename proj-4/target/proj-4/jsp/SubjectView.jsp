<%@page import="in.co.sunrays.proj4.model.SubjectModel"%>
<%@page import="in.co.sunrays.proj4.controller.SubjectCtl"%>
<%@page import="java.util.*"%>
<%@page import="in.co.sunrays.proj4.util.*"%>
<%@page import="in.co.sunrays.proj4.exception.*"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<form action="<%=ORSView.SUBJECT_CTL%>" method="post">

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.SubjectBean"
			scope="request"></jsp:useBean>
		<%
			List list = (List) request.getAttribute("courseList");
		%>
		<%
			if (bean.getId() > 0) {
		%>
		<h1 align="center">Update Subject</h1>
		<%
			} else {
		%>
		<h1 align="center">Add Subject</h1>
		<%
			}
		%>


		<H2 align="center">
			<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
			</font>
		</H2>
		<H2 align="center">
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
			</font>
		</H2>

		<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
			type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy"
			value="<%=bean.getModifiedBy()%>"> <input type="hidden"
			name="createdDatetime"
			value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime"
			value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">



		<table style="margin-left: 38%;">

			<tr>
				<td><b>Subject Name<font color="red">*</font></b></td>
				<td><input type="text" name="name"
					value="<%=DataUtility.getStringData(bean.getName())%>"
					placeholder="Enter Subject Name Here"><font color="red">
						<%=ServletUtility.getErrorMessage("name", request)%></font></td>
			</tr>


			<tr>
				<td><b>CourseName<font color="red">*</font></b></td>

				<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), list)%><font
					color="red"> <%=ServletUtility.getErrorMessage("courseName", request)%></font></td>
			</tr>

			<%-- <tr>
			<th>Course:</th>
			<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), list)%><font
                        color="red"> <%=ServletUtility.getErrorMessage("courseName", request)%></font></td></td>
		</tr> --%>
			<tr>
				<td><b>Description<font color="red">*</font></b></td>
				<td><textarea rows="4" cols="22" name="description"
						placeholder="Enter Description Here"><%=DataUtility.getStringData(bean.getDescription())%></textarea>
				<font color="red" class="desc" style="left:808px">&nbsp;<%=ServletUtility.getErrorMessage("description", request)%></font>
				</td>
			</tr>


			<tr>
				<td></td>
				<%
					if (bean.getId() > 0) {
				%>
				<td>&emsp;<input type="submit" name="operation"
					value="<%=SubjectCtl.OP_UPDATE%>"> &emsp; <input
					type="submit" name="operation" value="<%=SubjectCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=SubjectCtl.OP_SAVE%>">&emsp; <input type="submit"
					name="operation" value="<%=SubjectCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>
		</table>



	</form>

<%@include file="Footer.jsp" %>
</body>
</html>
