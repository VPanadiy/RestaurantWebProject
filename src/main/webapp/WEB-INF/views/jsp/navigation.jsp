<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<body onload="startTime()">
<spring:message code="language" text="Language :"/><a href="?lang=en"><spring:message code="english"
                                                                                      text="English"/></a> | <a
        href="?lang=ru"><spring:message code="russia" text="Russia"/></a> | <a href="?lang=ua"><spring:message
        code="ukraine" text="Ukraine"/></a>
<spring:message code="locale" text="Current Locale : "/>${pageContext.response.locale}

<h2 id="h2Time"><spring:message code="timeNow" text="Time now is:"/>
    <div id="txt"></div>
</h2>

<div style="clear: both">
    <p>Currency for ${currency[0].date}</p>
    <c:forEach items="${currency}" var="cur">
        <c:choose>
            <c:when test="${'USD'.equals(cur.chars) || 'EUR'.equals(cur.chars) || 'RUB'.equals(cur.chars)}">
                <td>${cur.chars}</td>
                <td><fmt:formatNumber value="${cur.rate/cur.size}" maxFractionDigits="2"/></td>
            </c:when>
        </c:choose>
    </c:forEach>
</div>

<h1 class="h1Center"><spring:message code="restaurantName" text="Restaurant \"DREAM DISH\""/></h1>

<table class="tableMain" align="center">
    <tr>
        <td width="10%"><a href="<c:url value="/"/>"><spring:message code="home" text="Home"/></a></td>
        <td width="10%"><a href="<c:url value="/personal"/>"><spring:message code="personal" text="Personal"/></a></td>
        <td width="10%"><a href="<c:url value="/plan"/>"><spring:message code="plan" text="Plan"/></a></td>
        <td width="10%"><a href="<c:url value="/contacts"/>"><spring:message code="contacts" text="Contacts"/></a></td>
        <td>
            <form:form style="margin: 5px" id="searchForm" action="/searchPage" method="POST">
                <label for="searchButton"><spring:message code="search" text="Search"/>:</label><input class="inputMain"
                                                                                                       type="text"
                                                                                                       id="searchButton"
                                                                                                       name="searchButton"
                                                                                                       placeholder="<spring:message code="search" text="Search"/>"><input
                    id="searchSubmit" class="inputMain" type="submit"
                    value="<spring:message code="search" text="Search"/>">
            </form:form>
        </td>
        <td width="10%">
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal.authenticated}">
                    <c:choose>
                        <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                            <a href="<c:url value="/admin"/>"><spring:message code="admin"
                                                                              text="Administrator page"/></a><br>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="/account"/>"><spring:message code="userPage"
                                                                                text="User page"/></a><br>
                        </c:otherwise>
                    </c:choose>
                    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                        <input type="submit" value="<spring:message code="logout" text="Logout"/>"/>
                    </form:form>
                </c:when>
                <c:otherwise><a href="<c:url value="/login"/>"><spring:message code="login"
                                                                               text="Login"/></a></c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>

<script>
    function startTime() {
        var today = new Date();
        var hours = today.getHours();
        var minutes = today.getMinutes();
        var seconds = today.getSeconds();
        var day = today.getDate();
        var year = today.getFullYear();

        var weekday = new Array(7);
        weekday[0] = "Sunday";
        weekday[1] = "Monday";
        weekday[2] = "Tuesday";
        weekday[3] = "Wednesday";
        weekday[4] = "Thursday";
        weekday[5] = "Friday";
        weekday[6] = "Saturday";

        var dayName = weekday[today.getDay()];

        var month = new Array(12);
        month[0] = "January";
        month[1] = "February";
        month[2] = "March";
        month[3] = "April";
        month[4] = "May";
        month[5] = "June";
        month[6] = "July";
        month[7] = "August";
        month[8] = "September";
        month[9] = "October";
        month[10] = "November";
        month[11] = "December";

        var monthName = month[today.getMonth()];

        minutes = checkTime(minutes);
        seconds = checkTime(seconds);
        document.getElementById('txt').innerHTML =
            monthName + " " + day + ", " + year + " | " + dayName + ", " + hours + ":" + minutes + ":" + seconds;
        var t = setTimeout(startTime, 500);
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        }
        ;  // add zero in front of numbers < 10
        return i;
    }
</script>
</body>
<!-- /MAIN SECTION -->
</html>
