<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="./navbar.jsp"%>

	<main class="hm-page">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="hm-card hm-fade-in">
						<div class="card-body p-lg-4">
							<h1 class="hm-section-title">Add Doctor</h1>
							<p class="hm-section-subtitle">Create a clinician profile and assign a specialist department.</p>

							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger hm-alert">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg}">
								<div class="alert alert-success hm-alert">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/addDoctor" method="post" class="row g-3">
								<div class="col-md-6 form-floating">
									<input type="text" required name="fullname" class="form-control" id="fullname" placeholder="Full Name">
									<label for="fullname">Full Name</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="date" required name="dob" class="form-control" id="dob" placeholder="DOB">
									<label for="dob">DOB</label>
								</div>
								<div class="col-md-6 form-floating">
									<input required name="qualification" type="text" class="form-control" id="qualification" placeholder="Qualification">
									<label for="qualification">Qualification</label>
								</div>
								<div class="col-md-6 form-floating">
									<select name="spec" required class="form-select" id="spec">
										<option value="">Select specialist</option>
										<c:forEach items="${specList}" var="s">
											<option value="${s.specName}">${s.specName}</option>
										</c:forEach>
									</select>
									<label for="spec">Specialist</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="email" required name="email" class="form-control" id="email" placeholder="Email">
									<label for="email">Email</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" required name="mobno" class="form-control" id="mobno" placeholder="Mobile No">
									<label for="mobno">Mobile No</label>
								</div>
								<div class="col-md-12 form-floating">
									<input required name="password" type="password" class="form-control" id="password" placeholder="Password">
									<label for="password">Password</label>
								</div>
								<div class="col-md-12 d-flex gap-2">
									<button type="submit" class="btn btn-primary px-4"><i class="fa-solid fa-user-plus me-2"></i>Submit</button>
									<a href="${pageContext.request.contextPath}/admin/view_doctor" class="btn btn-outline-primary px-4">View Doctors</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@include file="../component/footer.jsp"%>
</body>
</html>
