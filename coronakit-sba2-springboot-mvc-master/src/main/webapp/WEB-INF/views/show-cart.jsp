<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show cart</title>
</head>
<body>
<core:import url="header.jsp" />
<core:forEach var="item" items="${sessionScope.ShoppingCart}">
		<core:set var="totalAmount" value="${totalAmount+item.amount * item.quantity}"></core:set>
		<core:set var="totalQuantity" value="${totalQuantity + item.quantity}"></core:set>
</core:forEach>
<core:choose>
<core:when test = "${(totalQuantity > 0)}">

<h2>Product List</h2>
<table border="1" width="100%">
		<thead>
			<th>PRODUCT NAME</th>
			<th>PRICE</th>
			<th>QUANTITY</th>
			<th>AMOUNT</th>
			<th>ADD/REMOVE</th>
		</thead>
		<tbody>
		
		<core:forEach var="item" items="${sessionScope.ShoppingCart}">
			<tr>
				<td>${item.productName}</td> 
				<td>${item.amount}</td> 
				<td>${item.quantity}</td>
				<td>${item.quantity*item.amount}</td> 
				<td>
				<a href="${pageContext.request.contextPath}/user/delete/${item.productId}">Remove</a>/
				<a href="${pageContext.request.contextPath}/user/add-to-cart/${item.productId}">Add</a>
				</td>  
			</tr>
		</core:forEach>	
		</tbody>
	</table>
	
<div>
	<b>Total Amount:${totalAmount} </b>
</div>
</br>
<div>
	<b>Total Quantity:${totalQuantity}</b>
</div>
</br>

<div>
	<b><a href="${pageContext.request.contextPath}/user/show-list">Continue Shopping...</a></b>
</div>
</br>

<div>
	<b><a href="${pageContext.request.contextPath}/user/checkout"><button>Check out</button></b>
	<br/> <br/>
	<a href="${pageContext.request.contextPath}/user/home">Dashboard</a>
</div>
</core:when>
<core:otherwise>
<h2>Currently there are no products added in the cart</h2>
<a href="${pageContext.request.contextPath}/user/home">Dashboard</a>
</core:otherwise>
</core:choose>
<core:import url="footer.jsp" />
</body>
</html>
