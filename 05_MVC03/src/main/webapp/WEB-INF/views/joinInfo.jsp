<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${ Member }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	div {
		width: 400px;
		margin: 0 auto;		
	}
	
	div h3 {
		text-align: center;
	}
	table {
	}

	table tr th {
		background-color: lightpink !important;
		margin: 0 10px;
	}
	
</style>
</head>
<body>
	<div>
		<hr />
			<h3>Join Information</h3>
		<hr />
		<table class="table">
			<c:if test="${ not empty dto }">
				<tr><th>ID</th><td>${ dto.id }</td></tr>
				<tr><th>Name</th><td>${ dto.name }</td></tr>
				<tr><th>Password</th><td>${ dto.pwd }</td></tr>
				<tr><th>Age</th><td>${ dto.age }</td></tr>
				<tr><th>Phone</th><td>${ dto.phone }</td></tr>
				<tr><th>Email</th><td>${ dto.email }</td></tr>
				<tr><th>Address</th><td>${ dto.addr }</td></tr>
			</c:if>
			<c:if test="${ empty dto }">
				<tr><th colspan="2">ID</th><td>No data</td></tr>
			</c:if>
		</table>
	</div>
</body>
</html>