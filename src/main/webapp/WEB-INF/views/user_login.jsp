<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Login</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<main class="hm-auth">
		<div class="container">
			<div class="row align-items-center g-4">
				<div class="col-lg-7">
					<section class="hm-auth-hero" style="--hero-image: url('<c:url value='/resources/images/hospital1.jpg'/>');">
						<p class="fw-bold text-uppercase mb-2">Patient Portal</p>
						<h1>Book visits and track care in one place.</h1>
						<p class="mt-3">Schedule appointments, see status updates, and manage your healthcare account securely.</p>
					</section>
				</div>
				<div class="col-lg-5">
					<div class="hm-card hm-auth-card hm-fade-in">
						<div class="hm-auth-icon mb-3"><i class="fa-solid fa-circle-user"></i></div>
						<h2 class="hm-section-title">Patient Login</h2>
						<p class="hm-section-subtitle">Access appointments and account settings.</p>

						<c:if test="${not empty sucMsg}">
							<div class="alert alert-success hm-alert">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger hm-alert">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="userLogin" method="post">
							<div class="form-floating mb-3">
								<input required name="email" type="email" class="form-control" id="userEmail" placeholder="name@example.com">
								<label for="userEmail">Email address</label>
							</div>
							<div class="form-floating mb-4">
								<input required name="password" type="password" class="form-control" id="userPassword" placeholder="Password">
								<label for="userPassword">Password</label>
							</div>
							<div class="hm-auth-options">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="userRemember">
									<label class="form-check-label" for="userRemember">Remember me</label>
								</div>
								<a href="#" onclick="return false;">Forgot password?</a>
							</div>
							<button type="submit" class="btn btn-primary w-100 py-3"><i class="fa-solid fa-arrow-right-to-bracket me-2"></i>Login</button>
						</form>
						<p class="text-center mt-4 mb-0">New patient? <a href="${pageContext.request.contextPath}/signup" class="text-decoration-none fw-bold">Create an account</a></p>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
