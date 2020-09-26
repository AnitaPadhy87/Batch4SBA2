<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
			.error{
				color : red;
			}
		</style>
</head>
<body>
<core:import url="header.jsp" />
<h2>Product List</h2>
<table border="1" width="100%">
		<thead>
			<th>PRODUCT NAME</th>
			<th>PRICE</th>
			<th>QUANTITY</th>
			<th>AMOUNT</th>
		</thead>
		<tbody>
		
		<core:forEach var="item" items="${sessionScope.ShoppingCart}">
		<core:set var="totalAmount" value="${totalAmount+item.amount * item.quantity}"></core:set>
		<core:set var="totalQuantity" value="${totalQuantity + item.quantity}"></core:set>
			<tr>
				<td>${item.productName}</td> 
				<td>${item.amount}</td> 
				<td>${item.quantity}</td>
				<td>${item.quantity*item.amount}</td> 
			</tr>
		</core:forEach>	
		</tbody>
	</table>
	
</br>


<spring:form action="finalize" method="post" modelAttribute="coronaKit">
				
				<div>
				<spring:label path="deliveryAddress">Enter delivery address</spring:label>
				<spring:textarea path="deliveryAddress"/>
				<spring:errors path="deliveryAddress" cssClass="error"/>
				</div>
			
			</br></br>
				
				<div><input type="submit" value="Place order" /></div>
		
		</spring:form>
</br>		
<div>
	<b><a href="${pageContext.request.contextPath}/user/show-list">Continue Shopping...</a></b>
</div>
<core:import url="footer.jsp" />
</body>
</html>