<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<form action="<%=ORSView.USER_CTL%>" method="post">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("roleList");
		%>





		<%
			if (bean !=null && bean.getId() > 0) {
		%>
		<h1 align="center">Update User</h1>
		<%
			} else {
		%>
		<h1 align="center">Add User</h1>
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

				<td><b>LoginId<font color="red">*</font></b></td>
				<td><input type="text" name="login"
					value="<%=DataUtility.getStringData(bean.getLogin())%>"
					<%=(bean.getId() > 0) ? "readonly" : ""%>
					placeholder="Enter LoginId Here"><font color="red">
						<%=ServletUtility.getErrorMessage("login", request)%></font></td>
			</tr>
			<tr>

				<td><b>Password<font color="red">*</font></b></td>
				<td><input type="password" name="password"
					value="<%=DataUtility.getStringData(bean.getPassword())%>"
					placeholder="Enter Password Here"><font color="red">
						<%=ServletUtility.getErrorMessage("password", request)%></font></td>
			</tr>
			<tr>

				<td><b>Confirm Password<font color="red">*</font></b></td>
				<td><input type="password" name="confirmPassword"
					value="<%=DataUtility.getStringData(bean.getPassword())%>"
					placeholder="Enter Confirm  Password Here"><font
					color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td>
			</tr>
			<tr>
				<td><b>Gender<font color="red">*</font></b></td>
				<td>
					<%
						HashMap map = new HashMap();
						map.put("Male", "Male");
						map.put("Female", "Female");

						String htmlList = HTMLUtility.getList("gender", bean.getGender(), map, true);
					%> <%=htmlList%> <font color="red"><%=ServletUtility.getErrorMessage("gender", request)%></font>
				</td>
			<tr>

				<td><b>Role<font color="red">*</font></b></td>
				<td><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), l)%>
					<font color="red"><%=ServletUtility.getErrorMessage("role", request)%></font></td>
			</tr>
			<tr>

				<td><b>Date Of Birth<font color="red">*</font></b></td>
				<td><input type="text" name="dob" readonly="readonly"
					id="datepicker"
					value="<%=DataUtility.getDateString(bean.getDob())%>"
					placeholder="ClickHere"> <font color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font></td>
			</tr>
			<tr>
				<th></th>
				<%
					if (bean.getId() > 0) {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=UserCtl.OP_UPDATE%>">&emsp; <input type="submit"
					name="operation" value="<%=UserCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=UserCtl.OP_SAVE%>">&emsp;<input type="submit"
					name="operation" value="<%=UserCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>
		</table>
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>