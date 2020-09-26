<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User home</title>
</head>
<body>
<core:import url="header.jsp" />
<h1>This is User dashboard</h1>

<a href="${pageContext.request.contextPath}/user/show-list">Show product list</a>
<br/>
<a href="${pageContext.request.contextPath}/user/show-kit">Show cart</a>
<core:import url="footer.jsp" />
</body>
</html>
