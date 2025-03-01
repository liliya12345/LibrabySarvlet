<%--
  Created by IntelliJ IDEA.
  User: liliyasayfutdinova
  Date: 2025-02-23
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Login"/>
<%@ include file="../WEB-INF/fragments/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <!-- Font Awesome CDN link for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            padding: 15px;
            background: url("/img/hero.png");
            overflow: hidden;
        }

        .loginform {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            background: url("/img/hero.png");

        }

        .wrapper {
            align-items: center;
            justify-content: center;
            /*max-width: 500px;*/
            width: 50%;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.1);
            text-align: center; /* Centers text horizontally */
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
    </style>

</head>
<body align="center">
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
<div class="loginform" style="justify-content: center">
    <div class="wrapper">
        <div class="title"><span>Login Form</span></div>
        <form action="/login" method="post" align="center">
            <div class="row">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="name" name="username" required/>
            </div>
            <div class="row">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="password" name="password" required/>
            </div>
            <div class="pass"><a href="#">Forgot password?</a></div>
            <div class="row button">
                <input type="submit" value="Login"/>
            </div>
            <div class="signup-link">Not a member? <a href="/register">Signup now</a></div>
        </form>
    </div>
</div>

<%--<#--<form action="/login" method="post">-->--%>
<%--    --%>
<%--    <#--    <h3 style="text-indent:30px">-->--%>
<%--        <#--        Login<input type="text" name="username">-->--%>
<%--        <#--        <br>-->--%>
<%--        <#--    <br>-->--%>
<%--        <#--    Password<input type="password" name="password">-->--%>
<%--        <#--        <br>-->--%>
<%--        <#--        <br>-->--%>
<%--        <#--    <input type="submit" value="Login" class="button2">-->--%>
<%--        <#--    </h3>-->--%>
<%--    <#--</form>-->--%>
</body>
</html>


<%--<div class="row">--%>
<%--    <div class="col">--%>
<%--        <h1>Login to GritCRM</h1>--%>

<%--        <form method="POST" action="/login">--%>

<%--            <c:if test="${not empty error}">--%>
<%--                <div class="alert alert-danger">--%>
<%--                        ${error}--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${not empty message}">--%>
<%--                <div class="alert alert-success" role="alert">--%>
<%--                        ${message}--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="username" class="form-label">Username</label>--%>
<%--                <input type="text" id="username" name="username" value="${username}" class="form-control" aria-describedby="usernameHelp">--%>
<%--                <div id="usernameHelp" class="form-text">Enter your username here!</div>--%>
<%--            </div>--%>

<%--            <div class="mb-3">--%>
<%--                <label for="password" class="form-label">Password</label>--%>
<%--                <input type="password" id="password" name="password" class="form-control" aria-describedby="passwordHelp">--%>
<%--                <div id="passwordHelp" class="form-text">Enter your password here!</div>--%>
<%--            </div>--%>

<%--            <button type="submit" class="btn btn-primary">Login</button>--%>

<%--        </form>--%>
<%--        <p>You do not already have an account, you can <a href="/view/register.jsp">register one here</a>.</p>--%>
<%--    </div>--%>
<%--</div>--%>


<%@ include file="../WEB-INF/fragments/footer.jsp" %>