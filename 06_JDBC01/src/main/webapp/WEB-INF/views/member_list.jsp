<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div align="center">
        <hr width="50%" color="red">
            <h3> MEMBER10 테이블 회원 전체 리스트 페이지</h3>
        <hr width="50%" color="red">
        <br>
        <table border="1" cellspacing="0" width="450">
            <tr>
                <th> 회원 No. </th>
                <th> 회원 이름 </th>
                <th> 회원 직업 </th>
                <th> 가입 일자 </th>
            </tr>
            <c:set var="list" value="${ memList }" />
            <c:if test="${ !empty list }">
                <c:forEach items="${ list }" var="dto">
                    <tr>
                        <td> ${ dto.getNum() } </td>
                        <td><a href="${ pageContext.request.contextPath }/member_content.do?num=${ dto.getNum() }">
                        ${dto.getMemname() } </a></td>
                        <td> ${ dto.getJob() } </td>
                        <td> ${ dto.getRegdate().substring(0,10) }</td>
                    </tr>
                </c:forEach>
            </c:if>

            <c:if test="${ empty list }">
                <tr>
                    <td colspan="4" align="center">
                        <h3>조회된 회원 리스트가 없습니다...</h3>
                    </td>
                </tr>
            </c:if>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="회원등록" onclick="location.href='member_insert.do'" />
				</td>			
			</tr>
        </table>
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/member_search.do">
			<select name="field" id="">
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="job">직업</option>
			</select>
			<input type="text" name="keyword" />&nbsp;&nbsp;
			<input type="submit" value="검색" />
		</form>
    </div>

</body>
</html>