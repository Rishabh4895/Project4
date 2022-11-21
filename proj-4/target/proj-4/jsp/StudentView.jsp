<%@page import="in.co.sunrays.proj4.controller.StudentCtl"%>
<%@page import="java.util.*"%>
<%@page import="in.co.sunrays.proj4.util.*"%>
<%@page import="in.co.sunrays.proj4.*"%>
<%@page errorPage="ErrorView.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List l = (List) request.getAttribute("collegeList");
	%>

	<form action="<%=ORSView.STUDENT_CTL%>" method="post">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.StudentBean"
			scope="request"></jsp:useBean>

		<%
			if (bean.getId() > 0) {
		%>
		<h1 align="center">Update Student</h1>
		<%
			} else {
		%>
		<h1 align="center">Add Student</h1>
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

		<table style="margin-left: 38%;">
			<tr>

				<td><b>First Name<font color="red">*</font></b></td>
				<td><input type="text" name="firstName"
					value="<%=DataUtility.getStringData(bean.getFirstName())%>"
					placeholder="Enter First Name Here"><font color="red">
						<%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
			</tr>
			<tr>

				<td><b>Last Name<font color="red">*</font></b></td>
				<td><input type="text" name="lastName"
					value="<%=DataUtility.getStringData(bean.getLastName())%>"
					placeholder="Enter Last Name Here"><font color="red">
						<%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
			</tr>
			<tr>

				<td><b>EmailId<font color="red">*</font></b></td>
				<td><input type="text" name="email"
					value="<%=DataUtility.getStringData(bean.getEmail())%>"
					<%=(bean.getId() > 0) ? "readonly" : ""%>
					placeholder="Enter Email Id Here"><font color="red">
						<%=ServletUtility.getErrorMessage("email", request)%></font></td>
			</tr>
			<tr>

				<td><b>College<font color="red">*</font></b></td>
				<td><%=HTMLUtility.getList("collegeId", String.valueOf(bean.getCollegeId()), l)%><font
					color="red"> <%=ServletUtility.getErrorMessage("collegeId", request)%></font></td>
			</tr>
			<tr>

				<td><b>Date Of Birth<font color="red">*</font></b></td>
				<td><input type="text" name="dob" readonly="readonly"
					id="datepicker"
					value="<%=DataUtility.getDateString(bean.getDob())%>"
					placeholder="Click Here"><font color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font></td>
			</tr>
			<tr>

				<td><b>Mobile No<font color="red">*</font></b></td>
				<td><input type="text" name="mobileNo" maxlength="10"
					value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
					placeholder="Enter PhoneNo Here"><font color="red">
						<%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
			</tr>

			<tr>
				<th></th>
				<%
					if (bean.getId() > 0) {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=StudentCtl.OP_UPDATE%>">&emsp; <input
					type="submit" name="operation" value="<%=StudentCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=StudentCtl.OP_SAVE%>">&emsp; <input type="submit"
					name="operation" value="<%=StudentCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>

		</table>
	</form>

	<%@include file="Footer.jsp"%>

</body>
</html>