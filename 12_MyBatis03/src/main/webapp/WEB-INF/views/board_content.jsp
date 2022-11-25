<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<c:set var="cont" value="${ cont }" />
<html>
<head>
	<title>Content</title>
</head>
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
		if(${ cont.board_pwd } == pwd){
			return true;
		}else {
			alert('Please recheck your password.');
			$("input[name='board_pwd']").focus();
			$("input[name='board_pwd']").val("");
			return false;
		}
	}
</script>
<body>
	<div class="wrap">
		<br />	
		<div class="subTitle">
			<h3><a href="${ pageContext.request.contextPath }/">Detailed Information of ${ cont.board_title }</a></h3>
		</div>
		<br />
		<table class="table align-middle" id="content_table">
			<tr>
				<th class="col-1">No</th><td class="col-1">${ cont.board_no }</td>
				<th class="col-1">Writer</th><td class="col-1">${ cont.board_writer }</td>
				<th class="col-1">Hit</th><td class="col-1">${ cont.board_hit }</td>
			</tr>
			<tr>
				<th>Title</th>
				<td colspan="5">${ cont.board_title }</td>
			</tr>
			<tr>
				<th>Content</th>
				<td colspan="5">${ cont.board_cont }</td>
			</tr>
			<c:if test="${ empty cont.board_update }">
			<tr>
			<th>Date</th>
				<td colspan="5">${ cont.board_date }</td>
			</tr>
			</c:if>
			<c:if test="${ not empty cont.board_update }">
			<tr>
			<th>Update</th>
				<td colspan="5">${ cont.board_update }</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="6">
				<button class="btn btn-outline-success" type="button" onclick="location.href='board_modify.do?no=${ cont.board_no }&page=${ page }'">Modify</button>
				<button class="btn btn-outline-danger" type="button" data-bs-toggle="modal" data-bs-target="#deleteFunction" >Delete</button>
				<button class="btn btn-outline-secondary" type="button"  onclick="location.href='board_list.do?page=${ page }'">List</button>
				</td>
			</tr>			
		</table>
		
		<form name="pwdForm" action="${ pageContext.request.contextPath }/board_delete.do" method="post" onsubmit="return pwdCheck(this);">
		<input type="hidden" name="page" value="${ page }" />
		<input type="hidden" name="board_no" value="${ cont.board_no }" />
		<div class="modal fade" id="deleteFunction" tabindex="-1" aria-labelledby="deleteFunctionLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="deleteFunctionLabel">Delete Confirm</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<p class="mb-2">Are you sure you want to wipe all data? <br /> Once it's done, it cannot be undone.</p>		 
		       	<p>Password <input type="password" name="board_pwd" class="form-control d-inline w-50" /></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="reset" class="btn btn-warning" >Rewrite</button>		        
		        <button type="submit" class="btn btn-danger" >Delete</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form>
	</div>
</body>
</html>
