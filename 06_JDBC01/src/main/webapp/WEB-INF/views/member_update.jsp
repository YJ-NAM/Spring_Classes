<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Update }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER10 회원수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style type="text/css">
.mb-3 {
	width: 50%
}
</style>
</head>
<body>
	<div align="center">

		<h3>회원수정 폼 페이지</h3>

		<br />

		<form method="post"
			action="<%=request.getContextPath() %>/member_update_ok.do">
			
			<input type="hidden" name="num" value="${dto.num }" />
			<table class="table table-bordered" style="width: 36em">

				<tr>
					<th>아이디</th>
					<td><input name="memid" value="${dto.memid }" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="memname" value="${dto.memname }" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" value="${dto.pwd }" readonly></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" value="${dto.age }" }></td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td><input type="number" name="mileage" value="${dto.mileage }" }></td>
				</tr>
				<tr>
					<th>직업</th>
					<td><input name="job" value="${dto.job }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr" value="${dto.addr }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="수정"> <input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>