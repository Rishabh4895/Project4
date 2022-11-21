<%@page import="in.co.sunrays.proj4.controller.GetMarksheetCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<%@ include file="Header.jsp"%>

	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
		scope="request"></jsp:useBean>


	<h1 align="center">Get Marksheet</h1>

	<H2 align="center">
		<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
		</font>
	</H2>

	<form action="<%=ORSView.GET_MARKSHEET_CTL%>" method="post">

		<input type="hidden" name="id" value="<%=bean.getId()%>">


		<table style="margin-left: 38%;">
			<tr>
				<td><label>RollNo :</label>&emsp; <input type="text"
					name="rollNo"
					value="<%=ServletUtility.getParameter("rollNo", request)%>"
					placeholder="Enter Roll No Here">&emsp; <input
					type="submit" name="operation" value="<%=GetMarksheetCtl.OP_GO%>">
				</td>
			</tr>
		</table>
		<H2 align="center">
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
			</font>
		</H2>

		<%
			if (bean.getRollNo() != null && bean.getRollNo().trim().length() > 0) {
		%>



		<table border="2" style="width: 35%; margin-left: 33%; border: black;">


			<tr height="30px;">
				<td width="130px;"><b><font size="4px;">ROLLNO </font></b></td>
				<td align="center"><font size="4px;"><%=DataUtility.getStringData(bean.getRollNo())%></font></td>
			</tr>
			<tr height="30px;">
				<td width="130px;"><b><font size="4px;">NAME </font></b></td>
				<td align="center"><font size="4px;"><%=DataUtility.getStringData(bean.getName())%></font></td>
			</tr>

		</table>
		<br>
		<table border="2" style="width: 35%; margin-left: 33%; border: black;">
			<tr height="30px;">
				<td align="center"><b><font size="4px;">SUBJECT</font></b></td>
				<td align="center"><b><font size="4px;">MAX MARKS</font></b></td>
				<td align="center"><b><font size="4px;">OBTAINED</font></b></td>
			</tr>
			<tr>
				<td align="center">Physics</td>
				<td align="center">100</td>
				<td align="center"><%=bean.getPhysics() < 33 ? bean.getPhysics() + " *" : bean.getPhysics()%></td>
			</tr>
			<tr>
				<td align="center">Chemistry</td>
				<td align="center">100</td>
				<td align="center"><%=bean.getChemistry() < 33 ? bean.getChemistry() + " *" : bean.getChemistry()%></td>
			</tr>
			<tr>
				<td align="center">Maths</td>
				<td align="center">100</td>
				<td align="center"><%=bean.getMaths() < 33 ? bean.getMaths() + " *" : bean.getMaths()%></td>

			</tr>
		</table>
		<br>

		<table border="2" style="width: 35%; margin-left: 33%; border: black;">


			<tr height="30px;">
				<td width="200px;"><b><font size="3px;">TOTAL/GRAND
							TOTAL </font></b></td>
				<td align="center"><font size="3px;"><%=bean.getChemistry() + bean.getMaths() + bean.getPhysics()%>/300</font></td>
			</tr>
			<tr height="30px;">
				<td width="130px;"><b><font size="3px;">RESULT </font></b></td>
				<!-- <td align="center"><b><font size="4px;" color="green">PASS</font></b></td> -->
				<%
					if (bean.getPhysics() >= 33 && bean.getChemistry() >= 33 && bean.getMaths() >= 33
								&& (bean.getPhysics() + bean.getChemistry() + bean.getMaths()) / 3 >= 33) {
				%>
				<td align="center"><b><font size="3px;" color="green">PASS</font></b></td>
				<%
					} else if (bean.getPhysics() < 33 && bean.getChemistry() > 33 && bean.getMaths() > 33
								|| bean.getPhysics() > 33 && bean.getChemistry() < 33 && bean.getMaths() > 33
								|| bean.getPhysics() > 33 && bean.getChemistry() > 33 && bean.getMaths() < 33) {
				%>
				<td align="center"><b><font size="3px;">ATKT</font></b></td>
				<%
					} else {
				%>
				<td align="center"><b><font size="3px;" color="red">FAIL</font></b></td>
				<%
					}
				%>
			</tr>

		</table>

 <h3 align="center"><input type="submit" name="operation" value="<%=GetMarksheetCtl.OP_BACK%>"></h3>

		<%
			}
		%>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>