<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

    <link href="resources/css/home.css" rel="stylesheet"/>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>

<body>

<form method="POST" action="j_spring_security_check" class="box login">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <fieldset class="boxBody">
        <label> Username </label> <input type='text' name='user_login' value=''>
        <label> Password </label> <input type='password' name='password_login'/>
    </fieldset>

    <footer>
        <input type="submit" class="btnLogin" value="Submit">

        <c:if test="${not empty error}">
            <span class="error">${error}</span>
        </c:if>
    </footer>

</form>

</body>
</html>