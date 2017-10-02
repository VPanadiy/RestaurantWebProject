<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Access denied!</title>
</head>
<body>
		<h1>Доступ закрыт!</h1>
	<h2>${errorMsg}</h2>


		<h2>Sorry, you do not have permission to view this page.</h2>

		Click <a href="<c:url value="/" /> ">here</a>
		to go back to the Homepage.
</body>
</html>