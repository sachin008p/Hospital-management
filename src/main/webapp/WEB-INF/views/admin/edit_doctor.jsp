<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>
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
							<h1 class="hm-section-title">Edit Doctor</h1>
							<p class="hm-section-subtitle">Update doctor profile, specialty, contact, and login details.</p>

							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger hm-alert">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg}">
								<div class="alert alert-success hm-alert">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/updateDoctor" method="post" class="row g-3">
								<input type="hidden" name="id" value="${doctor.id}">
								<div class="col-md-6 form-floating">
									<input type="text" name="fullname" value="${doctor.fullname}" class="form-control" id="fullname" placeholder="Full Name">
									<label for="fullname">Full Name</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="date" name="dob" value="${doctor.dob}" class="form-control" id="dob" placeholder="DOB">
									<label for="dob">DOB</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" name="qualification" value="${doctor.qualification}" class="form-control" id="qualification" placeholder="Qualification">
									<label for="qualification">Qualification</label>
								</div>
								<div class="col-md-6 form-floating">
									<select name="spec" class="form-select" id="spec">
										<c:forEach items="${specList}" var="s">
											<option value="${s.specName}" ${s.specName == doctor.spec ? 'selected' : ''}>${s.specName}</option>
										</c:forEach>
									</select>
									<label for="spec">Specialist</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="email" name="email" value="${doctor.email}" class="form-control" id="email" placeholder="Email">
									<label for="email">Email</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" name="mobno" value="${doctor.mobno}" class="form-control" id="mobno" placeholder="Mobile No">
									<label for="mobno">Mobile No</label>
								</div>
								<div class="col-md-12 form-floating">
									<input type="text" name="password" value="${doctor.password}" class="form-control" id="password" placeholder="Password">
									<label for="password">Password</label>
								</div>
								<div class="col-md-12 d-flex gap-2">
									<button type="submit" class="btn btn-primary px-4"><i class="fa-solid fa-floppy-disk me-2"></i>Update</button>
									<a href="${pageContext.request.contextPath}/admin/view_doctor" class="btn btn-outline-primary px-4">Back</a>
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
