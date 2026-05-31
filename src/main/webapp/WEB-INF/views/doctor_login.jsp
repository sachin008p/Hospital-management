<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<main class="hm-auth">
		<div class="container">
			<div class="row align-items-center g-4">
				<div class="col-lg-7">
					<section class="hm-auth-hero" style="--hero-image: url('<c:url value='/resources/images/hospital3.jpg'/>');">
						<p class="fw-bold text-uppercase mb-2">Clinical Portal</p>
						<h1>Fast access for doctors and care teams.</h1>
						<p class="mt-3">Review appointments, update patient status, and manage your profile from a focused workspace.</p>
					</section>
				</div>
				<div class="col-lg-5">
					<div class="hm-card hm-auth-card hm-fade-in">
						<div class="hm-auth-icon mb-3"><i class="fa-solid fa-user-doctor"></i></div>
						<h2 class="hm-section-title">Doctor Login</h2>
						<p class="hm-section-subtitle">Continue to your clinical dashboard.</p>

						<c:if test="${not empty sucMsg}">
							<div class="alert alert-success hm-alert">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger hm-alert">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="${pageContext.request.contextPath}/doctor/login" method="post">
							<div class="form-floating mb-3">
								<input required name="email" type="email" class="form-control" id="doctorEmail" placeholder="name@example.com">
								<label for="doctorEmail">Email address</label>
							</div>
							<div class="form-floating mb-4">
								<input required name="password" type="password" class="form-control" id="doctorPassword" placeholder="Password">
								<label for="doctorPassword">Password</label>
							</div>
							<div class="hm-auth-options">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="doctorRemember">
									<label class="form-check-label" for="doctorRemember">Remember me</label>
								</div>
								<a href="#" onclick="return false;">Forgot password?</a>
							</div>
							<button type="submit" class="btn btn-primary w-100 py-3"><i class="fa-solid fa-stethoscope me-2"></i>Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
