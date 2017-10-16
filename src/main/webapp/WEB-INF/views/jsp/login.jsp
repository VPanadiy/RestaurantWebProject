<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page errorPage="error.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<!-- HEADER -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Login page">
    <meta name="author" content="VPanadiy">

    <title>Log in with your account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script type="text/javascript" src="../../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../resources/js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/respond.min.js"></script>
    <![endif]-->

    <link rel="icon" type="image/x-icon"
          href="<s:url value="../../../resources/images/favicon.ico"/>"/>
</head>
<!-- /HEADER -->
<!-- MAIN SECTION -->
<body>

<spring:message code="language" text="Language :"/><a href="?lang=en"><spring:message code="english"
                                                                                      text="English"/></a> | <a
        href="?lang=ru"><spring:message code="russia" text="Russia"/></a> | <a href="?lang=ua"><spring:message
        code="ukraine" text="Ukraine"/></a>
<spring:message code="locale" text="Current Locale : "/>${pageContext.response.locale}

<h2 id="h2Time"><spring:message code="timeNow" text="Time now is:"/> ${currentTime}</h2>

<div class="container">

    <form method="POST" action="j_spring_security_check" class="form-signin">
        <h2 class="form-heading"><spring:message code="login" text="Login"/></h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">

            <input name="user_login" type="text" class="form-control"
                   placeholder="<spring:message code="username" text="Username"/>"
                   autofocus/>
            <input name="password_login" type="password" class="form-control"
                   placeholder="<spring:message code="password" text="Password"/>"/>

            <c:if test="${not empty error}">
                <span class="error">${error}</span>
            </c:if>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <footer>
                <input name="_spring_security_remember_me" type="checkbox"/><spring:message code="rememberMe"
                                                                                            text="Remember me?"/><br/>

                <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="login"
                                                                                               text="Log in"/></button>
                <h4 class="text-center"><a href="<c:url value="/registration"/>"><spring:message code="createAccount"
                                                                                                 text="Create an account"/></a>
                </h4>
            </footer>

        </div>

    </form>

</div>
</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>
</footer>
<!-- /FOOTER -->
</html>