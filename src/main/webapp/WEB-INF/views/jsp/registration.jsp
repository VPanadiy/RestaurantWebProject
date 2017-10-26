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
<body onload="startTime()">

<spring:message code="language" text="Language :"/><a href="?lang=en"><spring:message code="english"
                                                                                      text="English"/></a> | <a
        href="?lang=ru"><spring:message code="russia" text="Russia"/></a> | <a href="?lang=ua"><spring:message
        code="ukraine" text="Ukraine"/></a>
<spring:message code="locale" text="Current Locale : "/>${pageContext.response.locale}

<h2 id="h2Time"><spring:message code="timeNow" text="Time now is:"/>
    <div id="txt"></div>
</h2>

<p class="pLeft" style="margin-top: 15px;"><a href="<c:url value="/login"/>"><spring:message code="goBack"
                                                                                           text="← Go back to"/>
    <spring:message code="login" text="Login"/></a>
    <span style="float:right;"><a href="<c:url value="/"/>"><spring:message code="home" text="Home"/></a></span>
</p>

<div class="container" style="width: 575px;">

    <form:form method="POST" modelAttribute="users" action="registration" class="form-signin"
               cssStyle="padding: 0; max-width: none">
        <h2 class="form-signin-heading"><spring:message code="accountCreating" text="Create your account"/></h2>

        <fieldset>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="username" cssClass="labelRegInline"><spring:message code="username" text="Username"/>:</form:label>
                <spring:message code="username" text="Username" var="username"/>
                <form:input type="text" path="username" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${username}"
                            autofocus="true"/>
                <form:errors path="username" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="lastName" cssClass="labelRegInline"><spring:message code="lastName" text="Last Name"/>:</form:label>
                <spring:message code="lastName" text="Last Name" var="lastName"/>
                <form:input path="lastName" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${lastName}"/>
                <form:errors path="lastName" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="firstName" cssClass="labelRegInline"><spring:message code="firstName"
                                                                                       text="First Name"/>:</form:label>
                <spring:message code="firstName" text="First Name" var="firstName"/>
                <form:input path="firstName" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${firstName}"/>
                <form:errors path="firstName" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="email" cssClass="labelRegInline"><spring:message code="email"
                                                                                   text="Email"/>:</form:label>
                <spring:message code="email" text="Email" var="email"/>
                <form:input path="email" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${email}"/>
                <form:errors path="email" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="password" cssClass="labelRegInline"><spring:message code="password" text="Password"/>:</form:label>
                <spring:message code="password" text="Password" var="password"/>
                <form:password path="password" class="form-control" cssStyle="float: right; width: 320px"
                               placeholder="${password}" onkeyup="doAjax()"/>
                <form:errors path="password" cssClass="has-error"/>
                <span style="float: right; margin-left: 500px" id="strengthValue"></span>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="dateBirth" cssClass="labelRegInline"><spring:message code="dateBirth"
                                                                                       text="Date Birth"/>:</form:label>
                <spring:message code="dateBirth" text="Date Birth" var="dateBirth"/>
                <spring:message code="dateFormat" text="yyyy-MM-dd" var="dateFormat"/>
                <form:input path="dateBirth" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${dateBirth} (${dateFormat})"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="gender" cssClass="labelRegInline"><spring:message code="gender"
                                                                                    text="Gender"/>:</form:label>
                <spring:message code="gender" text="Gender" var="gender"/>
                <form:input path="gender" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${gender}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="phoneNumber" cssClass="labelRegInline"><spring:message code="phoneNumber"
                                                                                         text="Phone number"/>:</form:label>
                <spring:message code="phoneNumber" text="Phone number" var="phoneNumber"/>
                <spring:message code="eg" text="eg" var="eg"/>
                <form:input path="phoneNumber" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${phoneNumber} ${eg}.+38(044)123-45-67"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="secondEmail" cssClass="labelRegInline"><spring:message code="emailReserve"
                                                                                         text="Reserved Email"/>:</form:label>
                <spring:message code="emailReserve" text="Reserved Email" var="emailReserve"/>
                <form:input path="secondEmail" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${emailReserve}"/>
                <form:errors path="secondEmail" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="country" cssClass="labelRegInline"><spring:message code="country"
                                                                                     text="Country"/>:</form:label>
                <spring:message code="country" text="Country" var="country"/>
                <form:input path="country" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${country}"/>
            </div>

        </fieldset>

        <footer>
            <input type="submit" class="btn btn-lg btn-primary btn-block"
                   value="<spring:message code="submit" text="Submit"/>">
        </footer>

    </form:form>

</div>

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
<!-- FOOTER -->
<footer>
</footer>
<!-- /FOOTER -->
</html>
