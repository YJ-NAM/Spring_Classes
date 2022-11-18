<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Cont }" />
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
body{
background-color: #f2f0f0;
}
</style>
</head>
<body>
	<div align="center">
		<br>

		<h3 style="font-weight: bold; color: FloralWhite; text-shadow: 2px 2px 0 #ffd217, 5px 5px 0 #5ac7ff, 7px 7px 0 #ffd217, 10px 10px 0 #5ac7ff;">MEMBER10 테이블 [${dto.memname }] 회원 상세 정보</h3>

		<br>
		<table class="table table-dark table-hover" style="width: 36em">
			<c:if test="${!empty dto }">

				<tr>
					<th>회원번호</th>
					<td>${dto.num }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${dto.memid }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.memname }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
						<td>
							<c:if test="${dto.pwd.length() != 0 }">
								<c:forEach begin="1" end="${dto.pwd.length() }">
		            				*
		            			</c:forEach>
							</c:if>
						</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${dto.age }</td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td>${dto.mileage }</td>
				</tr>
				<tr>
					<th>직업</th>
					<td>${dto.job }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${dto.addr }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${dto.regdate.substring(0,10) }</td>
				</tr>

			</c:if>
			<c:if test="${empty dto }">
				<td colspan="2" align="center">
					<h3>회원에 대한 정보가 없습니다.</h3>
				</td>
			</c:if>

			<tr>
				<td colspan="2" align="center">
					<input type="button"
					value="회원 수정"
					onclick="location.href='<%=request.getContextPath() %>/member_update.do?num=${dto.num }'">
					<input type="button" value="회원 삭제"
					onclick="if(confirm('정말로 회원을 삭제하시겠습니까?')){
					location.href='<%=request.getContextPath() %>/member_delete.do?num=${dto.num }'} 
					else{return; }">
					<input type="button" value="회원 목록"
					onclick="location.href='member_list.do'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>