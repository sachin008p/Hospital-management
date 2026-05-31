<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Change Password</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty sessionScope.userObj}">
		<c:redirect url="/user_login" />
	</c:if>

	<main class="hm-auth">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="hm-card hm-auth-card hm-fade-in">
						<div class="hm-auth-icon mb-3"><i class="fa-solid fa-key"></i></div>
						<h1 class="hm-section-title">Change Password</h1>
						<p class="hm-section-subtitle">Protect your patient portal with a fresh password.</p>

						<c:if test="${not empty succMsg}">
							<div class="alert alert-success hm-alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger hm-alert">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="${pageContext.request.contextPath}/userChangePassword" method="post">
							<div class="form-floating mb-3">
								<input type="password" name="oldPassword" class="form-control" id="oldPassword" placeholder="Old Password" required />
								<label for="oldPassword">Old Password</label>
							</div>
							<div class="form-floating mb-4">
								<input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="New Password" required />
								<label for="newPassword">New Password</label>
							</div>
							<input type="hidden" value="${sessionScope.userObj.id}" name="uid" />
							<button class="btn btn-primary w-100 py-3">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@include file="component/footer.jsp"%>
</body>
</html>
