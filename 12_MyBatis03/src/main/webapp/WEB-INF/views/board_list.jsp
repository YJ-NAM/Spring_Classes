<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${ list }" />
<c:set var="paging" value="${ paging }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">	
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap">
		<br />
		<div class="subTitle py-3">
		<h3><a href="${ pageContext.request.contextPath }/">Welcome :) You can write whatever you want.</a></h3>
		</div>
		<br />
		<table class="table">
			<thead class="table-light">
			<tr>
				<th class="col-1">No</th>
				<th class="col-2">Title</th>
				<th class="col-1">Writer</th>
				<th class="col-1">Hit</th>
				<th class="col-1">Date</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${ not empty list }">
			<c:forEach items="${ list }" var="dto">
			<tr>
				<td>${ dto.board_no }</td>
				<td><a href="${ pageContext.request.contextPath }/board_content.do?no=${ dto.board_no }&page=${ paging.page }">${ dto.board_title }</a></td>
				<td>${ dto.board_writer }</td>
				<td>${ dto.board_hit }</td>
				<td>${ dto.board_date.substring(0,10) }</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${ empty list }">
			<tr>
				<td colspan="5">
					No data
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="5">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='board_write.do'">Write</button>
					<c:if test="${ not empty keyword }">
					<button type="button" class="btn btn-dark" onclick="location.href='board_list.do'">List</button>
					</c:if>
				</td>
			</tr>
			</tbody>
		</table>
		<br />
		
		<!-- 페이징 처리 부분 -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  
			<!-- 처음으로 -->
			<c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
			<c:if test="${ paging.page gt 1 }"><li class="page-item"></c:if>
			  <a class="page-link" href="board_list.do?page=1" aria-label="First">
			  <span aria-hidden="true">&laquo;</span>
			  </a> 
			</li>
		    
		    <!-- 이전으로 -->
			<c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
			<c:if test="${ paging.page gt paging.block }"><li class="page-item"></c:if>		      
			  <a class="page-link" href="board_list.do?page=${ paging.page - 1 }" aria-label="Previous">
			  <span aria-hidden="true">&lsaquo;</span>
			  </a>
			</li>			   
			       
		    <!-- 페이지 중간 -->
			<c:forEach begin="${ paging.startBlock }" end="${ paging.endBlock }" var="i">
				<c:if test="${ i == paging.page }">
				<li class="page-item active"><a class="page-link" href="board_list.do?page=${ i }">${ i }</a></li>			
				</c:if>
				<c:if test="${ i != paging.page }">
				<li class="page-item"><a class="page-link" href="board_list.do?page=${ i }">${ i }</a></li>				
				</c:if>
			</c:forEach>
	      
	        <!-- 다음으로 -->
		    <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
		    <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
		      <a class="page-link" href="board_list.do?page=${ paging.page + 1 }" aria-label="Next">
		        <span aria-hidden="true">&rsaquo;</span>
		      </a>
		    </li>		      
		      
		    <!-- 마지막으로 -->
		    <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
		    <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
		      <a class="page-link" href="board_list.do?page=${ paging.allPage }" aria-label="Last">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		  </ul>
		</nav>
		
		<div class="d-inline">
			<form action="${ pageContext.request.contextPath }/board_search.do?field=${ field }&keyword=${ keyword }">
			<select name="field" class="form-select d-inline w-25">
				<option value="All"<c:if test="${ field eq 'All' }">selected="selected"</c:if>>All</option>
				<option value="Title"<c:if test="${ field eq 'Title' }">selected="selected"</c:if>>Title</option>
				<option value="Writer"<c:if test="${ field eq 'Writer' }">selected="selected"</c:if>>Writer</option>
				<option value="c"<c:if test="${ field eq 'Writer' }">selected="selected"</c:if>>Content</option>
			</select>
			<input type="text" class="form-control d-inline w-50" name="keyword" value="${ keyword }" />
			<button type="submit" class="btn btn-dark">Search</button>
			</form>
		</div>			
	</div>
</body>
</html>