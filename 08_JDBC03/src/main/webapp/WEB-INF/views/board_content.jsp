<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="dto" value="${ cont }" />    
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
	<div>
		<c:if test="${ empty dto }">
			<tr>
				<td colspan="4">no data</td>
			</tr>
		</c:if>	
		<c:if test="${ not empty dto }">
		<hr />
		<h3>${ dto.board_cont }</h3>
		<hr />
		<br />
		<table class="table" >
			<tr class="col-sm-2" >
				<td align="left"><strong>작성자</strong> ${ dto.board_writer }</td>
				<td colspan="2"></td>
				<td align="right"><strong>조회수</strong> ${ dto.board_hit }</td>
			</tr>
			<tr>
				<td align="left"><strong>제목</strong> ${ dto.board_title }</td>
				<td colspan="2"></td>				
				<c:if test="${ not empty dto.board_update }">		
					<td align="right"><strong>최종수정일</strong> ${ dto.board_update.substring(0,10) }</td>			
				</c:if>		
				<c:if test="${ empty dto.board_update }">
					<td align="right"><strong>작성일</strong> ${ dto.board_date.substring(0,10) }</td>
				</c:if>		
			</tr>			
			<tr>
				<td colspan="5" height="300px" align="left" valign="top">${ dto.board_cont }</td>
			</tr>	
			<tr>
				<td colspan="5">
				<input type="button" value="Modify" class="btn btn-success btn-md" onclick="location.href='board_modify.do?no=${ dto.board_no }';" />
				<input type="button" value="Delete" class="btn btn-danger btn-md" onclick="if(confirm('정말 삭제하시겠습니까? 삭제 시 복구할 수 없습니다.')){ location.href='board_delete.do?no=${ dto.board_no }'; }else { return; }" />
				<input type="button" value="List" class="btn btn-secondary btn-md" onclick="location.href='board_list.do';" />
				</td>
			</tr>		
		</table>
		</c:if>
	</div>
</body>
</html>