
<%@page import="in.co.sunrays.proj4.controller.MarksheetCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp"%>
<html>
<body>

	<form action="<%=ORSView.MARKSHEET_CTL%>" method="POST">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("studentList");
		%>


		<%
			if (bean.getId() > 0) {
		%>
		<h1 align="center">Update Marksheet</h1>
		<%
			} else {
		%>
		<h1 align="center">Add Marksheet</h1>
		<%
			}
		%>
		<H2 align="center">
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
			</font>
		</H2>
		<H2 align="center">
			<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
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


		<table style="margin-left: 40%;">
			<tr>

				<td><b>Rollno<font color="red">*</font></b></td>
				<td><input type="text" name="rollNo"
					value="<%=DataUtility.getStringData(bean.getRollNo())%>"
					<%=(bean.getId() > 0) ? "readonly" : ""%>
					placeholder="Enter Roll Number Here"> <font color="red">
						<%=ServletUtility.getErrorMessage("rollNo", request)%></font></td>
			</tr>
			<tr>

				<td><b>Name<font color="red">*</font></b></td>
				<td><%=HTMLUtility.getList("studentId", String.valueOf(bean.getStudentId()), l)%><font
					color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font></td>
			</tr>
			<tr>

				<td><b>Physics<font color="red">*</font></b></td>
				<td><input type="text" name="physics"
					value="<%=DataUtility.getStringData(bean.getPhysics()).equals("0") ? ""
					: DataUtility.getStringData(bean.getPhysics())%>"
					placeholder="Enter Physics Marks Here"><font color="red">
						<%=ServletUtility.getErrorMessage("physics", request)%></font></td>
			</tr>
			<tr>

				<td><b>Chemistry<font color="red">*</font></b></td>
				<td><input type="text" name="chemistry"
					value="<%=DataUtility.getStringData(bean.getChemistry()).equals("0") ? ""
					: DataUtility.getStringData(bean.getChemistry())%>"
					placeholder="Enter Chemistry Marks Here"><font color="red">
						<%=ServletUtility.getErrorMessage("chemistry", request)%></font></td>
			</tr>
			<tr>

				<td><b>Maths<font color="red">*</font></b></td>
				<td><input type="text" name="maths"
					value="<%=DataUtility.getStringData(bean.getMaths()).equals("0") ? ""
					: DataUtility.getStringData(bean.getMaths())%>"
					placeholder="Enter Maths Marks Here"><font color="red">
						<%=ServletUtility.getErrorMessage("maths", request)%></font></td>

			</tr>
			<tr>
				<th></th>
				<%
					if (bean.getId() > 0) {
				%>
				<td><input type="submit" name="operation"
					value="<%=MarksheetCtl.OP_UPDATE%>">&emsp; <input
					type="submit" name="operation" value="<%=MarksheetCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=MarksheetCtl.OP_SAVE%>">&emsp; <input
					type="submit" name="operation" value="<%=MarksheetCtl.OP_RESET%>"></td>
				<%
					}
				%>
			</tr>
		</table>
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>