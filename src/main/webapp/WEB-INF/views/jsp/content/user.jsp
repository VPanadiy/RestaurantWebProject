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
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<body>

<%@ include file="../navigation.jsp" %>

<h1 class="h1Center"><spring:message code="userPage" text="User page"/>!</h1>
<h3 class="h3Center"><spring:message code="hello" text="Hello"/> ${user.username}!</h3>

<p><spring:message code="password" text="Password"/>: ${user.password}!</p>
<p><spring:message code="profileImage" text="Profile image"/>: <img src="data:image/jpeg;base64,${userImage}"/></p>

<h3><a href="downloadPDF"><spring:message code="downloadPDF" text="Download PDF Document"/></a></h3>


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

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="<spring:message code="logout" text="Logout"/>"/>
</form:form>

</body>
<!-- /FOOTER -->
</html>