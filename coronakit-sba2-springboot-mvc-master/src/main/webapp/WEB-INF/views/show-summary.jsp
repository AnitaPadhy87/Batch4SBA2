<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Summary</title>
</head>
<body>
<core:import url="header.jsp" />
<h1>Order placed successfully</h1>
<hr/>
<h2>Order Number  : ${coronaKit.id}</h2>
<h2>Delivery Address  : ${coronaKit.deliveryAddress}</h2>
</br>

<div>
	<b><a href="${pageContext.request.contextPath}/user/show-list">Continue Shopping...</a></b>
</div>
<core:import url="footer.jsp" />
</body>
</html>
