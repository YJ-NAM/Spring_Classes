<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="dto" value="${ cont }" />
<c:set var="mgrName" value="${ mgrName }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
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
			<c:if test="${ not empty dto }">			
			<h3>${ dto.ename }'s Information</h3>
			</c:if>
			<c:if test="${ empty dto }">			
			<h3>No data</h3>
			</c:if>			
		</div>
		<br />
		<table class="table table-bordered">
		<c:if test="${ not empty dto }">
		<tr>
			<td class="col-1"><span class="subtitle">No : </span>${ dto.empno }</td><td class="col-1"><span class="subtitle">Name : </span>${ dto.ename }</td>
		</tr>
		<tr>
			<td><span class="subtitle">Job : </span>${ fn:toUpperCase(dto.job.substring(0,1)) }${ fn:toLowerCase(dto.job.substring(1)) }</td>
			<td><span class="subtitle">Department : </span>${ fn:toUpperCase(dto.dname.substring(0,1)) }${ fn:toLowerCase(dto.dname.substring(1)) }[ ${ dto.deptno } ]</td>
		</tr>
		<tr>
			<td><span class="subtitle">Salary : </span>
			<fmt:setLocale value="en-US"/><fmt:formatNumber value="${ dto.sal }" type="currency" currencySymbol="$" /></td>
			<td><span class="subtitle">Commission : </span>
			<fmt:setLocale value="en-US"/><fmt:formatNumber value="${ dto.comm }" type="currency" currencySymbol="$" />
		</tr>
		<tr>
			<td><span class="subtitle">Manager : </span>${ dto.mgr }[ ${ mgrName } ]</td><td><span class="subtitle">Hiredate : </span>${ dto.hiredate }</td>
		</tr>
		</c:if>
		<c:if test="${ empty dto }">
			<tr>
				<td colspan="2">No data</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2">
			<button class="btn btn-outline-success" onclick="location.href='emp_modify.do?empno=${ dto.empno }';">Modify</button>
			<button class="btn btn-outline-danger" onclick="location.href='emp_delete.do?empno=${ dto.empno }';">Delete</button>
			<button class="btn btn-outline-secondary" onclick="location.href='emp_list.do';">List</button>
			</td>
		</tr>
		</table>
		<br />	
		<br />
	</div>
</body>
</html>