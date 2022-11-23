<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="jlist" value="${ jList }" />
<c:set var="mlist" value="${ mList }" />
<c:set var="dlist" value="${ dList }" />
<c:set var="modify" value="${ modify }" />
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
		<br />
		<div class="title_container py-3">
			<c:if test="">
			<h3>Register new Employee</h3>
			</c:if>
		</div>
		<br />
		<form action="${ pageContext.request.contextPath }/emp_insert_ok.do" method="post">
		<table class="table table-bordered align-middle">
		<tr><th>No</th><td><input type="text" name="empno" class="form-control" /></td></tr>
		<tr><th>Name</th><td><input type="text" name="ename" class="form-control" /></td></tr>
		<tr><th>Job</th>
			<td>
				<select name="job" class="form-select">
					<c:if test="${ empty jlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty jlist }">
						<c:forEach items="${ jlist }" var="job">
						<option value="${ job }">${ job }</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr><th>Manager</th>
			<td>
				<select name="mgr" class="form-select">
					<c:if test="${ empty mlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty mlist }">
						<c:forEach items="${ mlist }" var="mgr">
						<option value="${ mgr.empno }">${ mgr.ename }[${ mgr.empno }]</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr><th>Salary</th><td><input type="text" name="sal" class="form-control" /></td></tr>
		<tr><th>Bonus</th><td><input type="text" name="comm" class="form-control" /></td></tr>
		<tr><th>Department</th>
			<td>
				<select name="deptno" class="form-select">
					<c:if test="${ empty dlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty dlist }">
						<c:forEach items="${ dlist }" var="dept">
						<option value="${ dept.deptno }">${ dept.dname }[${ dept.deptno }]</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Register" class="btn btn-outline-success"/>
				<input type="reset" value="Rewrite" class="btn btn-outline-warning"/>
				<input type="button" value="List" class="btn btn-outline-secondary" onclick="location.href='emp_list.do'"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>