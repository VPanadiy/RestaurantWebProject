<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
User page!
<p>Hello ${user.username}!</p>
<p>Your password is ${user.password}!</p>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="Logout" />
</form:form>

<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadedFile" action="uploadFile?${_csrf.parameterName}=${_csrf.token}">

    <table>
        <tr>
            <td>Upload File:</td>
            <td><input type="file" name="file" /></td>
            <td style="color: red; font-style: italic;">
                <form:errors path="file" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Upload" /></td>
            <td></td>
        </tr>
    </table>
</form:form>


</body>
</html>