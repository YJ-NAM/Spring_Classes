<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력</title>
</head>
<body>
	<div>
		<hr />
		<h3>MEMBER10 테이블 회원 등록</h3>
		<hr />
		<br>
		<form action="${ pageContext.request.contextPath }/member_insert_Ok.do" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="memid" /></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" name="memname" /></td>
				</tr>			
				<tr>
					<th>Password</th>
					<td><input type="password" name="pwd" /></td>
				</tr>			
				<tr>
					<th>Age</th>
					<td><input type="text" name="age" /></td>
				</tr>			
				<tr>
					<th>Mileage</th>
					<td><input type="text" name="mileage" /></td>
				</tr>			
				<tr>
					<th>Address</th>
					<td><input type="text" name="addr" /></td>
				</tr>
				<tr>
					<th>Job</th>
					<td><input type="text" name="job" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="JOIN" />
						<input type="reset"  value="REWRITE"/>
					</td>
				</tr>			
			</table>
		</form>
	</div>
</body>
</html>