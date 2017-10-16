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
    <meta name="description" content="Registration page">
    <meta name="author" content="VPanadiy">

    <title>Create an account</title>

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

    <script type="text/javascript">
        function doAjax() {
            $.ajax({
                url: 'checkStrength',
                data: ({password: $('#password').val()}),
                success: function (data) {
                    $('#strengthValue').html(data);
                }
            });
        }
    </script>
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

<p class="pLeft" style="display: inline"><a href="<c:url value="/login"/>"><spring:message code="goBack"
                                                                                           text="← Go back to"/>
    <spring:message code="login" text="Login"/></a>
    <span style="float:right;"><a href="<c:url value="/"/>"><spring:message code="home" text="Home"/></a></span>
</p>

<div class="container">

    <form:form method="POST" modelAttribute="users" action="registration" class="form-signin">
        <h2 class="form-signin-heading"><spring:message code="accountCreating" text="Create your account"/></h2>

        <fieldset>

            <div class="form-group">
                <form:label path="username"><spring:message code="username" text="Username"/>:</form:label>
                <spring:message code="username" text="Username" var="username"/>
                <form:input type="text" path="username" class="form-control" placeholder="${username}"
                            autofocus="true"/>
                <form:errors path="username" cssClass="has-error"/>
            </div>

            <div class="form-group">
                <form:label path="lastName"><spring:message code="lastName" text="Last Name"/>:</form:label>
                <spring:message code="lastName" text="Last Name" var="lastName"/>
                <form:input path="lastName" class="form-control" placeholder="${lastName}"/>
            </div>

            <div class="form-group">
                <form:label path="firstName"><spring:message code="firstName" text="First Name"/>:</form:label>
                <spring:message code="firstName" text="First Name" var="firstName"/>
                <form:input path="firstName" class="form-control" placeholder="${firstName}"/>
            </div>

            <div class="form-group">
                <form:label path="email"><spring:message code="email" text="Email"/>:</form:label>
                <spring:message code="email" text="Email" var="email"/>
                <form:input path="email" class="form-control" placeholder="${email}"/>
                <form:errors path="email" cssClass="has-error"/>
            </div>

            <div class="form-group">
                <form:label path="password"><spring:message code="password" text="Password"/>:</form:label>
                <spring:message code="password" text="Password" var="password"/>
                <form:password path="password" class="form-control" placeholder="${password}" onkeyup="doAjax()"/>
                <form:errors path="password" cssClass="has-error"/>
                <span style="float: right" id="strengthValue"></span>
            </div>

            <div class="form-group">
                <form:label path="dateBirth"><spring:message code="dateBirth" text="Date Birth"/>:</form:label>
                <spring:message code="dateBirth" text="Date Birth" var="dateBirth"/>
                <spring:message code="dateFormat" text="dd/mm/yyyy" var="dateFormat"/>
                <form:input path="dateBirth" class="form-control" placeholder="${dateBirth} (${dateFormat})"/>
            </div>

            <div class="form-group">
                <form:label path="gender"><spring:message code="gender" text="Gender"/>:</form:label>
                <spring:message code="gender" text="Gender" var="gender"/>
                <form:input path="gender" class="form-control" placeholder="${gender}"/>
            </div>

            <div class="form-group">
                <form:label path="phoneNumber"><spring:message code="phoneNumber" text="Phone number"/>:</form:label>
                <spring:message code="phoneNumber" text="Phone number" var="phoneNumber"/>
                <spring:message code="eg" text="eg" var="eg"/>
                <form:input path="phoneNumber" class="form-control"
                            placeholder="${phoneNumber} ${eg}.+38(044)123-45-67"/>
            </div>

            <div class="form-group">
                <form:label path="secondEmail"><spring:message code="emailReserve" text="Reserved Email"/>:</form:label>
                <spring:message code="emailReserve" text="Reserved Email" var="emailReserve"/>
                <form:input path="secondEmail" class="form-control" placeholder="${emailReserve}"/>
            </div>

            <div class="form-group">
                <form:label path="country"><spring:message code="country" text="Country"/>:</form:label>
                <spring:message code="country" text="Country" var="country"/>
                <form:input path="country" class="form-control" placeholder="${country}"/>
            </div>

        </fieldset>

        <footer>
            <input type="submit" class="btn btn-lg btn-primary btn-block"
                   value="<spring:message code="submit" text="Submit"/>">
        </footer>

    </form:form>

</div>

</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>
</footer>
<!-- /FOOTER -->
</html>
