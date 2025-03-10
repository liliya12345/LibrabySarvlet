<%@ page import="model.Category" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="dao.UserDao" %>
<%@ page import="model.User" %>
<%@ page import="model.UserBook" %>
<%@ page import="dao.UserBookDao" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page isELIgnored="false" %>--%>
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

        .w3-container {
            padding: 0;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
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
        <h3 class="w3-wide">
            <b>
                <a href="/">Biblio</a>
            </b></h3>
    </div>

    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
        <a href="" class="w3-bar-item w3-button">Books</a>
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

    <!-- Push down content on small screens -->
    <div class="w3-hide-large" style="margin-top:83px"></div>

    <!-- Top header -->
    <header class="w3-container w3-xlarge">
        <a href="/logout" class="fa fa-sign-out w3-right w3-padding-large"></a>
        <a href="/user" class="fa fa-meh-o w3-right w3-padding-large"></a>

    </header>

    <div class="w3-display-container w3-container">
        <img src="https://linkarkitektur.com/sites/default/files/styles/background_full_wide/public/node/field_image/SKHLM_bibliotek_001.jpg?itok=820R0M2y"
             alt="library" style="width:100%">
        <c:if test="${not empty success}">
            <div id="successMessage" class="w3-panel w3-green alettab" role="alert" aria-live="polite"
                 aria-atomic="true"><span onclick="this.parentElement.style.display='none'"
                                          class="w3-button w3-large w3-position-absolut">&times;</span>
                    ${success}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div id="errorMessage" class="w3-panel w3-red" role="alert" aria-live="polite" aria-atomic="true"><span
                    onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright"
                    aria-label="Close error message">&times;</span>
                    ${error}
            </div>
        </c:if>
        <div class="w3-display-topleft w3-text-black" style="padding:24px 48px">
            <h1 class="w3-jumbo w3-hide-small">Aktuella evenemang</h1>
            <h1 class="w3-hide-large w3-hide-medium">Se alla evenemang</h1>
            <h1 class="w3-hide-small">SpråkCafe</h1>
            <p><a href="#jeans" class="w3-button buttop  w3-padding-large w3-large">MER INFO</a></p>
        </div>
    </div>

    <div class="w3-row-margin">
        <div class="w3-col l12 s12">
            <div class="w3-row" style="background: #f3f2f2">
                <title>Min sida</title>
                <div class="w3-container  w3-main">
                    <h1 class="w3-center">Min sida</h1>


                    <table>
                        <%
                            User user = (User) request.getSession().getAttribute("user");
                            int id = user.getId();
                            int count = 1;
                        %>
                        <tr>
                            <th></th>
                            <th>Title</th>
                            <th>från</th>
                            <th>till</th>
                            <th>Status</th>

                        </tr>
                        <p class="w3-center">username <%=user.getUsername().toUpperCase()%>
                            <a href="javascript:void(0)"
                               class="w3-hover-black"
                               onclick="document.getElementById('id01').style.display='block'"><i
                                    class="w3-padding fa fa-pencil"></i></a>
                        </p>
                        <p class="w3-center"><%=user.getFirsName()%> <a href="javascript:void(0)"
                                                                        class=" w3-hover-black "
                                                                        onclick="document.getElementById('id02').style.display='block'"><i
                                class="w3-padding fa fa-pencil"></i></a></p>
                        <p class="w3-center"><%=user.getLastName()%><a href="javascript:void(0)"
                                                                       class=" w3-hover-black "
                                                                       onclick="document.getElementById('id03').style.display='block'"><i
                                class="w3-padding fa fa-pencil"></i></a></p>
                        <p class="w3-center">Last inlogling at <%=user.getLastLogin()%>
                        </p>
                        <p class="w3-center">Created at<%=user.getCreated()%>
                        </p>
                        <p class="w3-center">Total <%=user.getUserBook().size()%> böcker</p>
                        <% for (UserBook userBook : new UserBookDao().findUserBooksByUsersId(id)) {%>
                        <tr>
                            <th><%= count++%>
                            </th>
                            <th><%= userBook.getBook().getTitle()%>
                            </th>

                            <th><%= userBook.getDateOfLoan()%> <a
                                    href="/loan/<%= userBook.getBook().getId()%>" type="button"
                                    class=" w3-center w3-button w3-red"
                                    style="height: 38px">LÅNA OM
                            </a></th>
                            <th><%= userBook.getDateOfReturn()%> <a
                                    href="/return/<%= userBook.getBook().getId()%>" type="button"
                                    class=" w3-center w3-button w3-red"
                                    style="height: 38px">Return
                            </a></th>
                            <th>

                                <% if(userBook.isReturned()){%>
                                    Returned
                                    <%} else{%>
                                    Booked
                                    <%}%>
<%--                                <c:if test="${userBook.isReturned()}"> Returned</c:if>--%>
<%--                                <c:if test="${!userBook.isReturned()}"> Booked</c:if>--%>
                            </th>
                        </tr>
                        <%}%>
                    </table>

                </div>
            </div>
        </div>
        <div id="id01" class="w3-modal" style="z-index:4">
            <div class="w3-modal-content w3-animate-zoom">
                <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
                    <h2>Change your username</h2>
                </div>
                <form action="/user/change_username" method="post">
                    <div class="w3-panel">
                        <label>New Username</label>
                        <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="userName"
                               name="username" required>
                        <div class="w3-section">
                            <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel<i
                                    class="fa fa-remove"></i></a>
                        </div>
                        <div class="w3-button">
                            <input type="submit" value="Add"/>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <div id="id02" class="w3-modal" style="z-index:4">
            <div class="w3-modal-content w3-animate-zoom">
                <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id02').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
                    <h2>Change your firstname</h2>
                </div>
                <form action="/user/change_firstname" method="post">
                    <div class="w3-panel">
                        <label>New Firstname</label>
                        <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="firstName"
                               name="firstname" required>
                        <div class="w3-section">
                            <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel<i
                                    class="fa fa-remove"></i></a>
                        </div>
                        <div class="w3-button">
                            <input type="submit" value="Add"/>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <div id="id03" class="w3-modal" style="z-index:4">
            <div class="w3-modal-content w3-animate-zoom">
                <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id03').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
                    <h2>Change your Lastname</h2>
                </div>
                <form action="/user/change_lastname" method="post">
                    <div class="w3-panel">
                        <label>New Lastname</label>
                        <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="lastName"
                               name="lastname" required>
                        <div class="w3-section">
                            <a class="w3-button w3-red" onclick="document.getElementById('id03').style.display='none'">Cancel<i
                                    class="fa fa-remove"></i></a>
                        </div>
                        <div class="w3-button">
                            <input type="submit" value="Add"/>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>

</div>

<!-- Subscribe section -->

</body>
</html>
<script>
    function hide() {
        document.getElementById("catalog").style.display = "none"
    }

    function myFunction() {
        // Declare variables
        var input, filter, ul, li, a, i, txtValue;
        input = document.getElementById('myInput');
        filter = input.value.toUpperCase();
        ul = document.getElementById("myUL");
        li = ul.getElementsByTagName('li');

        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>




