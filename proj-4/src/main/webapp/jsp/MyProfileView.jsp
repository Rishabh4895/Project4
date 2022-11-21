
<%@page import="in.co.sunrays.proj4.controller.MyProfileCtl"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>

	<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

		<%@ include file="Header.jsp"%>
		<!--    <script type="text/javascript" src="../js/calendar.js"></script>-->
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<h1 align="center">My Profile</h1>



		<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
			type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy"
			value="<%=bean.getModifiedBy()%>"> <input type="hidden"
			name="createdDatetime"
			value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime"
			value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


		<table style="margin-left: 40%">

			<H2 align="center">
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>
			<H2 align="center">
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>

			<tr>

				<td><b>LoginId<font color="red">*</font></b></td>
				<td><input type="text" name="login"
					value="<%=DataUtility.getStringData(bean.getLogin())%>"
					readonly="readonly"><font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
			</tr>

			<tr>

				<td><b>First Name<font color="red">*</font></b></td>
				<td><input type="text" name="firstName"
					value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
					color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
			</tr>
			<tr>
				<td><b>Last Name<font color="red">*</font></b></td>
				<td><input type="text" name="lastName"
					value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
					color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
			</tr>
			<tr>

				<td><b>Gender<font color="red">*</font></b></td>
				<td>
					<%
						HashMap map = new HashMap();
						map.put("Male", "Male");
						map.put("Female", "Female");
					%> <%=HTMLUtility.getList("gender", bean.getGender(), map, true)%>
					<font
					color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
				</td>
			</tr>
			<tr>

				<td><b>Mobile No<font color="red">*</font></b></td>
				<td><input type="text" name="mobileNo" maxlength="12"
					value="<%=DataUtility.getStringData(bean.getMobileNo())%>"><font
					color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
			</tr>

			<tr>

				<td><b>Date Of Birth<font color="red">*</font></b></td>
				<td><input type="text" name="dob" id="datepicker"
					readonly="readonly"
					value="<%=DataUtility.getDateString(bean.getDob())%>"> <!--  <a href="javascript:getCalendar(document.forms[0].dob);">
                            <img src="../img/cal.jpg" width="16" height="15" border="0"
                            alt="Calender">--> </a><font color="red">
						<%=ServletUtility.getErrorMessage("dob", request)%></font></td>
			</tr>



			<tr>
				<th></th>
				<td colspan="2"><input class="cp" type="submit" name="operation"
					value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>"> &nbsp; <input
					type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE%>">
					&nbsp;</td>
			</tr>
		</table>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>