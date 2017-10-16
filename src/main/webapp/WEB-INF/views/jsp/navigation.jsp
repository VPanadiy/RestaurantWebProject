<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<!-- HEADER -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Navigation">
    <meta name="author" content="VPanadiy">

    <title>Navigation</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script type="text/javascript" src="../../../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../../../resources/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../../resources/js/html5shiv.min.js"></script>
    <script type="text/javascript" src="../../../../resources/js/respond.min.js"></script>
    <![endif]-->

    <link rel="icon" type="image/x-icon"
          href="<s:url value="../../../../resources/images/favicon.ico"/>"/>
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
<h1 class="h1Center"><spring:message code="restaurantName" text="Restaurant \"DREAM DISH\""/></h1>

<table class="tableMain" align="center">
    <tr>
        <td width="10%"><a href="<c:url value="/"/>"><spring:message code="home" text="Home"/></a></td>
        <td width="10%"><a href="<c:url value="/personal"/>"><spring:message code="personal" text="Personal"/></a></td>
        <td width="10%"><a href="<c:url value="/plan"/>"><spring:message code="plan" text="Plan"/></a></td>
        <td width="10%"><a href="<c:url value="/contacts"/>"><spring:message code="contacts" text="Contacts"/></a></td>
        <td>
            <form style="margin: 5px" id="searchForm" action="<c:url value="/searchPage"/>" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <label for="searchButton"><spring:message code="search" text="Search"/>:</label><input class="inputMain"
                                                                                                       type="text"
                                                                                                       id="searchButton"
                                                                                                       name="searchButton"
                                                                                                       placeholder="<spring:message code="search" text="Search"/>"><input
                    id="searchSubmit" class="inputMain" type="submit"
                    value="<spring:message code="search" text="Search"/>">
            </form>
        </td>
        <td width="10%"><a href="<c:url value="/login"/>"><spring:message code="login" text="Login"/></a></td>
    </tr>
</table>
</body>
<!-- /MAIN SECTION -->
</html>
