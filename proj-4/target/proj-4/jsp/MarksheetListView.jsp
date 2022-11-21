<%@page import="in.co.sunrays.proj4.model.MarksheetModel"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp"%>
<html>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<h1>Marksheet List</h1>


		<jsp:useBean id="model"
			class="in.co.sunrays.proj4.model.MarksheetModel" scope="request"></jsp:useBean>

		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST">
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
				value="<%=MarksheetListCtl.OP_BACK%>">
			<%
				} else {
			%>
			<table width="100%">
				<tr>
					<td align="center"><label> Name :</label> <input type="text"
						name="name" placeholder="Enter Name Here"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&emsp; <label>RollNo :</label> <input type="text" name="rollNo"
						value="<%=ServletUtility.getParameter("rollNo", request)%>"
						placeholder="Enter Roll No Here">&emsp; <input
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<br>
			<table border="4" width="100%">
				<tr>
					<th style="width: 7%;"><input type="checkbox" id="mainbox"
						onchange="selectall(this)">Select All</th>

					<th style="width: 6%;">S.No</th>
					<th style="width: 13%;">RollNo</th>
					<th style="width: 25%;">Name</th>
					<th style="width: 7%;">Physics</th>
					<th style="width: 7%;">Chemistry</th>
					<th style="width: 7%;">Maths</th>
					<th style="width: 7%;">Total</th>
					<th style="width: 7%;">Percentage</th>
					<th style="width: 7%;">Status</th>

					<th>Edit</th>
				</tr>
				<%
					Iterator<MarksheetBean> it = list.iterator();
						MarksheetBean bean = null;
						while (it.hasNext()) {

							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids"
						onclick="selectone(this)" value="<%=bean.getId()%>"></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getRollNo()%></td>
					<td align="center"><%=bean.getName()%></td>
					<td align="center"><%=bean.getPhysics() < 33 ? bean.getPhysics() + "<font color='red'> *</font>"
							: bean.getPhysics()%></td>
					<td align="center"><%=bean.getChemistry() < 33 ? bean.getChemistry() + "<font color='red'> *</font>"
							: bean.getChemistry()%></td>
					<td align="center"><%=bean.getMaths() < 33 ? bean.getMaths() + "<font color='red'> *</font>" : bean.getMaths()%></td>
					<td align="center"><%=bean.getPhysics() + bean.getChemistry() + bean.getMaths()%></td>
					<td align="center"><%=(bean.getPhysics() + bean.getChemistry() + bean.getMaths()) / 3%>
						%</td>

					<%
						if (bean.getPhysics() >= 33 && bean.getChemistry() >= 33 && bean.getMaths() >= 33
										&& (bean.getPhysics() + bean.getChemistry() + bean.getMaths()) / 3 >= 33) {
					%>
					<td align="center"><b><font color="green">PASS</font></b></td>
					<%
						} else if (bean.getPhysics() < 33 && bean.getChemistry() > 33 && bean.getMaths() > 33
										|| bean.getPhysics() > 33 && bean.getChemistry() < 33 && bean.getMaths() > 33
										|| bean.getPhysics() > 33 && bean.getChemistry() > 33 && bean.getMaths() < 33) {
					%>
					<td align="center"><b><font color="cyan">ATKT</font></b></td>
					<%
						} else/* (bean.getPhysics() < 33 && bean.getChemistry() < 33 && bean.getMaths() < 33) */ {
					%>
					<td align="center"><b><font color="red">FAIL</font></b></td>
					<%
						}
					%>
					<td align="center"><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						value="<%=MarksheetListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
			
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_DELETE%>"></td>
				


					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>"></td>
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