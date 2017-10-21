<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <meta name="description" content="Warehouse page">
    <meta name="author" content="VPanadiy">

    <title>Warehouse page</title>

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

<h1 class="h1Center"><spring:message code="warehouse" text="Warehouse"/></h1>

<div class="container" style="width: 575px; margin-left: 0; margin-bottom: 10px">

<h3><spring:message code="addNewIngredient" text="Add new ingredient"/>:</h3>

    <form:form action="/addNewIngredient" modelAttribute="ingredient" method="POST">

        <fieldset>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="name" text="Name"/>:</label>
                <input name="ingredient.name" type="text" class="form-control" style="float: right; width: 320px"
                       placeholder="<spring:message code="name" text="Name"/>"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="amount" text="Amount"/>:</label>
                <input name="amount" type="text" class="form-control" style="float: right; width: 320px"
                       placeholder="<spring:message code="amount" text="Amount"/>"/>
            </div>

            <div class="form-group" style="overflow: auto; margin-bottom: 0">
                <label class="labelInline"><spring:message code="unit" text="Unit"/>:</label>
                <input name="unit" type="text" class="form-control" style="float: right; width: 320px"
                       placeholder="<spring:message code="unit" text="Unit"/>"/>
            </div>

        </fieldset>

        <footer>
            <input type="submit" class="btn btn-lg btn-primary btn-block"
                   value="<spring:message code="add" text="Add"/>">
        </footer>

    </form:form>

</div>

<table class="tableMain" style="align-items: center">

    <tr>
        <th style="width: 5%"><spring:message code="id" text="Id"/></th>
        <th>
            <form:form action="/ingredientFilter" modelAttribute="warehouse" method="POST">
                <label for="searchButton"><spring:message code="filter" text="Filter"/>:</label><input class="inputMain"
                                                                                                       type="text"
                                                                                                       id="searchButton"
                                                                                                       name="ingredientName"
                                                                                                       placeholder="<spring:message code="name" text="Name"/>"><input
                    id="searchSubmit" class="inputMain" type="submit" style="width: 100px; padding-top: 3px;"
                    value="<spring:message code="filter" text="Filter"/>">
            </form:form>
        </th>
        <th><spring:message code="amount" text="Amount"/></th>
        <th><spring:message code="unit" text="Unit"/></th>
        <th colspan="2" style="width: 15%"><spring:message code="actions" text="Actions"/></th>
    </tr>

    <c:forEach items="${warehouse}" var="ingredient">
        <tr>
            <form:form action="/updateIngredient" modelAttribute="warehouse" method="POST">
            <td>${ingredient.ingredient.id}</td>
            <td><input type="text" class="inputFull" name="ingredient.name" value="${fn:replace(ingredient.ingredient.name, '\'', '')}"></td>
            <td><input type="text" class="inputFull" name="amount" value="${ingredient.amount}"></td>
            <td><input type="text" class="inputFull" name="unit" value="${ingredient.unit}"></td>
            <td>
                    <input type="hidden" name="ingredientId" value="${ingredient.ingredient.id}"/>
                    <input type="submit" class="inputMain" style="padding: 0 0 0 0;" value="<spring:message code="update" text="Update"/>">
            </td>
            </form:form>
            <td>
                <form:form action="/deleteIngredient" modelAttribute="warehouse" method="POST">
                    <input type="hidden" name="ingredientId" value="${ingredient.ingredient.id}"/>
                    <input type="submit" class="inputMain" style="padding: 0 0 0 0;" value="<spring:message code="delete" text="Delete"/>">
                </form:form>
            </td>
        </tr>
    </c:forEach>

</table>

<p class="pRight"><a href="<c:url value="/admin"/>"><spring:message code="goBack" text="← Go back to"/> <spring:message
        code="admin" text="Administrator page"/></a></p>

</body>
<!-- /MAIN SECTION -->
<!-- FOOTER -->
<footer>

    <%@ include file="../footer.jsp" %>

</footer>
<!-- /FOOTER -->
</html>
