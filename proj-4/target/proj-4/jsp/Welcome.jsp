<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page import="in.co.sunrays.proj4.bean.*" %>
<%@page errorPage="ErrorView.jsp" %>
<html>
<body>
<%@ include file="Header.jsp" %>
    <form action="<%=ORSView.WELCOME_CTL%>" method="post">
       
                    <h1 align="Center">
                        <font size="10px" color="red">Welcome to ORS </font>
                    </h1>
        
                    <%
                    UserBean beanUserBean = (UserBean) session.getAttribute("user");
                        if (beanUserBean != null) {
                            if (beanUserBean.getRoleId() == RoleBean.STUDENT) {
                    %>
        
                    <h2 align="Center">
                         <a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your
                            Marksheet </a>
                    </h2>

                     
                     <%
                            }
                        }
                     %>
                
                </form>
       <%@ include file="Footer.jsp"%> 
       
</body>
</html>