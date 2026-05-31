<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Edit Profile</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login" />
	</c:if>
	<%@include file="navbar.jsp"%>

	<main class="hm-page">
		<div class="container">
			<div class="row g-4">
				<div class="col-lg-4">
					<div class="hm-card hm-fade-in">
						<div class="card-body">
							<h2 class="hm-section-title">Change Password</h2>
							<p class="hm-section-subtitle">Keep doctor access secure.</p>

							<c:if test="${not empty succMsg}">
								<div class="alert alert-success hm-alert">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<div class="alert alert-danger hm-alert">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/doctor/changePassword" method="post">
								<div class="form-floating mb-3">
									<input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="New Password" required />
									<label for="newPassword">New Password</label>
								</div>
								<div class="form-floating mb-4">
									<input type="password" name="oldPassword" class="form-control" id="oldPassword" placeholder="Old Password" required />
									<label for="oldPassword">Old Password</label>
								</div>
								<button class="btn btn-primary w-100 py-3">Change Password</button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-8">
					<div class="hm-card hm-fade-in">
						<div class="card-body p-lg-4">
							<h2 class="hm-section-title">Edit Profile</h2>
							<p class="hm-section-subtitle">Update your clinical identity and contact information.</p>

							<c:if test="${not empty succMsgd}">
								<div class="alert alert-success hm-alert">${succMsgd}</div>
								<c:remove var="succMsgd" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsgd}">
								<div class="alert alert-danger hm-alert">${errorMsgd}</div>
								<c:remove var="errorMsgd" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/doctor/updateProfile" method="post" class="row g-3">
								<input type="hidden" name="id" value="${doctorObj.id}">
								<div class="col-md-6 form-floating">
									<input type="text" name="fullname" class="form-control" id="fullname" value="${doctorObj.fullname}" placeholder="Full Name" required />
									<label for="fullname">Full Name</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="date" name="dob" class="form-control" id="dob" value="${doctorObj.dob}" placeholder="DOB" required />
									<label for="dob">DOB</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" name="qualification" class="form-control" id="qualification" value="${doctorObj.qualification}" placeholder="Qualification" required />
									<label for="qualification">Qualification</label>
								</div>
								<div class="col-md-6 form-floating">
									<select name="spec" class="form-select" id="spec" required>
										<option value="">Select specialist</option>
										<c:forEach items="${specialistList}" var="s">
											<option value="${s.specName}">${s.specName}</option>
										</c:forEach>
									</select>
									<label for="spec">Specialist</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="email" name="email" class="form-control" id="email" value="${doctorObj.email}" placeholder="Email" required />
									<label for="email">Email</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" name="mobno" class="form-control" id="mobno" value="${doctorObj.mobno}" placeholder="Mobile No" required />
									<label for="mobno">Mobile No</label>
								</div>
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary px-4 py-3"><i class="fa-solid fa-floppy-disk me-2"></i>Update Profile</button>
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
