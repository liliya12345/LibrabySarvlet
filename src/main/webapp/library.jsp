<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Title test</h2>
<c:forEach items="${books}" var="book">
    ${book.title}
    ${book.year}
    ${book.author[0].lastName}
</c:forEach>
</body>
</html>
