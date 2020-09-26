<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit</title>
</head>
<body>
<h1>Welcome to Corona-Kit Home...</h1>
<hr/>
<a href="${pageContext.request.contextPath}/custom-login"><input type="button" value="Login" /></a>
<core:import url="footer.jsp" />
</body>
</html>
