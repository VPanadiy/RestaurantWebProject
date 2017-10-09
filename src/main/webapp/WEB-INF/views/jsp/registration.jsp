<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<spring:message code="language" text="Language :" /><a href="?lang=en"><spring:message code="english" text="English" /></a> | <a href="?lang=ru"><spring:message code="russia" text="Russia" /></a> | <a href="?lang=ua"><spring:message code="ukraine" text="Ukraine" /></a>
<spring:message code="locale" text="Current Locale : " />${pageContext.response.locale}

<div class="container">

    <form:form method="POST" modelAttribute="users" action="registration" class="form-signin">
        <h2 class="form-signin-heading">Create your account</h2>

        <fieldset>

            <div class="form-group">
                <form:label path="username">Name:</form:label>
                <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"/>
                <form:errors path="username" cssClass="has-error"/>
            </div>

            <div class="form-group">
                <form:label path="firstName">First Name:</form:label>
                <form:input path="firstName" class="form-control" placeholder="First Name"/>
            </div>

            <div class="form-group">
                <form:label path="lastName">Last Name:</form:label>
                <form:input path="lastName" class="form-control" placeholder="Last Name"/>
            </div>

            <div class="form-group">
                <form:label path="email">Email:</form:label>
                <form:input path="email" class="form-control" placeholder="Email"/>
                <form:errors path="email" cssClass="has-error"/>
            </div>

            <div class="form-group">
                <form:label path="password">Password:</form:label>
                <form:password path="password" class="form-control" placeholder="Password"/>
                <form:errors path="password" cssClass="has-error"/>
            </div>

            <div class="form-group">
                <form:label path="dateBirth">Date Birth:</form:label>
                <form:input path="dateBirth" class="form-control" placeholder="Date Birth (dd/mm/yyyy)"/>
            </div>

            <div class="form-group">
                <form:label path="gender">Gender:</form:label>
                <form:input path="gender" class="form-control" placeholder="Gender"/>
            </div>

            <div class="form-group">
                <form:label path="phoneNumber">Phone Number:</form:label>
                <form:input path="phoneNumber" class="form-control" placeholder="Phone Number eg.+38(044)123-45-67"/>
            </div>

            <div class="form-group">
                <form:label path="secondEmail">Reserved Email:</form:label>
                <form:input path="secondEmail" class="form-control" placeholder="Reserved Email"/>
            </div>

            <div class="form-group">
                <form:label path="country">Country:</form:label>
                <form:input path="country" class="form-control" placeholder="Country"/>
            </div>

        </fieldset>

        <footer>
            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit">
        </footer>

    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
