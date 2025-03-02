<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin panel</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {
            font-family: "RobotoDraft", "Roboto", sans-serif
        }

        .w3-bar-block .w3-bar-item {
            padding: 16px
        }
    </style>
</head>
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px;"
     id="mySidebar">
    <br/>
    <a href="/logout" class="fa fa-sign-out w3-right w3-padding-large"></a>ADMIN</a>
    <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu"
       class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
       onclick="document.getElementById('id01').style.display='block'">Create book<i
            class="w3-padding fa fa-pencil"></i></a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-yellow w3-button w3-hover-black w3-left-align"
       onclick="document.getElementById('id02').style.display='block'">Create User<i
            class="w3-padding fa fa-pencil"></i></a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-green w3-button w3-hover-black w3-left-align"
       onclick="document.getElementById('id03').style.display='block'">Create Category<i
            class="w3-padding fa fa-pencil"></i></a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-light-blue w3-button w3-hover-black w3-left-align"
       onclick="document.getElementById('id04').style.display='block'">Create Author<i
            class="w3-padding fa fa-pencil"></i></a>
    <a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)" class="w3-bar-item w3-button"><i
            class="fa fa-inbox w3-margin-right"></i>Admin Panel<i class="fa fa-caret-down w3-margin-left"></i></a>
    <div id="Demo1" class="w3-hide w3-animate-left">

        <a href="/searchuser" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
           >
            <div class="w3-container">
                <div class="w3-round w3-margin-right" style="width:15%;"><span class="w3-opacity w3-large"> User</span>
                </div>
                <h6> Search,Change,Detele,History</h6>
            </div>
        </a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
           onclick="openMail('Users');w3_close();">
            <div class="w3-container">
                <div class="w3-round w3-margin-right" style="width:15%;"><span class="w3-opacity w3-large"> Users</span>
                </div>
                <h6> All users</h6>
            </div>
        </a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
           onclick="openMail('SearchByB');w3_close();">
            <div class="w3-container">
                <div class="w3-round w3-margin-right" style="width:15%;"><span class="w3-opacity w3-large"> Book</span>
                </div>
                <h6> Search,Change,Detele,History</h6>
            </div>
        </a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
           onclick="openMail('Books');w3_close();">
            <div class="w3-container">
                <div class="w3-round w3-margin-right" style="width:15%;"><span class="w3-opacity w3-large"> Books</span>
                </div>
                <h6> All books</h6>
            </div>
        </a>
    </div>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-trash w3-margin-right"></i>Trash</a>
</nav>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id03" class="w3-modal" style="z-index:4">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id03').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
            <h2>Create new category</h2>
        </div>
        <form action="/admin/add_category" method="post">
            <div class="w3-panel">
                <label>New Category</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="categoryName"
                       name="name" required>
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
<div id="id04" class="w3-modal" style="z-index:4">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id04').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
            <h2>Create a new author</h2>
        </div>
        <form action="/admin/add_author" method="post">
            <div class="w3-panel">
                <label>First Name</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="firstname"
                       name="firstname" required>

                <label>Last Name</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="lastname"
                       name="lastname" required>


                <div class="w3-section">
                    <a class="w3-button w3-red" onclick="document.getElementById('id04').style.display='none'">Cancel<i
                            class="fa fa-remove"></i></a>
                </div>
                <div class="w3-button">
                    <input type="submit" value="Add"/>
                </div>
            </div>
        </form>

    </div>
</div>
<div id="id01" class="w3-modal" style="z-index:4">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'"
             class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
            <h2>Add a new book</h2>
        </div>
        <form action="/admin/add_book" method="post">
            <div class="w3-panel">
                <label>title</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="title"
                       name="title" required>
                <label>description</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="description"
                       name="description" required>
                <label> year</label>
                <input type="number" class="form-control w3-input w3-border w3-margin-bottom" id="year"
                       name="year" required>
                <label>imagePath</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="imagepath"
                       name="imagepath" required>
                <label>pablisher</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="publisher"
                       name="publisher" required>
                <label>author</label>
                <select name="author" id="author">
                    <c:forEach items="${authors}" var="author">
                        <option value="${author.id}">${author.firstName} ${author.lastName}</option>
                    </c:forEach>
                </select>
                <label>category</label>
                <select name="category" id="category">
                    <c:forEach items="${category}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>


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
            <h2>Add a new user</h2>
        </div>
        <form action="/admin/add_user" method="post">
            <div class="w3-panel">
                <label>Username</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="username"
                       name="username" required>
                <label>Firstname</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="firstname1"
                       name="firstname" required>
                <label>Lastname</label>
                <input type="text" class="form-control w3-input w3-border w3-margin-bottom" id="lastname1"
                       name="lastname" required>
                <label> Password</label>
                <input type="password" class="form-control w3-input w3-border w3-margin-bottom" id="password"
                       name="password" required>
                <label> Password again</label>
                <input type="password" class="form-control w3-input w3-border w3-margin-bottom" id="password1"
                       name="password1" required>
                <label>role</label>
                <select name="author" id="role">
                    <c:forEach items="${users}" var="user">
                        <option value="${user.role}"></option>
                    </c:forEach>
                </select>
                <div class="w3-section">
                    <a class="w3-button w3-red" onclick="document.getElementById('id02').style.display='none'">Cancel<i
                            class="fa fa-remove"></i></a>
                </div>
                <div class="w3-button">
                    <input type="submit" value="Add"/>
                </div>
            </div>
        </form>

    </div>
</div>
<c:if test="${not empty message}">
    <div id="successMessage" class="w3-panel w3-green alettab" role="alert" aria-live="polite" aria-atomic="true">
        <span onclick="this.parentElement.style.display='none'"
              class="w3-button w3-large w3-position-absolut">&times;</span>
            ${message}
    </div>
</c:if>
<c:if test="${not empty error}">
    <div id="errorMessage" class="w3-panel w3-red" role="alert" aria-live="polite" aria-atomic="true">
        <span onclick="this.parentElement.style.display='none'"
              class="w3-button w3-large w3-display-topright"
              aria-label="Close error message">&times;</span>
            ${error}
    </div>
</c:if>
<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="Close Sidemenu" id="myOverlay"></div>
<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:50px 16px">
    <h1 class="w3-margin w3-jumbo">ADMIN PAGE</h1>
    <button class="w3-button w3-black w3-padding-large w3-large w3-margin-top">Welcome</button>
</header>

<!-- Page content -->
<div class="w3-main" style="margin-left:320px;">
        <i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top"
           onclick="w3_open()"></i>
        <a href="javascript:void(0)" class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right"
           onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-pencil"></i></a>

    <div id="Users" class="w3-container person">
        <br>
        <img class="w3-round  w3-animate-top fa fa-user" style="width:20%;">
        <h5 class="w3-opacity">All users</h5>

        <c:if test="${user.role=='admin'}">
            <div class="w3-container">
                <h2>Users</h2>

                <table class="w3-table w3-striped">
                    <tr>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Date of create</th>
                    </tr>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.firstname}</td>
                            <td>${user.lastname}</td>
                            <td>${user.username}</td>
                            <td>${user.role}</td>
                            <td>${user.created}</td>
                        </tr>
                    </c:forEach>


                </table>
            </div>

        </c:if>
        <c:if test="${user.role!='admin'}">
            <h1>Forbidden</h1>

        </c:if>
    </div>

    <div id="Books" class="w3-container person">
        <br>
        <c:if test="${user.role=='admin'}">
            <div class="w3-container">
                <h2>Books</h2>

                <table class="w3-table w3-striped">
                    <tr>
                        <th>Title</th>
                        <th>year</th>
                        <th>Author</th>
                        <th>description</th>
                        <th>Status</th>

                    </tr>
                    <c:forEach items="${allbooks}" var="book">
                        <tr>
                            <td>${book.title}</td>
                            <td>${book.year}</td>
                            <td>${book.author[0].firstName} <br/>${book.author[0].lastName}</td>
                            <td>${book.description}</td>
                            <td>${book.status}</td>
                        </tr>
                    </c:forEach>


                </table>
            </div>

        </c:if>
        <c:if test="${user.role!='admin'}">
            <h1>Forbidden</h1>

        </c:if>
    </div>

    <div id="SearchByB" class="w3-container person">
        <div class="w3-container w3-white w3-main">
            <h1 class="w3-center">Search book by author or title</h1>
            <form action="/searchadmin" method="get"
                  class="w3-flex flex-sm-row flex-column w3-center justify-content-center w3-margin">
                <input name="search" id="myInput"
                       type="search" style="height: 38px" size="70" placeholder="Search for title or author"
                       aria-label="Search"/>
                <button type="submit" onclick="openMail('SearchByB');w3_close();" class="w3-button w3-red"
                        style="height: 38px">Search
                </button>
            </form>
        </div>

        <c:if test="${user.role=='admin'}">
            <div class="w3-container">
                <div class="w3-container">
                    <h2>Book</h2>

                <table class="w3-table w3-striped">
                    <tr>
                        <th>Title</th>
                        <th>year</th>
                        <th>Author</th>
                        <th>description</th>
                        <th>Status</th>

                    </tr>
                    <c:forEach items="${bookbysearch}" var="book">
                        <tr>
                            <td>${book.title}<a href="javascript:void(0)"
                                                class=" w3-hover-black "
                                                onclick="document.getElementById('id02').style.display='block'"><i
                                    class="w3-padding fa fa-pencil"></i></a></td>
                            <td>${book.year}<a href="javascript:void(0)"
                                               class=" w3-hover-black "
                                               onclick="document.getElementById('id02').style.display='block'"><i
                                    class="w3-padding fa fa-pencil"></i></a></td>
                            <td>${book.author[0].firstName} <br/>${book.author[0].lastName}<a href="javascript:void(0)"
                                                                                              class=" w3-hover-black "
                                                                                              onclick="document.getElementById('id02').style.display='block'"><i
                                    class="w3-padding fa fa-pencil"></i></a></td>
                            <td>${book.description}<a href="javascript:void(0)"
                                                      class=" w3-hover-black "
                                                      onclick="document.getElementById('id02').style.display='block'"><i
                                    class="w3-padding fa fa-pencil"></i></a></td>
                            <td>${book.status}</td>
                        </tr>
                    </c:forEach>


                </table>
            </div>

        </c:if>
        <c:if test="${user.role!='admin'}">
            <h1>Forbidden</h1>

        </c:if>


    </div>


</div>
</div>

<script>
    var openInbox = document.getElementById("myBtn");
    openInbox.click();

    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }

    function myFunc(id) {
        var x = document.getElementById(id);
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-red";
        } else {
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className =
                x.previousElementSibling.className.replace(" w3-red", "");
        }
    }

    openMail("SearchByB")

    function openMail(personName) {
        var i;
        var x = document.getElementsByClassName("person");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x = document.getElementsByClassName("test");
        for (i = 0; i < x.length; i++) {
            x[i].className = x[i].className.replace(" w3-light-grey", "");
        }
        document.getElementById(personName).style.display = "block";
        // document.getElementById("Searchbook").style.display = "block";
        event.currentTarget.className += " w3-light-grey";
    }



</script>


</body>
</html>