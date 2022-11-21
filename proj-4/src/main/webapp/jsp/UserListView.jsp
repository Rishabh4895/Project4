<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>
	<center>
		<%@include file="Header.jsp"%>
		<jsp:useBean id="rolemodel" scope="request"
			class="in.co.sunrays.proj4.model.RoleModel"></jsp:useBean>
		<jsp:useBean id="rolebean" scope="request"
			class="in.co.sunrays.proj4.bean.RoleBean"></jsp:useBean>
		<jsp:useBean id="usermodel" scope="request"
			class="in.co.sunrays.proj4.model.UserModel"></jsp:useBean>
		<jsp:useBean id="bean" scope="request"
			class="in.co.sunrays.proj4.bean.UserBean"></jsp:useBean>

		<input type="hidden" name="id" value="<%=bean.getId()%>">

		<%
			
		%>

		<h1>User List</h1>

		<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				List list = ServletUtility.getList(request);
				if (list.size() == 0 || list == null) {
			%>

			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<%
				if ("".equals(ServletUtility.getSuccessMessage(request))) {
			%>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<%
				}
			%>

			<br> <br> <input type="submit" name="operation"
				value="<%=UserListCtl.OP_BACK%>">
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
					<td align="center"><label>FirstName :</label> <input
						type="text" name="firstName"
						value="<%=ServletUtility.getParameter("firstName", request)%>"
						placeholder="Enter First Name Here"> &emsp; <%-- <label>LastName:</label>
						 <input type="text" name="lastName"
						value="<%=ServletUtility.getParameter("lastName", request)%>"
						placeholder="Enter Last Name Here"> --%> &emsp;<label>LoginId:</label>
						<input type="text" name="login"
						value="<%=ServletUtility.getParameter("login", request)%>"
						placeholder="Enter Login Id Here">&emsp; <label>Role:</label>
						<%
							
						%> <%
 	List list1 = (List) request.getAttribute("roleList");
 %> <%=HTMLUtility.getList("roleId", String.valueOf(ServletUtility.getParameter("roleId", request)),
						list1)%> &emsp; <input type="submit" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" name="operation" value="<%=UserListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>

			<br>

			<table border="4" width="100%">
				<tr>
					<th style="width: 7%;"><input type="checkbox" id="mainbox"
						onchange="selectall(this)">SelectAll</th>
					<th style="width: 3%;">S.No.</th>
					<th style="width: 15%;">FirstName</th>
					<th style="width: 15%;">LastName</th>
					<th style="width: 25%;">LoginId</th>
					<th style="width: 7%;">Gender</th>
					<th style="width: 10%;">DOB</th>
					<th style="width: 8%;">Role</th>
					<th style="width: 8%;">Edit</th>
				</tr>


				<%
					Iterator<UserBean> it = list.iterator();
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
					<%
						if (bean.getRoleId() == 1) {
					%>
					<td align="center"><input type="checkbox" name="ids"
						value="<%=bean.getId()%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="center"><input type="checkbox" name="ids"
						value="<%=bean.getId()%>" onclick="selectone(this)"></td>
					<%
						}
					%>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getLogin()%></td>
					<td align="center"><%=bean.getGender()%></td>
					<td align="center"><%=bean.getDob()%></td>
					<%
						rolebean = rolemodel.findByPK(bean.getRoleId());
					%>
					<td align="center"><%=rolebean.getName()%></td>
					<%
						if (bean.getRoleId() == 1) {
					%><td align="center"><a href="UserCtl?id=<%=bean.getId()%>"
					   onclick="return false;">Edit</a></td>
					<%
						} else {
					%>
					<td align="center"><a href="UserCtl?id=<%=bean.getId()%>">Edit</a></td>
					<%
						}
					%>
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
						value="<%=UserListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=UserCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (usermodel.nextPk() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEXT%>"></td>
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