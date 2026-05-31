<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Patient Comment</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login" />
	</c:if>
	<%@ include file="navbar.jsp"%>

	<main class="hm-page">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="hm-card hm-fade-in">
						<div class="card-body p-lg-4">
							<h1 class="hm-section-title"><i class="fas fa-comment-medical text-primary me-2"></i>Patient Comment</h1>
							<p class="hm-section-subtitle">Add consultation notes and close the appointment status.</p>

							<c:if test="${not empty sucMsg}">
								<div class="alert alert-success hm-alert">${sucMsg}</div>
								<c:remove var="sucMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger hm-alert">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/doctor/updateStatus" method="post" class="row g-3">
								<div class="col-md-6 form-floating">
									<input type="text" class="form-control" id="patientName" value="${appointment.fullname}" placeholder="Patient Name" readonly>
									<label for="patientName">Patient Name</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" class="form-control" id="age" value="${appointment.age}" placeholder="Age" readonly>
									<label for="age">Age</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" class="form-control" id="mobile" value="${appointment.phno}" placeholder="Mobile No" readonly>
									<label for="mobile">Mobile No</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" class="form-control" id="diseases" value="${appointment.diseases}" placeholder="Diseases" readonly>
									<label for="diseases">Diseases</label>
								</div>
								<div class="col-md-12 form-floating">
									<textarea rows="4" name="comm" class="form-control" id="comment" placeholder="Comment" style="height: 130px" required></textarea>
									<label for="comment">Comment</label>
								</div>
								<input type="hidden" name="id" value="${appointment.id}">
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary px-5 py-3"><i class="fas fa-paper-plane me-2"></i>Submit Comment</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
