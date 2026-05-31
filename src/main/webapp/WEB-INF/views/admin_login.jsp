<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@ include file="./component/allcss.jsp" %>
</head>
<body>
<%@ include file="./component/navbar.jsp" %>

<main class="hm-auth">
  <div class="container">
    <div class="row align-items-center g-4">
      <div class="col-lg-7">
        <section class="hm-auth-hero" style="--hero-image: url('<c:url value='/resources/images/hospital2.jpg'/>');">
          <p class="fw-bold text-uppercase mb-2">Secure Administration</p>
          <h1>Hospital operations, beautifully organized.</h1>
          <p class="mt-3">Access the enterprise admin console for doctors, departments, patient records, and appointments.</p>
        </section>
      </div>
      <div class="col-lg-5">
        <div class="hm-card hm-auth-card hm-fade-in">
          <div class="hm-auth-icon mb-3"><i class="fa-solid fa-user-shield"></i></div>
          <h2 class="hm-section-title">Admin Login</h2>
          <p class="hm-section-subtitle">Sign in to manage the healthcare system.</p>

          <c:if test="${not empty succMsg}">
            <div class="alert alert-success hm-alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session"/>
          </c:if>
          <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger hm-alert">${errorMsg}</div>
            <c:remove var="errorMsg" scope="session"/>
          </c:if>

          <form action="${pageContext.request.contextPath}/adminLogin" method="post">
            <div class="form-floating mb-3">
              <input name="email" type="email" class="form-control" id="adminEmail" placeholder="name@example.com" required>
              <label for="adminEmail">Email address</label>
            </div>
            <div class="form-floating mb-4">
              <input name="password" type="password" class="form-control" id="adminPassword" placeholder="Password" required>
              <label for="adminPassword">Password</label>
            </div>
            <div class="hm-auth-options">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="adminRemember">
                <label class="form-check-label" for="adminRemember">Remember me</label>
              </div>
              <a href="#" onclick="return false;">Forgot password?</a>
            </div>
            <button class="btn btn-primary w-100 py-3"><i class="fa-solid fa-arrow-right-to-bracket me-2"></i>Login</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="./component/footer.jsp" %>
</body>
</html>
