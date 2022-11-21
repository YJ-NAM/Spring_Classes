<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${ modify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<script>
/* 	
 	function validateForm(form) {
		if(form.board_pwd.value == ${ dto.board_pwd }){
			return true;
		}else {
			alert('비밀번호를 확인해주세요.');
			return false;
		}
	} 
*/
</script>
</head>
<body>
	<div class="wrap">
		<hr />
		<h3>Write Form</h3>
		<hr />
		<form name="modifyForm" method="post" action="${ pageContext.request.contextPath }/board_modify_ok.do" onsubmit="return validateForm(this);">
		<input type="hidden" name="board_no" value="${ dto.board_no }"/>
		<input type="hidden" name="db_pwd" value="${ dto.board_pwd }"/>
		<table class="table align-middle">
			<tr>
				<th>Writer</th>
				<td><input type="text" name="board_writer" value="${ dto.board_writer }" class="form-control" required="required"/></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="board_title" value="${ dto.board_title }" class="form-control" required="required" /></td>
			</tr>			
			<tr>
				<th>Content</th>
				<td><textarea name="board_cont" class="form-control" cols="30" rows="10" >${ dto.board_cont }</textarea></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="Password" name="board_pwd" class="form-control" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="Modify" class="btn btn-success"/>
				<input type="reset" value="Rewrite" class="btn btn-warning"/>
				<input type="button" value="List" class="btn btn-secondary" onclick="location.href='board_list.do'"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>