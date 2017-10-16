<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page errorPage="error.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Menu page">
    <meta name="author" content="VPanadiy">

    <title>Menu</title>

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
</head>
<body>

<h1 class="h1Center"><spring:message code="menu" text="Menu"/></h1>

<table id="menu" class="tableMain">

    <tr id="trMenuTable1">
        <td id="tdMenuTable0">
            <table id="menuTable0">
                <tr>
                    <c:set var="menu0" value="${menu[0]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu0.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightGramms" text="Weight, gramms"/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu0.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName0"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
        <td id="tdMenuTable1">
            <table id="menuTable1">
                <tr>
                    <c:set var="menu1" value="${menu[1]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu1.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightGramms" text="Weight, gramms"/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu1.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName1"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
    </tr>

    <tr class="spacer"></tr>

    <tr id="trMenuTable2">
        <td id="tdMenuTable2">
            <table id="menuTable2">
                <tr>
                    <c:set var="menu2" value="${menu[2]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu2.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightGramms" text="Weight, gramms"/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu2.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName2"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
        <td id="tdMenuTable3">
            <table id="menuTable3">
                <tr>
                    <c:set var="menu3" value="${menu[3]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu3.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightGramms" text="Weight, gramms"/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu3.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName3"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
    </tr>

    <tr class="spacer"></tr>

    <tr id="trMenuTable3">
        <td id="tdMenuTable4">
            <table id="menuTable4">
                <tr>
                    <c:set var="menu4" value="${menu[4]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu4.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightMilliliter" text="Weight, ml."/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu4.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName4"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
        <td id="tdMenuTable5">
            <table id="menuTable5">
                <tr>
                    <c:set var="menu5" value="${menu[5]}"/>
                    <th class="thMain" colspan="3"><c:out value="${menu5.name}"/></th>
                </tr>

                <tr>
                    <th class="th1"><spring:message code="name" text="Name"/></th>
                    <th class="th2"><spring:message code="weightMilliliter" text="Weight, ml."/></th>
                    <th class="th3"><spring:message code="cost" text="Cost"/></th>
                </tr>

                <c:forEach items="${dishes}" var="dish">
                    <c:if test="${menu5.id == dish.menu.id}">
                        <tr>
                            <td id="tdDishName5"><a href="/dish/${dish.name}">${dish.name}</a></td>
                            <td>${dish.weight}</td>
                            <td>${dish.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </td>
    </tr>

    <tr class="spacer"></tr>
</table>

</body>
</html>
