<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Patient Comment</title>

<%@ include file="../common/allcss.jsp"%>
</head>
<body class="bg-light">
	<!-- SESSION CHECK -->
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login" />
	</c:if>
	<!-- NAVBAR -->
	<%@ include file="navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card shadow">
					<div class="card-header bg-primary text-white text-center">
						<h3>
							<i class="fas fa-comment-medical"></i> Patient Comment
						</h3>
					</div>
					<div class="card-body">
						<!-- SUCCESS MESSAGE -->
						<c:if test="${not empty sucMsg}">
							<div class="alert alert-success text-center">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<!-- ERROR MESSAGE -->
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger text-center">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form
							action="${pageContext.request.contextPath}/doctor/updateStatus"
							method="post">
							<div class="row">
								<!-- PATIENT NAME -->
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"> Patient Name </label> <input
										type="text" class="form-control"
										value="${appointment.fullname}" readonly>
								</div>
								<!-- AGE -->
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"> Age </label> <input
										type="text" class="form-control" value="${appointment.age}"
										readonly>
								</div>
								<!-- MOBILE -->
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"> Mobile No </label> <input
										type="text" class="form-control" value="${appointment.phno}"
										readonly>
								</div>
								<!-- DISEASE -->
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"> Diseases </label> <input
										type="text" class="form-control"
										value="${appointment.diseases}" readonly>
								</div>
								<!-- COMMENT -->
								<div class="col-md-12 mb-3">
									<label class="form-label fw-bold"> Comment </label>
									<textarea rows="4" name="comm" class="form-control" required></textarea>
								</div>
								<!-- HIDDEN ID -->
								<input type="hidden" name="id" value="${appointment.id}">
								<!-- SUBMIT BUTTON -->
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary px-5">

										<i class="fas fa-paper-plane"></i> Submit Comment

									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>