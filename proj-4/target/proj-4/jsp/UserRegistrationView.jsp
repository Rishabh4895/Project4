<%@page import="in.co.sunrays.proj4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp"%>
<html>
<head>
</head>
<body>
	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

		<%@ include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>


		<h1 align="center">User Registration</h1>

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
				<td><b>First Name<font color="red">*</font></b></td>
				<td><input type="text" name="firstName"
					value="<%=DataUtility.getStringData(bean.getFirstName())%>"
					placeholder="Enter First Name Here"><font color="red">
						<%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
			</tr>

			<tr></tr>
			<tr></tr>
			<tr>

				<td><b>Last Name<font color="red">*</font></b></td>
				<td><input type="text" name="lastName"
					value="<%=DataUtility.getStringData(bean.getLastName())%>"
					placeholder="Enter Last Name Here"><font color="red">
						<%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
			</tr>
			<tr></tr>
			<tr></tr>

			<tr>

				<td><b>LoginId<font color="red">*</font></b></td>
				<td><input type="text" name="login"
					placeholder="Must be Email ID"
					value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
					color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
			</tr>

			<tr></tr>
			<tr></tr>

			<tr>

				<td><b>Password<font color="red">*</font></b></td>
				<td><input type="password" name="password"
					value="<%=DataUtility.getStringData(bean.getPassword())%>"
					placeholder="Enter Password Here"><font color="red">
						<%=ServletUtility.getErrorMessage("password", request)%></font></td>
			</tr>

			<tr></tr>
			<tr></tr>

			<tr>

				<td><b>Confirm Password<font color="red">*</font></b></td>
				<td><input type="password" name="confirmPassword"
					value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"
					placeholder="Enter Confirm Password Here"><font color="red">
						<%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td>
			</tr>
			<tr></tr>
			<tr></tr>


			<tr>

				<td><b>Gender<font color="red">*</font></b></td>
				<td>
					<%
						HashMap map = new HashMap();
						map.put("Male", "Male");
						map.put("Female", "Female");
					%> <%=HTMLUtility.getList("gender", String.valueOf(bean.getGender()), map, true)%>
					<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>



			<tr>

				<td><b>Date Of Birth<font color="red">*</font></b></td>

				<td><input type="text" name="dob" readonly="readonly"
					id="datepicker"
					value="<%=DataUtility.getDateString(bean.getDob())%>"
					placeholder="ClickHere"> <font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>


			<tr>
				<th></th>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=UserRegistrationCtl.OP_SIGN_UP%>"> &nbsp; &nbsp;
					&nbsp;<input type="submit" name="operation"
					value="<%=UserRegistrationCtl.OP_RESET%>"></td>
			</tr>
		</table>
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>