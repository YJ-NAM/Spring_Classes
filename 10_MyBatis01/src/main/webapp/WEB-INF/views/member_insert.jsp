<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form method="post" action="${ pageContext.request.contextPath }/member_insert_ok.do">
			<table class="table table-bordered align-middle">				
				<tr>
					<th class="table-success">ID</th>
					<td><input name="memid" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-success">Name</th>
					<td><input name="memname" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-success">Password</th>
					<td><input type="password" name="pwd" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-success">Age</th>
					<td><input type="number" min="0" max="100" name="age" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-success">Job</th>
					<td><input name="job" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-success">Address</th>
					<td><input name="addr" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-success" value="Register"> 
						<input type="reset" class="btn btn-warning" value="Rewrite">
						<input type="button" class="btn btn-secondary" value="List" onclick="location.href='member_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>