<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Edit Profile</title>

<%@include file="../common/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>

<body>
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login" />
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<!-- Change Password -->

			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3 fw-bold">Change Password</p>

					<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<div class="card-body">


						<form
							action="${pageContext.request.contextPath}/doctor/changePassword"
							method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="password"
									name="newPassword" class="form-control" required />
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="password"
									name="oldPassword" class="form-control" required />
							</div>

							<button class="btn btn-primary col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Edit Profile -->

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3 fw-bold">Edit Profile</p>

					<c:if test="${not empty succMsgd}">
						<p class="text-center text-success">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd}">
						<p class="text-center text-danger">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>

					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/doctor/updateProfile"
							method="post">

							<input type="hidden" name="id" value="${doctorObj.id}">

							<div class="mb-3">
								<label>Full Name</label> <input type="text" name="fullname"
									class="form-control" value="${doctorObj.fullname}" required />
							</div>

							<div class="mb-3">
								<label>DOB</label> <input type="date" name="dob"
									class="form-control" value="${doctorObj.dob}" required />
							</div>

							<div class="mb-3">
								<label>Qualification</label> <input type="text"
									name="qualification" class="form-control"
									value="${doctorObj.qualification}" required />
							</div>

							<div class="mb-3">

								<label>Specialist</label> <select name="spec"
									class="form-control" required>

									<option value="">--Select--</option>

									<c:forEach items="${specialistList}" var="s">

										<option value="${s.specName}">${s.specName}</option>

									</c:forEach>

								</select>

							</div>

							<div class="mb-3">

								<label>Email</label> <input type="email" name="email"
									class="form-control" value="${doctorObj.email}" required />

							</div>

							<div class="mb-3">

								<label>Mobile No</label> <input type="text" name="mobno"
									class="form-control" value="${doctorObj.mobno}" required />

							</div>

							<button type="submit" class="btn btn-primary">Update
								Profile</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
