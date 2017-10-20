<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page errorPage="../error.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<!-- HEADER -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Employee page">
    <meta name="author" content="VPanadiy">

    <title>Employee</title>

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

<h1 class="h1Center">${employee.surname} ${employee.name}</h1>

<div class="container" style="width: 575px; margin-bottom: 10px;">

    <form:form action="/updateEmployee" modelAttribute="employee" method="POST">

        <fieldset>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="lastName" text="Last Name"/>:</label>
                <input name="surname" type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="lastName" text="Last Name"/>" value="${employee.surname}"/>
            </div>

            <div class="form-group"  style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="firstName" text="First Name"/>:</label>
                <input name="name" type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="firstName" text="First Name"/>" value="${employee.name}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="dateBirth" text="Date Birth"/>:</label>
                <input id="dateBirth" name="dateBirth" type="date" min="${year-200}-01-01" max="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" pattern="yyyy-MM-dd" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="dateBirth" text="Date Birth"/> <spring:message code="eg" text="eg"/>. <spring:message code="dateFormat" text="yyyy-MM-dd"/>" value="${employee.dateBirth}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="phoneNumber" text="Phone number"/>:</label>
                <input name="phoneNumber" type="tel" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="phoneNumber" text="Phone number"/> <spring:message code="eg" text="eg"/>. +38(044)123-45-67" value="${employee.phoneNumber}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="appointment" text="Appointment"/>:</label>
                <input name="position" type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="appointment" text="Appointment"/>" value="${employee.position}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="salary" text="Salary"/>:</label>
                <input name="salary" type="text" class="form-control" style="float: right; width: 320px" placeholder="<spring:message code="salary" text="Salary"/>" value="${employee.salary}"/>
            </div>

        </fieldset>

        <footer>
            <form:form action="/updateEmployee" modelAttribute="employee" method="POST">
                <input type="hidden" name="idEmployee" value="${employee.id}"/>
                <input type="submit" style="margin-top: 10px; margin-bottom: 10px;" class="btn btn-lg btn-primary btn-block" value="<spring:message code="update" text="Update"/>">
            </form:form>

            <form:form action="/deleteEmployee" modelAttribute="employee" method="POST">
                <input type="hidden" name="employeePage" value="true"/>
                <input type="hidden" name="idEmployee" value="${employee.id}"/>
                <input type="submit" style="margin-bottom: 10px;" class="btn btn-lg btn-primary btn-block" value="<spring:message code="delete" text="Delete"/>">
            </form:form>
        </footer>

    </form:form>

</div>

<p class="pRight"><a href="<c:url value="/employees"/>"><spring:message code="goBack" text="← Go back to"/> <spring:message code="employees" text="Employees"/></a></p>

</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
