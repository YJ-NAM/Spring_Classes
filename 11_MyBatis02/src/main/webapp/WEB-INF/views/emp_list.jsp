<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="list" value="${ list }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Employees's List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">	
</head>
<body>
	<div class="wrap">
		<br />
		<div class="title_container py-3">
			<h3>All Employees's List</h3>
		</div>
		<br />
		<table class="table table-bordered">
		<tr>
			<th>No</th><th>Name</th><th>Job</th><th>Dept Name</th><th>Hiredate</th>
		</tr>
		<c:if test="${ not empty list }">
			<c:forEach items="${ list }" var="dto">
			<tr>
				<td class="col-2">${ dto.empno }</td>
				<td class="col-3"><a href="${ pageContext.request.contextPath }/emp_content.do?empno=${dto.empno}">${ dto.ename }</a></td>
				<td class="col-2">${ fn:toUpperCase(dto.job.substring(0,1)) }${ fn:toLowerCase(dto.job.substring(1)) }</td>
				<td class="col-3">${ fn:toUpperCase(dto.dname.substring(0,1)) }${ fn:toLowerCase(dto.dname.substring(1)) }</td>
				<td class="col-2">${ dto.hiredate.substring(0,10) }</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty list }">
			<tr>
				<td colspan="5">No data</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5">
			<button class="btn btn-secondary" onclick="location.href='emp_insert.do';">Register</button>
			<c:if test="${ not empty keyword }">
			<button class="btn btn-outline-secondary" onclick="location.href='emp_list.do';">List</button>
			</c:if>
			</td>
		</tr>
		</table>
		<br />
		<!-- Search -->
		<div class="d-inline">
			<form method="get" action="${ pageContext.request.contextPath }/emp_search.do?field=${ field }&${ keyword }">
				<select name="field" class="form-select d-inline w-25">
					<option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>All</option>
					<option value="name"<c:if test="${ field eq 'name' }">selected="selected"</c:if>>Name</option>
					<option value="no"<c:if test="${ field eq 'no' }">selected="selected"</c:if>>No</option> 
					<option value="job"<c:if test="${ field eq 'job' }">selected="selected"</c:if>>Job</option>
					<option value="dept"<c:if test="${ field eq 'dept' }">selected="selected"</c:if>>Department</option>
				</select> 
				<input type="text" name="keyword" class="form-control d-inline w-50" />
				<button type="submit" class="btn btn-secondary" >Search</button>
			</form>
		</div>
		<br />	
		<br />
	</div>
</body>
</html>