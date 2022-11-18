<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<hr width="30%">
		<h3>회원가입 폼 페이지</h3>
		<hr width="30%">
		<br />

		<form method="post"
			action="<%=request.getContextPath() %>/member_insert_ok.do">
			<table class="table table-bordered" style="width: 36em">

				<tr>
					<th>아이디</th>
					<td><input name="memid"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="memname"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<th>직업</th>
					<td><input name="job"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원등록"> <input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>