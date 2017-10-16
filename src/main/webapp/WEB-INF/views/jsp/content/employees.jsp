<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
    <meta name="description" content="Employees page">
    <meta name="author" content="VPanadiy">

    <title>Employees</title>

    <link href="${contextPath}../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}../resources/css/common.css" rel="stylesheet">

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

<h1 class="h1Center"><spring:message code="employees" text="Employees"/></h1>

<table class="tableMain" style="align-items: center">
    <tr>
        <th><spring:message code="id" text="Id"/></th>
        <th><spring:message code="lastName" text="Last Name"/></th>
        <th><spring:message code="firstName" text="First Name"/></th>
        <th><spring:message code="appointment" text="Appointment"/></th>
    </tr>

    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.surname}</td>
            <td><a href="/employee/${employee.name}">${employee.name}</a></td>
            <td>${employee.position}</td>
        </tr>
    </c:forEach>

</table>


<p class="pRight"><a href="<c:url value="/admin"/>"><spring:message code="goBack" text="← Go back to"/> <spring:message code="admin" text="Administrator page"/></a></p>


</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
