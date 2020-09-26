<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Product Entry</title>
		<style type="text/css">
			.error{
				color : red;
			}
		</style>
</head>
<body>
<core:import url="header.jsp" />
<h1>Provide the product details</h1>
<hr/>

<spring:form action="product-save" method="post" modelAttribute="product">
			<div>
				<div><spring:label path="productName">Enter product name</spring:label></div>
				<div>
					<spring:input path="productName"/>
					<spring:errors path="productName" cssClass="error"/>
				</div>
			</div>
			</br></br>
			<div>
				<div><spring:label path="productDescription">Enter product description</spring:label></div>
				<div><spring:input path="productDescription"/></div>
				<spring:errors path="productDescription" cssClass="error"/>
			</div>
			
			</br></br>
			<div>
				<div><spring:label path="cost">Enter cost</spring:label></div>
				<div>
					<spring:input path="cost" type="number"/>
					<spring:errors path="cost" cssClass="error"/>
				</div>
			</div>
			</br></br>
				
			
				<div><input type="submit" value="Submit" /></div>
		
		</spring:form>
		<br/>
<a href="${pageContext.request.contextPath}/admin/home">Dashboard</a>
<core:import url="footer.jsp" />
</body>
</html>
