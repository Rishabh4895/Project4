
<%@page import="in.co.sunrays.proj4.controller.*"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>

<html>
<body>
<%@ include file="Header.jsp"%>
	<form action="<%=ORSView.LOGIN_CTL%>" method="post">
		

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<h1 align="center">Login</h1>

		<H2 align="center">
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
			</font>
		</H2>
		<H2 align="center">
			<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
			</font>
		</H2>
		<%
			String msg = (String) request.getAttribute("mes");
			if (msg != null) {
		%>
		<H2 align="center">
			<font color="red"> <%=msg%>
			</font>
		</H2>
		<%
			}
		%>

		<input type="hidden" name="uri" value="<%=request.getAttribute("uri")%>">
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
				<td><b>LoginId<font color="red">*</font></b></td>

				<td><input type="text" name="login" size=30
					value="<%=DataUtility.getStringData(bean.getLogin())%>"
					placeholder="Enter LoginId Here"><font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<td><b>Password<font color="red">*</font></b></td>
			<td><input type="password" name="password" size=30
				value="<%=DataUtility.getStringData(bean.getPassword())%>"
				placeholder="Enter Password Here"> <font color="red">
					<%=ServletUtility.getErrorMessage("password", request)%></font></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>

			<th></th>
			<td colspan="2"><input type="submit" name="operation"
				value="<%=LoginCtl.OP_SIGN_IN%>"> &nbsp; <input
				type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP%>">
				&nbsp;</td>
			</tr>
			<tr>
				<th></th>
				<td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forget
							my password</b></a>&nbsp;</td>
			</tr>
			</form>
		</table>

		<%@ include file="Footer.jsp"%>
</body>