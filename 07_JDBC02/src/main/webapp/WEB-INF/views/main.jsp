<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div>
		<hr />
		<h3>MAIN PAGE</h3>
		<hr />
		<br>
		<a href="${ pageContext.request.contextPath }/product_list.do">Product List</a>
	</div>
</body>
</html>
