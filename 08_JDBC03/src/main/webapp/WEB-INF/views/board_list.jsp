<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="list" value="${ list }" />
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
	<div class="wrap">
		<hr />
		<h3>BOARD List Page</h3>
		<hr />
		<br />
		<table class="table">
			<tr class="table table-success">
				<th>게시물 No</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>				
			</tr>
			<c:if test="${ not empty list }">
			<c:forEach items="${ list }" var="i">
				<tr>
					<td>${ i.board_no }</td>
					<td><a href="${ pageContext.request.contextPath }/board_content.do?no=${ i.board_no }">${ i.board_title }</a></td>
					<td>${ i.board_hit }</td>
					<td>${ i.board_date.substring(0,10) }</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${ empty list }">	
				<tr>
					<td colspan="4">
						<h3>No data</h3>
					</td>
				</tr>		
			</c:if>
			<tr>
				<td colspan="4" >
					<input type="button" value="Write" class="btn btn-primary" onclick="location.href='board_write.do'" />
					<c:if test="${ not empty search }">
					<input type="button" value="List" class="btn btn-secondary" onclick="location.href='board_list.do'" />
					</c:if>
				</td>
			</tr>	
		</table>
		<br />
		<div id="search">
			<form method="post" action="${ pageContext.request.contextPath }/board_search.do">
			<div class="input-group w-75">
				<div class="w-25">
				<select class="form-select" name="field">
					<option value="all"<c:if test="${ field eq 'all' }">selected="selected"</c:if>>전체</option>
					<option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
					<option value="cont"<c:if test="${ field eq 'cont' }">selected="selected"</c:if>>내용</option>
					<option value="writer"<c:if test="${ field eq 'writer' }">selected="selected"</c:if>>작성자</option>
				</select>
				</div>
				<input type="text" name="keyword" class="form-control"/>
				<button type="submit" class="btn btn-success ml-1" >Search</button>
			</div>
			</form>
		</div>
	</div>
	<br />
	<br />
	<br />
</body>
</html>