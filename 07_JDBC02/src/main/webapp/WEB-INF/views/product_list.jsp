<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="list" value="${ List }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOTAL PRODUCT LIST</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	div {
		margin: 0 auto;
		width: 600px;
	}
	div h3 {
		text-align: center;
		font-weight: bold;
	}
	table tr th {
		background-color: FloralWhite !important;
	}
	
	table tr td a {
		display: block;
		text-decoration: none;
	}

</style>
</head>
<body>
	<div>
		<hr />
		<h3>Total Products List Page</h3>
		<hr />
		<br />
		<table class="table">
			<tr><th>Product No</th><th>Product Name</th><th>Price</th><th>Company</th></tr>
			<c:if test="${ !empty list }">
				<c:forEach items="${ list }" var="dto">
					<tr>
						<td>${ dto.pnum }</td>
						<td><a href="${ pageContext.request.contextPath }/product_content.do?pnum=${ dto.pnum }">${ dto.products_name }</a></td>
						<td><fmt:formatNumber value="${ dto.output_price }" />원</td>
						<td>${ dto.company }</td>
					</tr>
				</c:forEach>			
			</c:if>
			<c:if test="${ empty list }">
				<tr>
					<td colspan="4">
						<h3>There is nothing to be shown...</h3>
					</td>					
				</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="center">
					<input type="button" class="btn btn-primary" value="ADD" onclick="location.href='product_insert.do'"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>