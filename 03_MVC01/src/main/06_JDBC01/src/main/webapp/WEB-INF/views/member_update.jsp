<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${ modify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
		width: 500px;
		margin: 0 auto;
	}
	
	div h3 {
		text-align: center;
	}
	
	div table {
		width: 400px;
		border: 1px solid pink;
		margin: 0 auto;
	}
	
	div table tr th {
		width: 150px;
	}
	
	div table tr td {
		width: 250px;
		text-align: center;
	}
</style>
</head>
<body>
	<div align="center">
		<hr />
			<h3>MEMBER INFORMATION UPDATE PAGE</h3>
		<hr />
		<br>
		<form method="post" action="${ pageContext.request.contextPath }/member_update_Ok.do">
			<input type="hidden" name="num" value="${ dto.num }" />
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="memid" value="${ dto.memid }" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" name="memname" value="${ dto.memname }" readonly="readonly" /></td>
				</tr>			
				<tr>
					<th>Password</th>
					<td><input type="password" name="pwd" value="${ dto.pwd }" readonly="readonly" /></td>
				</tr>			
				<tr>
					<th>Age</th>
					<td><input type="text" name="age" value="${ dto.age }" /></td>
				</tr>			
				<tr>
					<th>Mileage</th>
					<td><input type="text" name="mileage" value="${ dto.mileage }" /></td>
				</tr>			
				<tr>
					<th>Address</th>
					<td><input type="text" name="addr" value="${ dto.addr }" /></td>
				</tr>
				<tr>
					<th>Job</th>
					<td><input type="text" name="job" value="${ dto.job }" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="MODIFY" />
						<input type="reset"  value="REWRITE"/>
					</td>
				</tr>			
			</table>
		</form>
	</div>
</body>
</html>