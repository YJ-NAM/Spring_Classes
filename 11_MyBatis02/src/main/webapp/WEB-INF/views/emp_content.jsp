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
			<td><span class="subtitle">Department : </span>${ fn:toUpperCase(dto.dname.substring(0,1)) }${ fn:toLowerCase(dto.dname.substring(1)) } <span class="badge text-bg-secondary">${ dto.deptno }</span></td>
		</tr>
		<tr>
			<td><span class="subtitle">Salary : </span>
			<fmt:setLocale value="en-US"/><fmt:formatNumber value="${ dto.sal }" type="currency" currencySymbol="$" /></td>
			<td><span class="subtitle">Commission : </span>
			<fmt:setLocale value="en-US"/><fmt:formatNumber value="${ dto.comm }" type="currency" currencySymbol="$" />
		</tr>
		<tr>
			<td><span class="subtitle">Manager : </span>${ mgrName } <span class="badge text-bg-secondary">${ dto.mgr }</span></td>
			<td><span class="subtitle">Hiredate : </span>${ dto.hiredate.substring(0,10) }</td>
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
			<button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteFunction">Delete</button>
			<button class="btn btn-outline-secondary" onclick="location.href='emp_list.do';">List</button>
			</td>
		</tr>
		</table>
		
		<!-- 삭제 -->
		<div class="modal fade" id="deleteFunction" tabindex="-1" aria-labelledby="deleteFunctionLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="deleteFunctionLabel">Delete Confirm </h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<p class="mb-0">Are you sure you want to wipe all data? <br /> Once it's done, it cannot be undone.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-danger" onclick="location.href='emp_delete.do?empno=${ dto.empno }'">Delete</button>
		      </div>
		    </div>
		  </div>
		</div>
		<br />	
		<br />
	</div>
</body>
</html>