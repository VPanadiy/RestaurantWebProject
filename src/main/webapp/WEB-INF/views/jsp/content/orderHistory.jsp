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
    <meta name="description" content="Order history">
    <meta name="author" content="VPanadiy">

    <title>Order history</title>

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

<h1 class="h1Center"><spring:message code="menu" text="Menu"/></h1>

<table class="tableMain">

    <tr>
        <th><spring:message code="id" text="Id"/></th>
        <th>
            <form:form action="/tableFilter" modelAttribute="orders" method="POST">
                <label for="searchButton"><spring:message code="filter" text="Filter"/>:</label><input class="inputMain"
                                                                                                       type="text"
                                                                                                       id="searchButton"
                                                                                                       name="tableNumber"
                                                                                                       placeholder="<spring:message code="tableNumber" text="Table number"/>"><input
                    id="searchSubmit" class="inputMain" type="submit" style="width: 100px; padding-top: 3px;"
                    value="<spring:message code="filter" text="Filter"/>">
            </form:form>
        </th>
        <th>
            <form:form action="/dateOrderFilter" modelAttribute="orders" method="POST">
                <label for="searchButton"><spring:message code="filter" text="Filter"/>:</label><input class="inputMain"
                                                                                                       type="date"
                                                                                                       id="searchButton"
                                                                                                       name="dateOrder"
                                                                                                       placeholder="<spring:message code="dateOrder" text="Date order"/>"><input
                    id="searchSubmit" class="inputMain" type="submit" style="width: 100px; padding-top: 3px;"
                    value="<spring:message code="filter" text="Filter"/>">
            </form:form>
        </th>
        <th>
            <form:form action="/employeeFilter" modelAttribute="orders" method="POST">
                <label for="searchButton"><spring:message code="filter" text="Filter"/>:</label><input class="inputMain"
                                                                                                       type="text"
                                                                                                       id="searchButton"
                                                                                                       name="employeeName"
                                                                                                       placeholder="<spring:message code="employee" text="Employee"/>"><input
                    id="searchSubmit" class="inputMain" type="submit" style="width: 100px; padding-top: 3px;"
                    value="<spring:message code="filter" text="Filter"/>">
            </form:form>
        </th>
        <th><spring:message code="status" text="Status"/></th>
    </tr>

    <c:forEach items="${orders}" var="order">
        <tr>
            <td>${order.id}</td>
            <td>${order.tableNumber}</td>
            <td>${order.dateOrder}</td>
            <td>${order.waiter.name}</td>
            <td>${order.closed}</td>
        </tr>
    </c:forEach>

</table>

</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
