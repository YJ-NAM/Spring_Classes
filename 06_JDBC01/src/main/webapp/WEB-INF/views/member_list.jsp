<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
a{
text-decoration: none;
color: white;
}
.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3),
	.input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-control,
	.input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-select,
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating)
	{
	border-start-start-radius: 7px;
	border-end-start-radius: 7px;
}

</style>
</head>
<body>
	<div align="center">

		<br>
		<h3 style="font-weight: bold; color: FloralWhite; text-shadow: 2px 2px 0 #ffd217, 5px 5px 0 #5ac7ff, 7px 7px 0 #ffd217, 10px 10px 0 #5ac7ff; ">Member10 테이블 목록</h3>
		<br>

		<table class="table table-dark table-hover" style="width: 36em">
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>회원직업</th>
				<th>회원가입일</th>
			</tr>
			<c:set var="list" value="${memList }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.num }</td>
						<td><a style="display: block;" href="<%=request.getContextPath() %>/member_content.do?num=${dto.num }">${dto.memname }</a> </td>
						<td>${dto.job }</td>
						<td>${dto.regdate.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>회원리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="4" align="center">
					<input type="button" value="회원등록" onclick="location.href='member_insert.do'">
							<c:if test="${!empty keyword }">
							<input type="button" value="전체목록" onclick="location.href='member_list.do'">
							</c:if>
				</td>
			</tr>
		</table>
		<br />

		<div align="center">
		<div style="width: 38em;">		
			<form method="post" action="<%=request.getContextPath()%>/member_search.do">
				<span class="study_search_left" style="width: 20em"> 
				<span class="col-lg"> 
					<span class="input-group list-search-form w-70">
						<select name="field" class="custom-select col-sm-4">
								<option value="id" <c:if test="${field == 'id'}"> selected="selected"</c:if>>아이디</option>
								<option value="name" <c:if test="${field == 'name'}"> selected="selected"</c:if>>이름</option>
								<option value="job" <c:if test="${field == 'job'}"> selected="selected"</c:if>>직업</option>
						</select> 
						<input type="text" name="keyword" value="${keyword}" class="form-control" style="width: 20em;" />
							<button type="submit" class="btn btn-secondary ml-1"><i class="fa fa-search"></i> 검색
							</button>
					</span>
				</span>
				</span>
			</form>
			</div>
		</div>

	</div>

	<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>