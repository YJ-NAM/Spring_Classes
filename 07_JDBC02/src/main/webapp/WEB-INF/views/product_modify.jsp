<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cont" value="${ content }" />
<c:set var="cList" value="${ category }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT MODIFICATION FORM</title>
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
		<h3>Product Modification Form</h3>
		<hr />
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/product_modify_Ok.do">
		<input type="hidden" name="pnum" value="${ cont.pnum }"/>
		<table class="table">
			<tr>
				<th>Category</th>
				<td>
				<c:if test="${ !empty cList }">
					<select name="category_fk" id="" class="form-select">
					<c:forEach items="${ cList }" var="list">
						<option value="${ cont.category_fk }"<c:if test='${ cont.category_fk eq list.category_code }'> selected="selected"</c:if>>${ list.category_code } [ ${ list.category_name } ] </option>
					</c:forEach>
					</select>
				</c:if>
				</td>
				<th>Product Code</th><td><input type="text" name="ep_code_fk" class="form-control" value="${ cont.ep_code_fk }"/></td>
			</tr>
			<tr>
				<th>Product Name</th><td colspan="3"><input type="text" name="products_name" class="form-control" value="${ cont.products_name }"/></td>
			</tr>
			<tr>	
				<th>Input Price</th><td><input type="text" name="input_price" class="form-control" value="${ cont.input_price }"/></td>
				<th>Output Price</th><td><input type="text" name="output_price" class="form-control" value="${ cont.output_price }"/></td>
			</tr>
			<tr>
				<th>Transfer Cost</th><td><input type="text" name="trans_cost" class="form-control" value="${ cont.trans_cost }"/></td>			
				<th>Mileage</th><td><input type="text" name="mileage" class="form-control" value="${ cont.mileage }"/></td>
			</tr>
			<tr>
				<th>Company</th><td colspan="3"><input type="text" name="company" class="form-control" value="${ cont.company }"/></td>
			</tr>	
			<tr>	
				<td colspan="4" align="center">
					<input type="submit" class="btn btn-success" value="MODIFY" />
					<input type="reset" class="btn btn-warning" value="REWRITE"/>
					<input type="button" class="btn btn-secondary" value="LIST" onclick="location.href='product_list.do'"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>