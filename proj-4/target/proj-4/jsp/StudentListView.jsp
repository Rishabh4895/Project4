<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.StudentListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<%@include file="Header.jsp"%>
	<jsp:useBean id="model" class="in.co.sunrays.proj4.model.StudentModel"
		scope="request"></jsp:useBean>
		<jsp:useBean id="bean1" class="in.co.sunrays.proj4.bean.StudentBean"
		scope="request"></jsp:useBean>
		
	<center>
		<h1>Student List</h1>

		<form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">
			<%
			List clglist=(List)request.getAttribute("clgList");
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
				value="<%=StudentListCtl.OP_BACK%>">
				

			<%
				} else {
			%><table width="100%">
				<tr>
					<td align="center"><label> FirstName :</label> <input
						type="text" name="firstName"
						value="<%=ServletUtility.getParameter("firstName", request)%>"
						placeholder="Enter First Name Here"> &emsp;&emsp;<label>LastName
							:</label> <input type="text" name="lastName"
						value="<%=ServletUtility.getParameter("lastName", request)%>"
						placeholder="Enter Last Name Here">&emsp;&emsp;<label>Email_Id
							:</label> <input type="text" name="email"
						value="<%=ServletUtility.getParameter("email", request)%>"
						placeholder="Enter Email Id Here"> &emsp;
						<label>College :</label>
						<%=HTMLUtility.getList("collegeId",String.valueOf(ServletUtility.getParameter("collegeId", request)), clglist) %>&emsp;<input
						type="submit" name="operation"
						value="<%=StudentListCtl.OP_SEARCH%>"> &emsp;
						
						<input
						type="submit" name="operation"
						value="<%=StudentListCtl.OP_RESET%>"></td>
				</tr>
			</table>
<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%">
				<tr>
					<th style="width: 7%;"><input type="checkbox" id="mainbox"
						onchange="selectall(this)">SelectAll</th>
					<th style="width: 3%;">S.No</th>
					<th style="width: 13%;">First Name</th>
					<th style="width: 13%;">Last Name</th>
					<th style="width: 20%;">Email ID</th>
					<th style="width: 13%;">College</th>
					<th style="width: 10%;">Date Of Birth</th>
					<th style="width: 10%;">Mobil No</th>
					<th style="width: 5%;">Edit</th>

				</tr>
				<%
					Iterator<StudentBean> it = list.iterator();
						StudentBean bean = null;
						while (it.hasNext()) {

							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids"
						value="<%=bean.getId()%>" onclick="selectone(this)"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getEmail()%></td>
					<td align="center"><%=bean.getCollegeName()%></td>
					<td align="center"><%=bean.getDob()%></td>
					<td align="center"><%=bean.getMobileNo()%></td>

					<td align="center"><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						value="<%=StudentListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_DELETE%>"></td>

					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEXT%>"></td>
					<%
						}
					%>
				</tr>
			</table>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"><input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>