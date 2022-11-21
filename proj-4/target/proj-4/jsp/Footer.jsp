<%@page import="java.util.Calendar"%>
<%@page errorPage="ErrorView.jsp"%>
<html>

<head>
<style type="text/css">
#footer {
	position: fixed;
	bottom: -12px;
	left: 0px;
	right: 0px;
}
</style>

<title></title>
</head>
<div>
	<body>
		<center>

			<h3 id="footer">
				<hr>
				<%
					Calendar c = Calendar.getInstance();
				%>
				Copyright &copy;
				<%=c.getWeekYear()%>
				Rays Technologies

			</h3>

		</center>

	</body>

</div>
</html>