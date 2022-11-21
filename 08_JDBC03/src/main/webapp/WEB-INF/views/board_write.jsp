<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
</head>
<body>
	<div>
		<hr />
		<h3>Write Form</h3>
		<hr />
		<form method="post" action="${ pageContext.request.contextPath }/board_write_ok.do">
		<table class="table align-middle">
			<tr>
				<th>Writer</th>
				<td><input type="text" name="board_writer" class="form-control" required="required"/></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="board_title" class="form-control" required="required" /></td>
			</tr>			
			<tr>
				<th>Content</th>
				<td><textarea name="board_cont" class="form-control" cols="30" rows="10" ></textarea></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="Password" name="board_pwd" class="form-control" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="Write" class="btn btn-primary"/>
				<input type="reset" value="Rewrite" class="btn btn-warning"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>