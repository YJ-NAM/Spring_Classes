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
        <hr width="30%" color="blue">
            <h3> 개인 정보 입력 폼 페이지</h3>
        <hr width="30%" color="blue">
        <br>
    <form method="get" action="${ pageContext.request.contextPath }/inputOk">
        <table border="1" cellspacing="0" width="300">
            <tr>
                <th>이름</th>
                <td><input name="name"></td>
            </tr>
            <tr>
                <th>나이</th>
                <td><input name="age"></td>
            </tr>
            <tr>
                <th>연락처</th>
                <td><input name="phone"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="전송"> &nbsp;&nbsp;
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
    </div>
</body>
</html>