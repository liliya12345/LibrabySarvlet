<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--<c:set var="all" value="Category />--%>
<html>
<body>
<%--@elvariable id="contacts" type="java.util.List"--%>
<c:forEach items="${contacts}" var="contact">
    <tr>
        <td>Hi</td>
        <td>${contact}</td>

    </tr>
</c:forEach>

</body>
</html>