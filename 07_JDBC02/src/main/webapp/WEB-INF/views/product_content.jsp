<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cont" value="${ content }" />
<c:set var="category" value="${ category }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DETAILED PRODUCT INFORMATION</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	div {
		margin: 0 auto;
		width: 700px;
	}
	div h3 {
		text-align: center;
		font-weight: bold;
	}
	table tr th {
		background-color: FloralWhite !important;
	}

</style>
</head>
<body>
	<div>
		<hr />
		<c:if test="${ !empty cont }"><h3>Details : ${ cont.products_name }</h3></c:if>
		<c:if test="${ empty cont }"><h3>Details : No data </h3></c:if>
		<hr />
		<br />
		<table class="table">
			<c:if test="${ !empty cont }">
			<tr><th>Product No</th><td>${ cont.pnum }</td><th>Category</th><td>${ cont.category_fk } [ ${ category } ]</td>
				<th>Product Code</th><td>${ cont.ep_code_fk }</td></tr>
			<tr><th>Product Name</th><td colspan="5">${ cont.products_name }</td></tr>
			<tr><th>Input Price</th><td><fmt:formatNumber value="${ cont.input_price }"></fmt:formatNumber> 원</td>
				<th>Output Price</th><td><fmt:formatNumber value="${ cont.output_price }"></fmt:formatNumber> 원</td>
				<th>Transfer Cost</th><td><fmt:formatNumber value="${ cont.trans_cost }"></fmt:formatNumber> 원</td>				
				</tr>
			<tr><th>Mileage</th><td><fmt:formatNumber value="${ cont.mileage }"></fmt:formatNumber> 점</td>
				<th>Company</th><td colspan="3">${ cont.company }</td></tr>	
			</c:if>
			<c:if test="${ empty cont }">
				<tr>
					<td colspan="6">
						<h3>There is nothing to be shown...</h3>
					</td>					
				</tr>
			</c:if>
	
			<tr>
				<td colspan="6" align="center">
					<c:if test="${ !empty cont }">
					<input type="button" class="btn btn-success" value="MODIFY" onclick="location.href='product_modify.do?pnum=${ cont.pnum }'"/>
					<input type="button" class="btn btn-primary" value="DELETE" onclick="location.href='product_delete.do?pnum=${ cont.pnum }'"/>
					</c:if>
					<input type="button" class="btn btn-secondary" value="LIST" onclick="location.href='product_list.do'"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>