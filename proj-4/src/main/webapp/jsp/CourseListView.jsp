<%@page import="in.co.sunrays.proj4.controller.CourseListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.bean.CourseBean"%>
<%@page import="in.co.sunrays.proj4.util.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>

<html>
<body>

    <%@include file="Header.jsp"%>
    <jsp:useBean id="model" class="in.co.sunrays.proj4.model.CourseModel" scope="request"></jsp:useBean>

    <center>
        <h1>Course List</h1>

        <form action="<%=ORSView.COURSE_LIST_CTL%>" method="post">
        <%
        int pageNo = ServletUtility.getPageNo(request);
        int pageSize = ServletUtility.getPageSize(request);
        int index = ((pageNo - 1) * pageSize) + 1;

        List list = ServletUtility.getList(request);
       if(list==null||list.size()==0){
    	   
    	   %><b> <font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
			<%
				if ("".equals(ServletUtility.getSuccessMessage(request))) {
			%>
			<b> <font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<%
				}
			%>
    	   <br>
    	   <br>
    	   <input type="submit" name="operation" value="<%=CourseListCtl.OP_BACK%>">
    	   <%
    	   
       }else{
    	   
    	   %> 
    	   
       
        
        
        
        
        
            <table width="100%">
                <tr>
                    <td align="center"><label>CourseName :</label> <input type="text"
                        name="name"
                        value="<%=ServletUtility.getParameter("name", request)%>" placeholder="Enter Course Name Here">
                       &emsp;&emsp; <label>Duration :</label>
                        <%
							HashMap map = new HashMap();
							map.put("1 year", "1 year");
							map.put("2 year", "2 year");
							map.put("3 year", "3 year");
							map.put("4 year", "4 year");
							map.put("5 year", "5 year");
							map.put("6 year", "6 year");

							
						%> <%=HTMLUtility.getList("duration", ServletUtility.getParameter("duration", request), map,true)%>
                         &emsp;<input type="submit" name="operation" value="<%=CourseListCtl.OP_SEARCH %>">
                        &nbsp;<input type="submit" name="operation" value="<%=CourseListCtl.OP_RESET %>">
                    </td>
                </tr>
            </table>
            <b><font color="red" size="5px;"><%=ServletUtility.getErrorMessage(request)%></font></b>
            <b><font color="green" size="5px;"><%=ServletUtility.getSuccessMessage(request)%></font></b>
            <br>
            <table border="4" width="100%">
                <tr>
                	<th style="width: 7%;"><input type="checkbox" id="mainbox" onchange="selectall(this)">Select all</th> 
                    <th style="width: 5%;">S.No.</th>
                    <th style="width: 20%;">Name</th>
                    <th style="width: 30%;">Description</th>
                    <th style="width: 12%;">Duration</th>
                    <th style="width: 8%;">Edit</th>
                </tr>
                

                <%
                CourseBean bean=null;
                Iterator<CourseBean> it = list.iterator();
                    while (it.hasNext()) {
                         bean = it.next();
                %>
                <tr>
                 
                	 <td align="center"><input type="checkbox" name="ids" onclick="selectone(this)" value="<%=bean.getId()%>"></td> 
                    <td align="center"><%=index++%></td>
                    <td align="center"><%=bean.getName()%></td>
                    <td align="center"><%=bean.getDescription()%></td>
                    <td align="center"><%=bean.getDuration()%></td>
                    <td align="center"><a href="CourseCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						value="<%=CourseListCtl.OP_PREVIOUS%>" disabled="disabled"></td>


					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=CourseListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=CourseListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=CourseListCtl.OP_DELETE%>"></td>


					<%
						if (bean.getId() == (model.nextPK() - 1) || list.size() < pageSize) {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=CourseListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input type="submit" name="operation"
						value="<%=CourseListCtl.OP_NEXT%>"></td>
					<%
						}
					%>
                </tr>
            </table>
            <% }%>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>