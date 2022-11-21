<%@page import="in.co.sunrays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>

<html>
<body>
	<jsp:useBean id="model" class="in.co.sunrays.proj4.model.RoleModel"
		scope="request"></jsp:useBean>
	<%@include file="Header.jsp"%>

	<center>
		<h1>Role List</h1>

		<form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				List list = ServletUtility.getList(request);
				if (list == null || list.size() == 0) {
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
				value="<%=RoleListCtl.OP_BACK%>">

			<%
				} else {
			%>



			<table width="100%">
				<tr>
					<td align="center"><label>Name :</label> <input type="text"
						name="name"
						value="<%=ServletUtility.getParameter("name", request)%>"
						placeholder="Enter Name Here"> &nbsp; &nbsp;<input
						type="submit" name="operation" value="<%=RoleListCtl.OP_SEARCH%>">
						&nbsp; <input type="submit" name="operation"
						value="<%=RoleListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b><font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%">
				<tr>
					<th style="width: 1%;"><input type="checkbox" id="mainbox"
						onchange="selectall(this)">SelectAll</th>
					<th style="width: 3%;">S.No.</th>
					<th style="width: 8%;">Name</th>
					<th style="width: 15%;">Description</th>
					<th style="width: 4%;">Edit</th>
				</tr>


				<%
					Iterator<RoleBean> it = list.iterator();
						RoleBean bean = null;
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids"
						value="<%=bean.getId()%>" onclick="selectone(this)"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getName()%></td>
					<td align="center"><%=bean.getDescription()%></td>
					<td align="center"><a href="RoleCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						value="<%=RoleListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEXT%>"></td>
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