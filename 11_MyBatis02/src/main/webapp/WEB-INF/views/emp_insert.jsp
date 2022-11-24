<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="jlist" value="${ jList }" />
<c:set var="mlist" value="${ mList }" />
<c:set var="dlist" value="${ dList }" />
<!-- 수정 -->
<c:if test="${ !empty modify }" > 
	<c:set var="required" value="" />
	<c:set var="disabled" value="disabled='disabled'" />
	<c:set var="page" value="emp_modify_ok.do" />
	<c:set var="word" value="Modify" />
	<c:set var="autofocus" value="" />
	<c:set var="empno" value="empno" />
</c:if>
<!-- 생성 -->
<c:if test="${ empty modify }" >
	<c:set var="required" value="required='required'" />
	<c:set var="disabled" value="" />
	<c:set var="page" value="emp_insert_ok.do" />
	<c:set var="word" value="Register" />
	<c:set var="autofocus" value="autofocus" />
	<c:set var="empno" value="" />
</c:if>
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
	
	$(function() {
		$("input[name='empno']").on("keyup", function() {
			let empNo = $(this).val().trim();
			let pattern = /^\d{4}$/;
			if(empNo != "") {
				$("#msg").show().html("Enter a 4-digit number.");	                    
		        $.ajax({
		        	contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		            type : "POST",
		            url : "empno_check.do",
		            data : { empno : empNo },
		            dataType: 'text',
		            success : function(data) {
		                console.log(data);
		                if(data > 0){
		                    $("#msg").show().html("This number is already in use.");
		                }else{	             
		                    if(!pattern.test(empNo)) {
			                	$("#msg").show().html("Enter a 4-digit number.");
		                    }else {
			                	$("#msg").hide();
		                    }
		                }
		            },
		            error : function(e){
		                alert("Error : " + e.status);
		            }
		        });
			}
		});
	});
	
	// 유효성 검사
	function validateForm(form) {
		
		let empNo = $("input[name='empno']").val().trim();
		let pattern = /^\d{4}$/;
		let result = false;
		
		// empno 조건검사
	    if(!pattern.test(empNo)) {
	        alert("Enter a 4-digit number.");
	        form.empno.focus();
	        form.empno.value = "";
        	$("#msg").hide();
	        return false;
	    }  
		
	 	// empno 중복검사
		if(empNo != "") {
	        $.ajax({
	        	contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	            type : "POST",
	            url : "empno_check.do",
	            data : { empno : empNo },
	            dataType: 'text',
	            async : false,
	            success : function(data) {
	                if(data > 0){
						alert("This number is already in use.");
						result = false;
						form.empno.focus();
						form.empno.value = "";
	                	$("#msg").hide();
	                }
	            },
	            error : function(e){
	                alert("Error : " + e.status);
	            }
	        });
	        return result;
		}
	}
	
</script> 
</head>
<body>
	<div class="wrap">
		<br />
		<div class="title_container py-3">
			<c:if test="${ empty modify }">
			<h3>Register new Employee</h3>
			</c:if>
			<c:if test="${ !empty modify }">
			<h3>Modify ${ modify.ename }</h3>
			</c:if>
		</div>
		<br />
		<form name="empnoForm" action="${ pageContext.request.contextPath }/${ page }" method="post" onsubmit="return validateForm(this);">
		<input type="hidden" value="${ modify.empno }" name="${ empno }" />
		<table class="table table-bordered align-middle">
		<tr>
		<th class="col-3">No</th>
		<td class="col-9">
		<input type="text" name="empno" class="form-control" ${ required } ${ disabled } ${ autofocus } value="${ modify.empno }"/>
			<c:if test="${ empty modify }">
			<div class="d-flex align-middle">
				<span id="msg" class="text-left">Only numbers can be entered.</span>
			</div>
			</c:if>		
		</td>
		</tr>
		<tr><th>Name</th><td><input type="text" name="ename" class="form-control" ${ required } ${ disabled } value="${ modify.ename }"/></td></tr>
		<tr><th>Job</th>
			<td>
				<select name="job" class="form-select" >
					<c:if test="${ empty jlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty jlist }">
						<c:forEach items="${ jlist }" var="job">
						<option value="${ job }"<c:if test="${ job eq modify.job }">selected="selected"</c:if>>${ job }</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr><th>Manager</th>
			<td>
				<select name="mgr" class="form-select" >
					<c:if test="${ empty mlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty mlist }">
						<c:forEach items="${ mlist }" var="mgr">
						<option value="${ mgr.empno }"<c:if test="${ mgr.empno eq modify.mgr }">selected="selected"</c:if>>${ mgr.ename }[${ mgr.empno }]</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr><th>Salary</th><td><input type="text" name="sal" class="form-control" ${ required } value="${ modify.sal }" /></td></tr>
		<tr><th>Commission</th><td><input type="text" name="comm" class="form-control" ${ required } value="${ modify.comm }" /></td></tr>
		<tr><th>Department</th>
			<td>
				<select name="deptno" class="form-select" >
					<c:if test="${ empty dlist }">
						<option value="">None</option>
					</c:if>
					<c:if test="${ not empty dlist }">
						<c:forEach items="${ dlist }" var="dept">
						<option value="${ dept.deptno }"<c:if test="${ dept.deptno eq modify.deptno }">selected="selected"</c:if>>${ dept.dname }[${ dept.deptno }]</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="${ word }" class="btn btn-outline-success" />
				<input type="reset" value="Rewrite" class="btn btn-outline-warning"/>
				<input type="button" value="List" class="btn btn-outline-secondary" onclick="location.href='emp_list.do'"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>