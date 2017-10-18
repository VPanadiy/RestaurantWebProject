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
    <meta name="description" content="Account page">
    <meta name="author" content="VPanadiy">

    <title>Account page</title>

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
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<body>

<%@ include file="../navigation.jsp" %>

<h1 class="h1Center"><spring:message code="userPage" text="User page"/>!</h1>
<h3 class="h3Center"><spring:message code="hello" text="Hello"/> ${user.username}!</h3>

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


<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadedFile"
           action="uploadFile?${_csrf.parameterName}=${_csrf.token}">

    <table>
        <tr class="trNone">
            <td class="tdNone"><spring:message code="uploadFile" text="Upload File"/>:</td>
            <td class="tdNone"><input type="file" name="file"></td>
            <td style="color: red; font-style: italic; border: none"><form:errors path="file"/></td>
        </tr>
        <tr class="trNone">
            <td class="tdNone"></td>
            <td class="tdNone"><input type="submit" value="<spring:message code="uploadFile" text="Upload File"/>"></td>
            <td class="tdNone"></td>
        </tr>
    </table>

</form:form>

<h3><a href="downloadPDF"><spring:message code="downloadPDF" text="Download PDF Document"/></a></h3>

<div class="container" style="width: 575px; margin-left: 0px">

    <form:form action="/updateUserDetails" modelAttribute="user" method="POST">

        <fieldset>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="username" cssClass="labelInline"><spring:message code="username"
                                                                                   text="Username"/>:</form:label>
                <spring:message code="username" text="Username" var="username"/>
                <form:input type="text" path="username" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${username}"
                            autofocus="true"/>
                <form:errors path="username" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="lastName" cssClass="labelInline"><spring:message code="lastName"
                                                                                   text="Last Name"/>:</form:label>
                <spring:message code="lastName" text="Last Name" var="lastName"/>
                <form:input path="lastName" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${lastName}"/>
                <form:errors path="lastName" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="firstName" cssClass="labelInline"><spring:message code="firstName" text="First Name"/>:</form:label>
                <spring:message code="firstName" text="First Name" var="firstName"/>
                <form:input path="firstName" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${firstName}"/>
                <form:errors path="firstName" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="email" cssClass="labelInline"><spring:message code="email"
                                                                                text="Email"/>:</form:label>
                <spring:message code="email" text="Email" var="email"/>
                <form:input path="email" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${email}"/>
                <form:errors path="email" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="password" cssClass="labelInline"><spring:message code="password"
                                                                                   text="Password"/>:</form:label>
                <spring:message code="password" text="Password" var="password"/>
                <form:password path="password" class="form-control" cssStyle="float: right; width: 320px"
                               placeholder="${password}"/>
                <form:errors path="password" cssClass="has-error"/>
                <span style="float: right" id="strengthValue"></span>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="dateBirth" cssClass="labelInline"><spring:message code="dateBirth" text="Date Birth"/>:</form:label>
                <spring:message code="dateBirth" text="Date Birth" var="dateBirth"/>
                <spring:message code="dateFormat" text="dd/mm/yyyy" var="dateFormat"/>
                <form:input path="dateBirth" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${dateBirth} (${dateFormat})"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="gender" cssClass="labelInline"><spring:message code="gender"
                                                                                 text="Gender"/>:</form:label>
                <spring:message code="gender" text="Gender" var="gender"/>
                <form:input path="gender" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${gender}"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="phoneNumber" cssClass="labelInline"><spring:message code="phoneNumber"
                                                                                      text="Phone number"/>:</form:label>
                <spring:message code="phoneNumber" text="Phone number" var="phoneNumber"/>
                <spring:message code="eg" text="eg" var="eg"/>
                <form:input path="phoneNumber" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${phoneNumber} ${eg}.+38(044)123-45-67"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="secondEmail" cssClass="labelInline"><spring:message code="emailReserve"
                                                                                      text="Reserved Email"/>:</form:label>
                <spring:message code="emailReserve" text="Reserved Email" var="emailReserve"/>
                <form:input path="secondEmail" class="form-control" cssStyle="float: right; width: 320px"
                            placeholder="${emailReserve}"/>
                <form:errors path="secondEmail" cssClass="has-error"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <form:label path="country" cssClass="labelInline"><spring:message code="country"
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

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="<spring:message code="logout" text="Logout"/>"/>
</form:form>

</body>
<!-- /FOOTER -->
</html>