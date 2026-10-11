<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<%@ include file="../common/allcss.jsp" %>

<style>
.paint-card {
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>

</head>
<body>

<%@ include file="../common/navbar.jsp" %>

<div class="container p-5">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card paint-card">
        <div class="card-body">
          <p class="fs-4 text-center fw-bold">Admin Login</p>

          <c:if test="${not empty succMsg}">
            <p class="text-center text-primary">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
          </c:if>

          <c:if test="${not empty errorMsg}">
            <p class="text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session"/>
          </c:if>

          <form action="${pageContext.request.contextPath}/adminLogin" method="post">
            <div class="mb-3">
              <label>Email</label>
              <input name="email" type="email" class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Password</label>
              <input name="password" type="password" class="form-control" required>
            </div>

            <button class="btn bg-primary text-white col-md-12">Login</button>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>