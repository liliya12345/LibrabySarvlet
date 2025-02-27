<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Register" />
<%@ include file="/WEB-INF/fragments/header.jsp" %>

<%--<h1>Registrera till CRM</h1>--%>
<%--&lt;%&ndash;<c:if test="${empty success}">&ndash;%&gt;--%>
<%--  <form method="POST" action="/register">--%>
<%--    <c:if test="${not empty error}">--%>
<%--      <div class="alert alert-danger" role="alert">--%>
<%--          ${error}--%>
<%--      </div>--%>
<%--    </c:if>--%>
<%--    <div class="mb-3">--%>
<%--      <label for="username" class="form-label">Username</label>--%>
<%--      <input type="text" class="form-control" id="username" aria-describedby="usernameHelp" name="username" value="${username}">--%>
<%--      <div id="usernameHelp" class="form-text">Enter your username here</div>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label for="password1" class="form-label">Password</label>--%>
<%--      <input type="password" class="form-control" id="password1" name="password1" value="${password1}">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label for="password2" class="form-label">Password (again)</label>--%>
<%--      <input type="password" class="form-control" id="password2" name="password2" value="${password2}">--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--  </form>--%>
<%--  <p>You already have an account, you can <a href="/view/login.jsp">sign in here</a>.</p>--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--<c:if test="${not empty success}">--%>
<%--  <div class="alert alert-alert alert-success" role="alert">--%>
<%--      ${success}--%>
<%--  </div>--%>
<%--  <p>--%>
<%--    <a href="login">Click here to login!</a>--%>
<%--  </p>--%>
<%--</c:if>--%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registration</title>
  <!-- Font Awesome CDN link for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

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
      background: #101010;
      overflow: hidden;
    }

    .registation_form {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 80vh;

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
<body align ="center">
<div class="registation_form">
<%--<c:if test="${empty success}">--%>
  <c:if test="${not empty error}">
    <div id="errorMessage" class="w3-panel w3-red" role="alert" aria-live="polite" aria-atomic="true">
        <span onclick="this.parentElement.style.display='none'"
              class="w3-button w3-large w3-display-topright"
              aria-label="Close error message">&times;</span>
        ${error}
    </div>
  </c:if>
  <div class="wrapper">
    <div class="title"><span>Registration Form</span></div>
    <form action="/register" method="post">
      <div class="row">
        <i class="fas fa-user"></i>
        <input type="text"  id="firstname"  name="firstname" placeholder="Firstname" required>
      </div>
      <div class="row">
        <i class="fas fa-user"></i>
        <input type="text"  id="lastname"  name="lastname" placeholder="Lastname" required>
      </div>
      <div class="row">
        <i class="fas fa-user"></i>
        <input type="text"  id="username"  name="username" placeholder="Username" required>
      </div>
      <div class="row">
        <i class="fas fa-lock"></i>
        <input type="password" id="password1" name="password1" placeholder="Password" required>
      </div>
      <div class="row">
        <i class="fas fa-lock"></i>
        <input type="password" id="password2" name="password2" placeholder="Password(again)" required>
      </div>
      <div class="row button">
        <input type="submit" value="Registration" />
      </div>
    </form>
    <p>You already have an account, you can <a href="/view/login.jsp">sign in here</a>.</p>
    <c:if test="${not empty success}">
      <div class="w3-panel w3-green" role="alert">
          ${success}
      </div>
      <p>
        <a href="login">Click here to login!</a>
      </p>
    </c:if>

  </div>
</div>
<%--</c:if>--%>
</body>
</html>










<%@ include file="/WEB-INF/fragments/footer.jsp" %>