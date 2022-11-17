<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	tr th {
		padding: 10px;
	}
</style>
</head>
<body>

	<div class="container">
		<hr />
			<h3>Would you like to Join? Please come in!</h3>
		<hr />
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/join_ok">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" placeholder="Enter your Id" class="form-control" name="id" required="required" /></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" placeholder="Enter your name" class="form-control" name="name" required="required" /></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" placeholder="Enter your password" class="form-control" name="pwd" required="required" /></td>
				</tr>							
				<tr>
					<th>Age</th>
					<td><input type="text" placeholder="Enter your age" class="form-control" name="age" /></td>
				</tr>	
				<tr>
					<th>Phone</th>
					<td><input type="text" placeholder="Enter your phone-number" class="form-control" name="phone" /></td>
				</tr>	
				<tr>
					<th>Email</th>
					<td><input type="text" placeholder="Enter your Email-address" class="form-control" name="email" /></td>
				</tr>			
				<tr>
					<th>Address</th>
					<td><input type="text" placeholder="Enter your address" class="form-control" name="addr" /></td>
				</tr>
				<br />
				<tr>					
					<td colspan="2">
					<input type="submit" class="btn btn-primary" value="JOIN" />
					<input type="reset" class="btn btn-warning" value="RESET" />					
					</td>
				</tr>					
			</table>	
		</form>
	</div>

</body>
</html>