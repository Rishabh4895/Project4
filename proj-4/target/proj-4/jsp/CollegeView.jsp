<%@page import="in.co.sunrays.proj4.controller.CollegeCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
	<form action="CollegeCtl" method="POST">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CollegeBean"
			scope="request"></jsp:useBean>


		<%
			if (bean.getId() > 0) {
		%>
		<h1 align="center">Update College</h1>
		<%
			} else {
		%>
		<h1 align="center">Add College</h1>
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

		<table style="margin-left: 38%;">
			<tr>

				<td><b>Name<font color="red">*</font></b></td>
				<td><input type="text" name="name"
					value="<%=DataUtility.getStringData(bean.getName())%>"
					placeholder="Enter Name Here"><font color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
			</tr>
			<tr>
				<td><b>Address<font color="red">*</font></b></td>
				<td style="position: absolute;"><textarea name="address" placeholder="Enter Address Here"
						rows="4" cols="22"><%=DataUtility.getStringData(bean.getAddress())%></textarea><font
					color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font>
				</td>

			</tr><tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			
			<%-- <tr>
                    
                    <td><b>Address<font color="red">*</font></b></td>
                    <td><input type="" name="address"
                        value="<%=DataUtility.getStringData(bean.getAddress())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font></td>
                </tr>  --%>
			<tr>

				<td><b>State<font color="red">*</font></b></td>
				<td><input type="text" name="state"
					value="<%=DataUtility.getStringData(bean.getState())%>"
					placeholder="Enter State Here"><font color="red"> <%=ServletUtility.getErrorMessage("state", request)%></font></td>
			</tr>
			<tr>

				<td><b>City<font color="red">*</font></b></td>
				<td><input type="text" name="city"
					value="<%=DataUtility.getStringData(bean.getCity())%>"
					placeholder="Enter City Here"><font color="red"> <%=ServletUtility.getErrorMessage("city", request)%></font></td>
			</tr>
			<tr>

				<td><b>MobileNo<font color="red">*</font></b></td>
				<td><input type="text" name="phoneNo" maxlength="10"
					value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"
					placeholder="Enter PhoneNo Here"><font color="red">
						<%=ServletUtility.getErrorMessage("phoneNo", request)%></font></td>
			</tr>
			<tr>
				<td></td>
				<%
					if (bean.getId() > 0) {
				%>
				<td>&emsp;<input type="submit" name="operation"
					value="<%=CollegeCtl.OP_UPDATE%>"> &emsp; <input
					type="submit" name="operation" value="<%=CollegeCtl.OP_CANCEL%>"></td>
				<%
					} else {
				%>
				<td colspan="2"><input type="submit" name="operation"
					value="<%=CollegeCtl.OP_SAVE%>">&emsp; <input type="submit"
					name="operation" value="<%=CollegeCtl.OP_RESET%>"></td>
				<%
					}
				%>

			</tr>
		</table>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>