<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page errorPage="../error.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<!-- HEADER -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="User page">
    <meta name="author" content="VPanadiy">

    <title>User page</title>

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

<%@ include file="../navigation.jsp" %>

<h1 class="h1Center">${users.username}</h1>


<div class="container" style="width: 575px;">

    <p align="center">
        <c:choose>
            <c:when test="${userImage.length() != null}">
                <img style="border: solid black 1px" width="100px" height="100px"
                     src="data:image/jpeg;base64,${userImage}"/>
            </c:when>
            <c:otherwise>
                <img style="border: solid black 1px" width="100px" height="100px"
                     src="../../../../resources/images/defaultAvatar.png">
            </c:otherwise>
        </c:choose>
    </p>

    <fieldset>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="username" text="Username"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="username" text="Username"/>" autofocus="true" value="${users.username}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="lastName" text="Last Name"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="lastName" text="Last Name"/>" value="${users.lastName}"/>
        </div>

        <div class="form-group"  style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="firstName" text="First Name"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="firstName" text="First Name"/>" value="${users.firstName}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="email" text="Email"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="email" text="Email"/>" value="${users.email}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="password" text="Password"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="password" text="Password"/>" value="${users.password}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="dateBirth" text="Date Birth"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="dateBirth" text="Date Birth"/> <spring:message code="eg" text="eg"/>. <spring:message code="dateFormat" text="dd/mm/yyyy"/>" value="${users.dateBirth}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="gender" text="Gender"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="gender" text="Gender"/>" value="${users.gender}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="phoneNumber" text="Phone number"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="phoneNumber" text="Phone number"/> <spring:message code="eg" text="eg"/>. +38(044)123-45-67" value="${users.phoneNumber}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="emailReserve" text="Reserved Email"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="emailReserve" text="Reserved Email"/>" value="${users.secondEmail}"/>
        </div>

        <div class="form-group" style="overflow: auto; margin-bottom: 0">
            <label class="labelInline"><spring:message code="country" text="Country"/>:</label>
            <input type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="country" text="Country"/>" value="${users.country}"/>
        </div>

    </fieldset>

    <footer>

    </footer>

</div>

</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>