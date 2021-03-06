<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <meta name="description" content="Admin page">
    <meta name="author" content="VPanadiy">

    <title>Admin page</title>

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

<h1 class="h1Center"><spring:message code="admin" text="Administrator page"/>!</h1>
<h3 class="h3Center"><spring:message code="hello" text="Hello"/> ${user.username}!</h3>

<p><spring:message code="password" text="Password"/>: ${user.password}!</p>
<p><spring:message code="email" text="Email"/>: ${user.email}!</p>

<p><spring:message code="profileImage" text="Profile image"/>:
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

<p><a href="<c:url value="/employees"/>"><spring:message code="employees" text="Employees"/></a></p>
<p><a href="<c:url value="/users"/>"><spring:message code="usersPage" text="Users page"/></a></p>
<p><a href="<c:url value="/warehouse"/>"><spring:message code="warehouse" text="Warehouse"/></a></p>
<p><a href="<c:url value="/dishes"/>"><spring:message code="dishes" text="Dishes"/></a></p>
<p><a href="<c:url value="/menus"/>"><spring:message code="menu" text="Menu"/></a></p>
<p><a href="<c:url value="/orderHistory"/>"><spring:message code="ordersHistory" text="Orders History "/></a></p>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="<spring:message code="logout" text="Logout"/>"/>
</form:form>
</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>