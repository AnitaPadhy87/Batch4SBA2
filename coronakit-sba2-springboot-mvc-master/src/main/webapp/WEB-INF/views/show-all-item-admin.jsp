<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<core:import url="header.jsp" />
<core:choose>
<core:when test="${fn:length(products) gt 0}">
<h2>Product List</h2>
<table border="1" width="100%">
		<thead>
			<th>NAME</th>
			<th>DESCRIPTION</th>
			<th>COST</th>
			<th>DELETE PRODUCT</th>
		</thead>
		<tbody>
		<core:forEach var="product" items="${products}">
			<tr>
				<td>${product.productName}</td> 
				<td>${product.productDescription}</td> 
				<td>${product.cost}</td> 
				<td><a href="${pageContext.request.contextPath}/admin/product-delete/${product.id}">DELETE</a></td> 
			</tr>
		</core:forEach>	
		</tbody>
	</table>
	</core:when>
<core:otherwise>
<h2>There are no products available</h2>
</core:otherwise>
</core:choose>
<br/>
<a href="${pageContext.request.contextPath}/admin/product-entry">Add New Item</a>
<a href="${pageContext.request.contextPath}/admin/home">Dashboard</a>
<core:import url="footer.jsp" />
</body>
</html>