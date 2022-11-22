<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cont" value="${ cont }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<hr />
		<h3>${ cont.memid } 's Detailed Information</h3>
		<hr />
		<br />
		
		<table class="table table-bordered align-middle">
			<c:if test="${ empty cont }">
			<tr>
				<td colspan="4">No data</td>
			</tr>
			</c:if>	
			<c:if test="${ not empty cont }">
			<tr>
				<th class="col-2 table-success">No</th><td class="col-3">${ cont.num }</td>
				<th class="col-2 table-success">Registered Date</th><td class="col-5">${ cont.regdate }</td>
			</tr>
			<tr>
				<th class="table-success">ID</th><td>${ cont.memid }</td>
				<th class="table-success">Name</th><td>${ cont.memname }</td>
			</tr>		
			<tr>
				<th class="table-success">Age</th><td>${ cont.age }</td>
				<th class="table-success">Mileage</th><td><fmt:formatNumber value="${ cont.mileage }" />점</td>
			</tr>			
			<tr>
				<th class="table-success">Job</th><td>${ cont.job }</td>
				<th class="table-success">Address</th><td>${ cont.addr }</td>
			</tr>
			</c:if>	
			<tr>
				<td colspan="4">
					<c:if test="${ not empty cont }">
					<button type="button" class="btn btn-success" onclick="location.href='member_modify.do?num=${ cont.num }'">Modify</button>
					<button type="button" class="btn btn-danger" onclick="location.href='member_delete.do?num=${ cont.num }'">Delete</button>
					</c:if>	
					<button type="button" class="btn btn-secondary" onclick="location.href='member_list.do'">List</button>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>