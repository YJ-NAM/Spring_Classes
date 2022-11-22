<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${ List }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>

	function darkMode() {
		let dark = $("#dark");
		dark.on("click", function() {
			$("body").css("backgroundColor", "black");			
			dark.text("Light");
			dark.toggle()
			dark.removeClass('btn-outline-dark');
			dark.addClass('btn-outline-light');
		});
	}

</script>
</head>
<body>
	<div class="wrap">
		<hr />
		<h3>Member10 회원 List Page</h3>
		<hr />
		<br />
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" id="dark" class="btn btn-outline-dark me-md-2" onclick="darkMode();" >Dark</button>		
		</div>
		<table class="table">
			<tr class="table-success">
				<th class="col-2">No</th> 
				<th class="col-4">Name</th>
				<th class="col-3">Job</th>
				<th class="col-3">Registered Date</th>
			</tr>
			<c:if test="${ not empty list }">
			<c:forEach items="${ list }" var="dto">
			<tr>
				<td>${ dto.num }</td> 
				<td><a href="${ pageContext.request.contextPath }/member_content.do?num=${ dto.num }">${ dto.memname }</a></td>
				<td>${ dto.job }</td>
				<td>${ dto.regdate.substring(0,10) }</td>
			</tr>					
			</c:forEach>			
			</c:if>
			<c:if test="${ empty list }">
			<tr>
				<td colspan="4"><h3>No data</h3></td> 
			</tr>				
			</c:if>
			<tr>
				<td colspan="4">
				<button type="button" class="btn btn-success" onclick="location.href='member_insert.do'">Register</button>
				</td>
			</tr>
		</table>
		<br />
		<div class="search d-inline">
			<form action="${ pageContext.request.contextPath }/member_search.do" method="post">
				<select name="field" class="form-select d-inline w-25" >
					<option value="all">전체</option>
					<option value="id">아이디</option>
					<option value="name">이름</option>
					<option value="job">직업</option>
				</select>
				<input type="text" name="keyword" class="form-control d-inline w-50" />
				<button class="btn btn-secondary" type="submit">Search</button>
			</form>
		</div>
		<br />
	</div>
</body>
</html>