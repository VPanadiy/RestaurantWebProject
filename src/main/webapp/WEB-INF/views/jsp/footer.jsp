<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<!-- HEADER -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Footer">
    <meta name="author" content="VPanadiy">

    <title>Footer</title>

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
</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <div class="footer">
        <table id="tableFooter">
            <tr id="trFooter1">
                <td id="tdFooter1"><spring:message code="address" text="Address"/>: <spring:message
                        code="addressDescription"
                        text="Search us ;)"/></td>
            </tr>
            <tr id="trFooter2">
                <td id="tdFooter2"><spring:message code="phoneNumber" text="Phone number"/>: <spring:message
                        code="phoneNumberDescription" text="Phone us ;)"/></td>
            </tr>
            <tr id="trFooter3">
                <td id="tdFooter3"><spring:message code="email" text="Email address"/>: <spring:message
                        code="emailDescription"
                        text="Write us ;)"/></td>
            </tr>
        </table>
    </div>

</footer>
<!-- /FOOTER -->
</html>
