<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/css.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">	
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>

	.btn-outline-info {
		color: black !important;
		border: #eec9d2 1px solid;
	}
	
	.btn-outline-info:hover {
		background-color: #f6abb6 !important;
		border: #eec9d2 1px solid;
	}
	
	.material-symbols-outlined {
		color: red;
		font-size: 2em;	
		font-weight: bolder;
	}
	
</style>
</head>
<body>
	<div class="wrap">
		<hr />
		<h3>EMP Main Page</h3>
		<hr />
		<br />
		<p class="mb-4">If you want to see all employees's list of EMP company, please click the button below.</p>
		<p><span class="material-symbols-outlined">arrow_downward</span></p>
		<a class="btn btn-outline-info" href="${ pageContext.request.contextPath }/emp_list.do">All Employees's List</a>
	</div>
</body>
</html>
