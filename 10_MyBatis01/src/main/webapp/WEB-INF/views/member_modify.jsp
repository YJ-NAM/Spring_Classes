<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${ modify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<hr >
		<h3>Register Page</h3>
		<hr >
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/member_modify_ok.do">
			<input type="hidden" name="num" value="${ dto.num }" />
			<table class="table table-bordered align-middle">				
				<tr>
					<th class="table-success col-2">ID</th>
					<td colspan="3" class="col-8"><input name="memid" class="form-control" value="${ dto.memid }" disabled="disabled"></td>
				</tr>
				<tr>
					<th class="table-success">Name</th>
					<td colspan="3"><input name="memname" class="form-control" value="${ dto.memname }" disabled="disabled"></td>
				</tr>
				<tr>
					<th class="table-success">Password</th>
					<td colspan="3"><input type="password" name="pwd" class="form-control" value="${ dto.pwd }" ></td>
				</tr>
				<tr>
					<th class="table-success">Age</th>
					<td class="col-4"><input type="number" min="0" max="100" name="age" class="form-control" value="${ dto.age }" ></td>
					<th class="table-success col-2">Mileage</th>
					<td class="col-4"><input name="addr" class="form-control" value="${ dto.mileage }" ></td>
				</tr>
				<tr>
					<th class="table-success">Job</th>
					<td colspan="3"><input name="job" class="form-control" value="${ dto.job }" ></td>
				</tr>
				<tr>
					<th class="table-success">Address</th>
					<td colspan="3"><input name="addr" class="form-control" value="${ dto.addr }" ></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" class="btn btn-success" value="Modify"> 
						<input type="reset" class="btn btn-warning" value="Rewrite">
						<input type="button" class="btn btn-secondary" value="List" onclick="location.href='member_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>