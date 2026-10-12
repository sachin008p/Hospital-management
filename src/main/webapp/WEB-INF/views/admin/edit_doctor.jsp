<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Doctor</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="./navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold">Edit Doctor</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-primary">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="${pageContext.request.contextPath}/updateDoctor"
							method="post">

							
							<input type="hidden" name="id" value="${doctor.id}">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" value="${doctor.fullname}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" value="${doctor.dob}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification"
									value="${doctor.qualification}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control">
									<c:forEach items="${specList}" var="s">
										<option value="${s.specName}"
											${s.specName == doctor.spec ? 'selected' : ''}>
											${s.specName}</option>
									</c:forEach>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									name="email" value="${doctor.email}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" value="${doctor.mobno}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input type="text"
									name="password" value="${doctor.password}" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../component/footer.jsp"%>
</body>
</html>