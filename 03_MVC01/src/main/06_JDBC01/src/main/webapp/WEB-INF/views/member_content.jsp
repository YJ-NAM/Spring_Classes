<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${ Cont }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	}
</style>
</head>
<body>
	<div>
		<c:if test="${ empty dto }">
			<tr>
				<td colspan="2">
					<h3>No data</h3>
				</td>
			</tr>
		</c:if>
		<c:if test="${ !empty dto }">
		<hr />
		<h3>${ dto.memid }(${ dto.memname })님 환영합니다.</h3>
		<hr />
		<br>
		<table>				
			<tr>
				<th>No</th>
				<td>${ dto.num }</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${ dto.memid }</td>
			</tr>
			<tr>
				<th>Name</th>
				<td>${ dto.memname }</td>
			</tr>			
			<tr>
				<th>Password</th>
				<td>****</td>
			</tr>			
			<tr>
				<th>Age</th>
				<td>${ dto.age }</td>
			</tr>			
			<tr>
				<th>Mileage</th>
				<td>${ dto.mileage }</td>
			</tr>			
			<tr>
				<th>Address</th>
				<td>${ dto.addr }</td>
			</tr>
			<tr>
				<th>Job</th>
				<td>${ dto.job }</td>
			</tr>
			<tr>
				<th>Registered Date</th>
				<td>${ dto.regdate.substring(0, 10) }</td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="MODIFY" onclick="location.href='member_update.do?num=${ dto.num }'"/>
					<input type="button" value="DELETE" 
					onclick="if(confirm('Do you really want to delete it?')) { location.href='member_delete.do?num=${ dto.num }' }else { return; }"/>
					<input type="button" value="LIST" onclick="location.href='member_list.do?'"/>
				</td>
			</tr>		
		</table>
		</c:if>	
			
	</div>
</body>
</html>