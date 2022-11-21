<%@page import="in.co.sunrays.proj4.controller.ChangePasswordCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">

		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>


		<h1 align="center">Change Password</h1>


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

				<td><b>Old Password<font color="red">*</font></b></td>

				<td><input placeholder="Enter Old Password Here"
					type="password" name="oldPassword"
					value=<%=DataUtility.getStringData(
					bean.getPassword() == null ? "" : DataUtility.getStringData(bean.getPassword()))%>><font
					color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%></font></td>


				<%-- value=<%=DataUtility.getString(request.getParameter("oldPassword") == null ? ""
					: DataUtility.getString(request.getParameter("oldPassword")))%>><font
					color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%> </font></td>--%>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>

				<td><b>New Password<font color="red">*</font></b></td>
				<td><input placeholder="Enter New Password Here"
					type="password" name="newPassword"
					value=<%=DataUtility.getStringData(
					bean.getConfirmPassword() == null ? "" : DataUtility.getStringData(bean.getConfirmPassword()))%>><font
					color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font></td>



				<%-- value=<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
					: DataUtility.getString(request.getParameter("newPassword")))%>><font
					color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font></td> --%>
			</tr>


			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>

				<td><b>Confirm Password<font color="red">*</font></b></td>
				<td><input placeholder="Enter Confirm Password Here"
					type="password" name="confirmPassword"
					value=<%=DataUtility.getString(!ServletUtility.getErrorMessage("confirmPassword", request).equalsIgnoreCase("") ? request.getParameter("confirmPassword")
				: "")%>><font
					color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td>

				<%-- value=<%=DataUtility.getString(request.getParameter("confirmPassword") == null ? ""
					: DataUtility.getString(request.getParameter("confirmPassword")))%>><font
					color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td> --%>
			</tr>

			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<th></th>
				<td><input class="cp" type="submit" name="operation"
					value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>"> &nbsp;
					<input type="submit" name="operation"
					value="<%=ChangePasswordCtl.OP_SAVE%>"> &nbsp;</td>
			</tr>

		</table>

	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>