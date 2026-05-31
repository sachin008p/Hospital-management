<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration</title>
<%@include file="component/allcss.jsp" %>
</head>
<body>
  <%@include file="component/navbar.jsp" %>

  <main class="hm-auth">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="hm-card hm-auth-card hm-fade-in">
            <div class="hm-auth-icon mb-3"><i class="fa-solid fa-user-plus"></i></div>
            <h2 class="hm-section-title">Create Patient Account</h2>
            <p class="hm-section-subtitle">Register once to book and monitor hospital appointments.</p>

            <c:if test="${not empty sucMsg}">
              <div class="alert alert-success hm-alert">${sucMsg}</div>
              <c:remove var="sucMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty errorMsg}">
              <div class="alert alert-danger hm-alert">${errorMsg}</div>
              <c:remove var="errorMsg" scope="session"/>
            </c:if>

            <form action="${pageContext.request.contextPath}/user_register" method="post">
              <div class="form-floating mb-3">
                <input required name="fullname" type="text" class="form-control" id="regName" placeholder="Full Name">
                <label for="regName">Full Name</label>
              </div>
              <div class="form-floating mb-3">
                <input required name="email" type="email" class="form-control" id="regEmail" placeholder="name@example.com">
                <label for="regEmail">Email address</label>
              </div>
              <div class="form-floating mb-4">
                <input required name="password" type="password" class="form-control" id="regPassword" placeholder="Password">
                <label for="regPassword">Password</label>
              </div>
              <button type="submit" class="btn btn-primary w-100 py-3"><i class="fa-solid fa-user-check me-2"></i>Register</button>
            </form>
            <p class="text-center mt-4 mb-0">Already registered? <a href="user_login" class="text-decoration-none fw-bold">Log in</a></p>
          </div>
        </div>
      </div>
    </div>
  </main>
</body>
</html>
