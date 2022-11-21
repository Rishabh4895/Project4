<%@page import="in.co.sunrays.proj4.controller.CourseCtl"%>
<%@page import="in.co.sunrays.proj4.controller.CourseCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.*"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<form action="<%=ORSView.COURSE_CTL%>" method="post">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CourseBean"
			scope="request"></jsp:useBean>

		
			<%
				if (bean.getId() > 0) {
			%>

			<h1 align="center">Update Course</h1>

			<%
				} else {
			%>
			<h1 align="center">Add Course</h1>

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

					<td><b>CourseName<font color="red">*</font></b></td>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>" placeholder="Enter Course Name Here"><font
						color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
				</tr>

				<tr>

					<td><b>Duration<font color="red">*</font></b></td>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("1 year", "1 year");
							map.put("2 year", "2 year");
							map.put("3 year", "3 year");
							map.put("4 year", "4 year");
							map.put("5 year", "5 year");
							map.put("6 year", "6 year");

							
						%> <%=HTMLUtility.getList("duration", bean.getDuration(), map,true)%>
						<font
						color="red"> <%=ServletUtility.getErrorMessage("duration", request)%></font>
					</td>
				</tr>
				<tr>

					<td><b>Description<font color="red">*</font></b></td>
					<td><textarea name="description" placeholder="Enter Address Here"
						rows="4" cols="22"><%=DataUtility.getStringData(bean.getDescription())%></textarea><font
					color="red" class="desc"> <%=ServletUtility.getErrorMessage("description", request)%></font>
				</td>
				</tr>
				<tr>
					<th></th>
					<%
						if (bean.getId() > 0) {
					%>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=CourseCtl.OP_UPDATE%>">&emsp; <input
						type="submit" name="operation" value="<%=CourseCtl.OP_CANCEL%>"></td>
					<%
						} else {
					%>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=CourseCtl.OP_SAVE%>">&emsp;<input type="submit"
						name="operation" value="<%=CourseCtl.OP_RESET%>"></td>
					<%
						}
					%>
				</tr>
			</table>
	</form>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>