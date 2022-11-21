<%@page import="in.co.sunrays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.RoleCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean" %>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
<%@ include file="Header.jsp"%>
	<form action="<%=ORSView.ROLE_CTL%>" method="post">
		

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.RoleBean"
			scope="request"></jsp:useBean>

		<%
			if (bean.getId() > 0) {
				
		%>
		<h1 align="center">Update Role</h1>
		<%
			} else {
		%>
		<h1 align="center">Add Role</h1>
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


		<table style="margin-left: 40%;">
			<tr>
				<td><b>Name<font color="red">*</font></b></td>
				<td><input type="text" name="name"
					value="<%=DataUtility.getStringData(bean.getName())%>"
					placeholder="Enter Name Here"><font color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
			</tr>
			<tr>
				<td><b>Description<font color="red">*</font></b></td>
				<td><textarea rows="4" cols="22" name="description"
						placeholder="Enter Description Here"><%=DataUtility.getStringData(bean.getDescription())%></textarea>
					<font color="red" class="desc" style="left: 824;
    top: 299px;"> <%=ServletUtility.getErrorMessage("description", request)%></font>
				</td>

			</tr>
			<tr>
				<th></th>
				<%
					if (bean.getId() > 0) {
				%>
				<td><input type="submit" name="operation"
					value="<%=RoleListCtl.OP_UPDATE%>">&emsp; <input
					type="submit" name="operation" value="<%=RoleListCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=RoleListCtl.OP_SAVE%>">&emsp; <input
					type="submit" name="operation" value="<%=RoleListCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>
		</table>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>