<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
    <meta name="description" content="Dish page">
    <meta name="author" content="VPanadiy">

    <title>Dish</title>

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

<h1 class="h1Center"><spring:message code="dish" text="Dish"/></h1>

<table class="tableMain">
    <tr>
        <th><spring:message code="image" text="Image"/></th>
        <th colspan="2"><spring:message code="description" text="Description"/></th>
    </tr>
    <tr>
        <td rowspan="5"><img width="255" height="255" src="<c:url value="/resources/images/dishes/${dish.name}.jpg"/>"/></td>
        <td><spring:message code="name" text="Name"/></td>
        <td>${dish.name}</td>
    </tr>
    <tr>
        <td><spring:message code="cost" text="Cost"/></td>
        <td>${dish.cost}</td>
    </tr>
    <tr>
        <td><spring:message code="weight" text="Weight"/></td>
        <td>${dish.weight}</td>
    </tr>
    <tr>
        <td><spring:message code="category" text="Category"/></td>
        <td>${dish.menu.name}</td>
    </tr>
    <tr>
        <td><spring:message code="ingredients" text="Ingredients"/></td>
        <td>${dish.ingredients}</td>
    </tr>
</table>
</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
