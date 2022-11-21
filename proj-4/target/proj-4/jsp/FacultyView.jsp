<%@page import="in.co.sunrays.proj4.model.SubjectModel"%>
<%@page import="in.co.sunrays.proj4.util.*"%>
<%@page import="in.co.sunrays.proj4.controller.*"%>
<%@page import="in.co.sunrays.proj4.exception.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	
		<form action="<%=ORSView.FACULTY_CTL%>" method="POST">


			<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.FacultyBean"
				scope="request"></jsp:useBean>
			<%
				List l = (List) request.getAttribute("collegeList");
				List li = (List) request.getAttribute("subjectList");
				List lis = (List) request.getAttribute("courseList");

				%>
			<%
				if (bean.getId() > 0) {
			%>
			<h1 align="center">Update Faculty</h1>
			<%
				} else {
			%>
			<h1 align="center">Add Faculty</h1>
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
					<td><b>First Name<font color="red">*</font></b></td>
					<td><input type="text" name="firstName"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>"
						placeholder="Enter First Name Here"> <font color="red">
							<%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
				</tr>



				<tr>
					<td><b>Last Name<font color="red">*</font></b></td>
					<td><input type="text" name="lastName"
						value="<%=DataUtility.getStringData(bean.getLastName())%>"
						placeholder="Enter Last Name Here"> <font color="red">
							<%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
				</tr>



				<tr>


					<td><b>Qualification<font color="red">*</font></b></td>
					<td><input type="text" name="qualification"
						value="<%=DataUtility.getStringData(bean.getQualification())%>"
						placeholder="Enter Qualification Here"> <font color="red">
							<%=ServletUtility.getErrorMessage("qualification", request)%></font></td>
				</tr>




				<tr>
					<td><b>LoginId<font color="red">*</font></b></td>
					<td><input type="text" name="loginId"
						value="<%=DataUtility.getStringData(bean.getEmailId())%>"
						placeholder="Must be Email ID"> <font color="red">
							<%=ServletUtility.getErrorMessage("loginId", request)%></font></td>
				</tr>


				<tr>
					<td><b>PhoneNo<font color="red">*</font></b></td>
					<td><input type="text" name="mobileNo" maxlength="10"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
						placeholder="Enter PhoneNo Here"> <font color="red">
							<%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
				</tr>


				<tr>



					<td><b>Gender<font color="red">*</font></b></td>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");
						%> <%=HTMLUtility.getList("gender", bean.getGender(), map, true)%>
						<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
					</td>
				</tr>




				<tr>
					<td><b>Date Of Joining<font color="red">*</font></b></td>
					<td><input type="text" name="dob" readonly="readonly"
						id="datepickerfac"
						value="<%=DataUtility.getDateString(bean.getDOB())%>"
						placeholder="ClickHere"> <!--   <a href="javascript:getCalendar(document.forms[0].dob);">
                            <img src="../img/cal.jpg" width="16" height="15" border="0"
                            alt="Calender">
                    </a><font
                        color="red"> --> <font color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>



				<tr>

					<td><b>CollegeName<font color="red">*</font></b></td>
					<td><%=HTMLUtility.getList("collegeId", String.valueOf(bean.getCollegeId()), l)%>
						<font color="red"> <%=ServletUtility.getErrorMessage("collegeName", request)%></font></td>

				</tr>



				<tr>

					<td><b>CourseName<font color="red">*</font></b></td>
					<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), lis)%>
						<font color="red"> <%=ServletUtility.getErrorMessage("courseName", request)%></font></td>
				</tr>



				<tr>

					<td><b>SubjectName<font color="red">*</font></b></td>
					<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubjectId()), li)%>
						<font color="red"> <%=ServletUtility.getErrorMessage("subjectName", request)%></font></td>
				</tr>



				<tr>
					<th></th>
				<tr>
					<th></th>
					<%
						if (bean.getId() > 0) {
					%>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=FacultyCtl.OP_UPDATE%>">&emsp; <input
						type="submit" name="operation" value="<%=FacultyCtl.OP_CANCEL%>"></td>
					<%
						} else {
					%>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=FacultyCtl.OP_SAVE%>">&emsp; <input type="submit" name="operation"
						value="<%=FacultyCtl.OP_RESET%>"></td>
					<%
						}
					%>

				</tr>
				</tr>
			</table>
		</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>