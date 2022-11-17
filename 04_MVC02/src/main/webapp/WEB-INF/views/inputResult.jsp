<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
    <div align="center">
        <hr width="30%" color="red"> 
            <h3>입력된 개인 정보</h3>
        <hr width="30%" color="red"> 
        <br>
		<table border="1" cellspacing="0" width="300">
            <tr>
                <th>이름</th>
                <td>${ userName }</td>
            </tr>
            <tr>
                <th>나이</th>
                <td>${ userAge }</td>
            </tr>
            <tr>
                <th>연락처</th>
                <td>${ userPhone }</td>
            </tr>
		</table>
	</div>
</body>
</html>