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
			<th>ADD ITEMS TO CART</th>
		</thead>
		<tbody>
		<core:forEach var="product" items="${products}">
			<tr>
				<td>${product.productName}</td> 
				<td>${product.productDescription}</td> 
				<td>${product.cost}</td> 
				<td><a href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}">Add to cart</a></td>  
			</tr>
		</core:forEach>	
		</tbody>
	</table>
	<br/>
<core:forEach var="item" items="${sessionScope.ShoppingCart}">
		<core:set var="totalQuantity" value="${totalQuantity + item.quantity}"></core:set>
</core:forEach>
	
<core:if test = "${totalQuantity > 0}">
<a href="${pageContext.request.contextPath}/user/show-kit">Go to Cart</a>
</core:if>	
<a href="${pageContext.request.contextPath}/user/home">Dashboard</a>
	
	
</core:when>
<core:otherwise>
<h2>There are no products available</h2>
<a href="${pageContext.request.contextPath}/user/home">Dashboard</a>
</core:otherwise>
</core:choose>
<core:import url="footer.jsp" />
</body>
</html>