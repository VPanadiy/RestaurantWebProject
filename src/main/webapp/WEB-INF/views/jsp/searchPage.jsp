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
    <meta name="description" content="Dish search page">
    <meta name="author" content="VPanadiy">

    <title>Search Page</title>

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

<%@ include file="navigation.jsp" %>

<h1 class="h1Center"><spring:message code="searchResult" text="Search Result"/>:</h1>

<c:choose>
    <c:when test="${dishes.size() != 0}">
        <table class="tableMain">

            <tr>
                <th><spring:message code="id" text="Id"/></th>
                <th><spring:message code="name" text="Name"/></th>
                <th><spring:message code="weight" text="Weight"/></th>
                <th><spring:message code="cost" text="Cost"/></th>
                <th><spring:message code="category" text="Category"/></th>
            </tr>

            <c:forEach items="${dishes}" var="dish" varStatus="index">
                <tr>
                    <td>${index.count}</td>
                    <td class="thLeft"><a href="/dish/${dish.name}">${dish.name}</a></td>
                    <td>${dish.weight}</td>
                    <td>${dish.cost}</td>
                    <td>${dish.menu.name}</td>
                </tr>
            </c:forEach>

        </table>
    </c:when>
    <c:otherwise>
        <p class="nothingFound"><spring:message code="nothingFound" text="Nothing found"/>!</p>
    </c:otherwise>
</c:choose>
</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
