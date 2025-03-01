<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Info</title>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Bibliotek</title>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: "Times New Roman", Georgia, Serif;--%>
<%--        }--%>

<%--        h1, h2, h3, h4, h5, h6 {--%>
<%--            font-family: "Playfair Display";--%>
<%--            letter-spacing: 5px;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="w3-content" style="max-width:1100px">--%>
<%--    <c:forEach items="${books}" var="book">--%>
<%--        <div class="w3-row w3-padding-64">--%>
<%--            <div class="w3-col m6 w3-padding-large w3-hide-small">--%>
<%--                <img src="${book.imagePath}" alt="img" class="w3-round w3-image w3-opacity-min" width="600" height="750">--%>
<%--            </div>--%>
<%--            <div class="w3-col m6 w3-padding-large">--%>
<%--                <h1 class="w3-center"><c:out value="${book.title}" /></h1><br>--%>
<%--&lt;%&ndash;                <c:if test="${not empty book.author}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <h3 class="w3-center"><c:out value="${book.author[0].firstName}" /> <c:out value="${book.author[0].lastName}" /></h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--                <p class="w3-large"><c:out value="${book.description}" /></p>--%>
<%--                <p class="w3-large w3-text-grey w3-hide-medium"><c:out value="${book.publisher}" /></p>--%>
<%--                <p class="w3-large w3-text-grey w3-hide-medium"><c:out value="${book.year}" /></p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page import="model.Category" %>
<%@ page import="dao.CategoryDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="service.BookService" %>
<%@ page import="model.Book" %>
<%@ page import="dao.BookDao" %>
<%@ page import="model.UserBook" %>
<%@ page import="dao.UserBookDao" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bibliotek</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

        . alettab {
            position: absolute;
            width: 20%;
            height: 30%;
        }

        .contener {
            position: relative;

        }

        .status-info {
            position: absolute;
            z-index: 50;
        }

        .status-info1 {
            position: absolute;
            z-index: 50;
            margin-top: 240px;
        }

        .wrapper {
            max-width: 700px;
            width: 100%;
            backdrop-filter: blur(5px);
            border-radius: 5px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.1);
        }

        #catalog {
            box-sizing: content-box;;
        }

        .img {
            width: 180px;
            height: 280px;
        }

        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow: hidden;
        }

        .wrapper .title {
            height: 120px;
            background: #16a085;
            border-radius: 5px 5px 0 0;
            color: #fff;
            font-size: 30px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .wrapper form {
            padding: 25px 35px;
        }

        .wrapper form .row {
            height: 60px;
            margin-top: 15px;
            position: relative;
        }

        .wrapper form .row input {
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 70px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        form .row input:focus {
            border-color: #16a085;
        }

        form .row input::placeholder {
            color: #999;
        }

        .wrapper form .row i {
            position: absolute;
            width: 55px;
            height: 100%;
            color: #fff;
            font-size: 22px;
            background: #16a085;
            border: 1px solid #16a085;
            border-radius: 5px 0 0 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .wrapper form .pass {
            margin-top: 12px;
        }

        .wrapper form .pass a {
            color: #16a085;
            font-size: 17px;
            text-decoration: none;
        }

        .wrapper form .pass a:hover {
            text-decoration: underline;
        }

        .wrapper form .button input {
            margin-top: 20px;
            color: #fff;
            font-size: 20px;
            font-weight: 500;
            padding-left: 0px;
            background: #16a085;
            border: 1px solid #16a085;
            cursor: pointer;
        }

        form .button input:hover {
            background: #12876f;
        }

        .wrapper form .signup-link {
            text-align: center;
            margin-top: 45px;
            font-size: 17px;
        }

        .wrapper form .signup-link a {
            color: #16a085;
            text-decoration: none;
        }

        form .signup-link a:hover {
            text-decoration: underline;
        }

        .w3-sidebar a {
            font-family: "Roboto", sans-serif
        }

        .buttop {
            background: #f44336;
        }

        .demo-container {
            margin: 4em auto;
            max-width: 600px;
        }

        .demo-container .btn-search {
            margin-left: -20px;
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
        }

        .demo-container .btn-search::before {
            content: "\f002";
            font-family: FontAwesome;
            color: #FFFFFF;
            float: left;
        }

        .demo-container .search-input {
            padding-right: 40px;
            border-right: 0;
            border-left: 0;
            border-radius: 0;
            outline: none !important;
            outline: 0 !important;
        }

        .demo-container .form-select {
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
            width: 80px;
            background-color: #F0F0F0;
            outline: none !important;
            outline: 0 !important;
        }

        #myUL {
            /* Remove default list styling */
            list-style-type: none;
            padding: 0;
            margin: 0;
            visibility: hidden;
        }

        #myUL li a {
            border: 1px solid #ddd; /* Add a border to all links */
            margin-top: -1px; /* Prevent double borders */
            background-color: #f6f6f6; /* Grey background color */
            padding: 12px; /* Add some padding */
            text-decoration: none; /* Remove default text underline */
            font-size: 18px; /* Increase the font-size */
            color: #c37676; /* Add a black text color */
            display: block; /* Make it into a block element to fill the whole list */
        }

        #myUL li a:hover:not(.header) {
            background-color: #eee; /* Add a hover effect to all links, except for headers */
        }

        .form-control:focus {
            #myUL {
                visibility: visible;
            }
        }

        .demo-container textarea:focus,
        .demo-container input[type="search"]:focus,
        .demo-container input[type="submit"]:focus,
        .demo-container .form-select:focus,
        .demo-container .btn:focus {
            border-color: rgba(208, 212, 218, 0.9);
            box-shadow: none !important;
            outline: 0 none !important;

            #myUL {
                visibility: visible;
            }
        }

        .w3-button {
            margin-top: -3px;
        }

        @media only screen and (max-width: 600px) {
            .demo-container .form-select {
                width: 100%;
                margin-bottom: 1em;
            }

            .demo-container .btn-search {
                margin-left: 0;
                margin-top: 1em;
                border-bottom-left-radius: 4px;
                border-top-left-radius: 4px;
                width: 100%;
            }

            .demo-container .search-input {
                padding-right: 0;
                border-right: 1px solid rgba(208, 212, 218, 0.9);
                border-left: 1px solid rgba(208, 212, 218, 0.9);
                border-radius: 4px;
                width: 60%;
                outline: none !important;
                outline: 0 !important;
            }
        }


        body, h1, h2, h3, h4, h5, h6, .w3-wide {
            font-family: "Montserrat", sans-serif;
        }


    </style>
</head>
<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
    <div class="w3-container w3-display-container w3-padding-16">
        <i onclick="" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
        <h3 class="w3-wide"><b><a href="/" >Biblio</a></b></h3>
    </div>

    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
        <a href="/" class="w3-bar-item w3-button">Books</a>
        <a onclick="" href="" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
            Media <i class="fa fa-caret-down"></i>
        </a>
        <% for (Category category : new CategoryDao().findAll()) {%>
        <a href="/category/<%= category.getId()%>" class="w3-bar-item w3-button"><%= category.getName()%>
        </a>
        <%}%>
    </div>

</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
    <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
    <a href="" class="w3-bar-item w3-button w3-padding-24 w3-right"><i
            class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" style="cursor:pointer" title="close side menu"
     id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

    <div class="w3-content" style="max-width:1100px">
        <c:forEach items="books" var="info">
            <div class="w3-row w3-padding-64">
                <div class="w3-col m6 w3-padding-large w3-hide-small">
                    <img src="${books.imagePath}" alt="img" class="w3-round w3-image w3-opacity-min" width="600"
                         height="750">
                </div>
                <div class="w3-col m6 w3-padding-large">
                    <h1 class="w3-center">${books.title}</h1><br>
                    <c:if test="${not empty books.author}">
                        <h3 class="w3-center">${books.author[0].firstName} <br>${books.author[0].lastName}</h3>
                    </c:if>
                    <p class="w3-large">${books.description}</p>
                    <p class="w3-large w3-text-grey w3-hide-medium"><c:out value="${book.publisher}"/></p>
                    <p class="w3-large w3-text-grey w3-hide-medium">${books.year}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>