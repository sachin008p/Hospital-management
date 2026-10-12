<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<%@ include file="../component/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

	<%@ include file="./navbar.jsp"%>

	<div class="container p-5">
		<p class="text-center fs-3 fw-bold">Admin Dashboard</p>

		<!-- Error Message -->
		<c:if test="${not empty errorMsg}">
			<p class="fs-5 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<!-- Success Message -->
		<c:if test="${not empty succMsg}">
			<p class="fs-5 text-center text-primary">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<div class="row">

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4">
						Doctor <br> ${doctCount}
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4">User <br> ${userCount}</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">Total Appointment <br> ${apCount}</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-3">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-primary"
						style="cursor: pointer;">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">Specialist <br> ${spCount} </p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/addSpecialist"
						method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control" required>
						</div>

						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="../component/footer.jsp"%>

</body>
</html>