<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<core:import url="header.jsp" />
<h1>This is Admin dashboard</h1>

<a href="${pageContext.request.contextPath}/admin/product-entry">Add New Item</a>
<br/>
<a href="${pageContext.request.contextPath}/admin/product-list">Show Product List</a>
<core:import url="footer.jsp" />
</body>
</html>