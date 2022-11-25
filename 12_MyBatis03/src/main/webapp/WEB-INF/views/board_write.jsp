<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("newline", "\n"); %>
<!-- 생성 -->
<c:if test="${ empty modify }" >
<c:set var="required" value="required='required'" />
<c:set var="disabled" value="" />
<c:set var="address" value="board_write_ok.do" />
<c:set var="word" value="Save" />
<c:set var="board_no" value="" />
</c:if>
<!-- 수정 -->
<c:if test="${ not empty modify }" >
<c:set var="required" value="" />
<c:set var="disabled" value="disabled='disabled'" />
<c:set var="address" value="board_modify_ok.do" />
<c:set var="word" value="Modify" />
<c:set var="board_no" value="board_no" />
</c:if>
<html>
<head>
	<title>Write</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">	
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>

	function pwdCheck(form) {
		let pwd = $("input[name='board_pwd']").val().trim();
		if(${ modify.board_pwd } == pwd){
			return true;
		}else {
			alert('Please recheck your password.');
			$("input[name='board_pwd']").focus();
			$("input[name='board_pwd']").val("");
			return false;
		}
	}

</script>
</head>
<body>
	<div class="wrap">
		<br />	
		<div class="subTitle">
			<h3><a href="${ pageContext.request.contextPath }/">Write Something Here!</a></h3>
		</div>
		<br />
		<form name="modifyForm" action="${ pageContext.request.contextPath }/${ address }" method="post" onsubmit="return pwdCheck(this);">
		<input type="hidden" name="${ board_no }" value="${ modify.board_no }" />
		<input type="hidden" name="page" value="${ page }" />
		<table class="table align-middle">
			<tr>
				<th>Writer</th>
				<td><input type="text" class="form-control" name="board_writer" ${ required } ${ disabled } value="${ modify.board_writer }" /></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" class="form-control" name="board_title" ${ required } value="${ modify.board_title }" /></td>
			</tr>
			<tr>
				<th>Content</th>				
				<td><textarea class="form-control" name="board_cont" cols="30" rows="10">${fn:replace(modify.board_cont, newline, "<br/>")}</textarea></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" class="form-control" name="board_pwd" ${ required } /></td>
			</tr>
			<tr>
				<td colspan="2">
				<button class="btn btn-secondary" type="button" onclick="location.href='board_list.do'">List</button>
				<button class="btn btn-light" type="reset">Rewrite</button>
				<button class="btn btn-dark" type="submit">${ word }</button>
				</td>
			</tr>			
		</table>
		</form>
	</div>
</body>
</html>
