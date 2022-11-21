<%@page import="in.co.sunrays.proj4.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
    <%@include file="Header.jsp"%>
    <center>
        <h1>Marksheet Merit List</h1>

        <form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="POST">
            <br>
            <font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
            <table border="4" width="100%">
                <tr>

                    <th style="width: 5%;">S.No</th>
                    <th style="width: 10%;">Roll No</th>
                    <th style="width: 20%;">Name</th>
                    <th style="width: 10%;">Physics</th>
                    <th style="width: 10%;">Chemistry</th>
                    <th style="width: 10%;">Maths</th>
                     <th style="width: 10%;">Total/MaxMarks</th>
                     <th style="width: 10%;">Percentage</th>

                </tr>
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();

                    while (it.hasNext()) {

                        MarksheetBean bean = it.next();
                %>
                <tr>

                    <td align="center"><%=index++%></td>
                    <td align="center"><%=bean.getRollNo()%></td>
                    <td align="center"><%=bean.getName()%></td>
                    <td align="center"><%=bean.getPhysics()%></td>
                    <td align="center"><%=bean.getChemistry()%></td>
                    <td align="center"><%=bean.getMaths()%></td>
                    <td align="center"> <%=bean.getMaths()+bean.getChemistry()+bean.getPhysics()%>/300</td>
                    <td align="center"> <%=(bean.getMaths()+bean.getChemistry()+bean.getPhysics())/3%> %</td>
                    
                    

                </tr>

                <%
                    }
                %>
            </table>
            <br>
            <table>
                <tr>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>