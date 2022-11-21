<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="in.co.sunrays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<%@include file="Header.jsp"%>
	<jsp:useBean id="model" class="in.co.sunrays.proj4.model.CollegeModel"
		scope="request"></jsp:useBean>
	<center>
		<h1>College List</h1>
		<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST">
			<%--    <input type="hidden" name="id" value="<%=bean.ge%>"> --%>
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				List list = ServletUtility.getList(request);
				if (list == null || list.size() == 0) {
			%>
			<b><font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<%
				if ("".equals(ServletUtility.getSuccessMessage(request))) {
			%>
			<b><font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>

			<%
				}
			%>

			<br> <br> <input type="submit" name="operation"
				value="<%=CollegeListCtl.OP_BACK%>">

			<%
				} else {
			%>

			<table width="100%">
				<tr>
					<td align="center"><label>College Name :</label> <input
						type="text" name="name" placeholder="Enter College Name Here"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&emsp;&emsp;<label>City :</label> <input type="text" name="city"
						placeholder="Enter City Here"
						value="<%=ServletUtility.getParameter("city", request)%>">&emsp;
						<input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_SEARCH%>">&emsp;<input
						type="submit" name="operation"
						value="<%=CollegeListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b><font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b><font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%" style="box-shadow: black;">
				<tr>
					<th style="width: 7%;"><input type="checkbox"
						onchange="selectall(this)" id="mainbox">SelectAll</th>

					<th style="width: 3%;">S.No.</th>
					<th style="width: 20%;">Name</th>
					<th style="width: 25%;">Address</th>
					<th style="width: 10%;">State</th>
					<th style="width: 10%;">City</th>
					<th style="width: 10%;">PhoneNo</th>
					<th style="width: 8%;">Edit</th>
				</tr>
				<%
					Iterator<CollegeBean> it = list.iterator();
						CollegeBean bean = null;
						while (it.hasNext()) {

							bean = it.next();
				%>

				<tr>
					<td align="center"><input type="checkbox" name="ids"
						onclick="selectone(this)" value="<%=bean.getId()%>"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getName()%></td>
					<td align="center"><%=bean.getAddress()%></td>
					<td align="center"><%=bean.getState()%></td>
					<td align="center"><%=bean.getCity()%></td>
					<td align="center"><%=bean.getPhoneNo()%></td>
					<td align="center"><a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						value="<%=CollegeListCtl.OP_PREVIOUS%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_DELETE%>"></td>
					<td></td>
					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_NEXT%>"></td>
					<%
						}
					%>

				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
		<%
			}
		%>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>