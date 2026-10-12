<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointment</title>

<%@include file="component/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("<c:url value='/resources/images/image-8.png'/>");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>

<body>

	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">Appointment List</p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">

				<div class="card paint-card">
					<div class="card-body">

						<p class="text-center text-primary fs-3 fw-bold">Your
							Appointments</p>

						<table class="table table-bordered">
							<thead class="table-light">
								<tr>
									
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Date</th>
									<th>Disease</th>
									<th>Doctor ID</th>
									<th>Status</th>
								</tr>
							</thead>

							<tbody>

								<c:if test="${empty appointmentList}">
									<tr>
										<td colspan="8" class="text-center text-danger">No
											Appointments Found</td>
									</tr>
								</c:if>

								<c:forEach var="ap" items="${appointmentList}" varStatus="s">

									<tr>
										
										<td>${ap.fullname}</td>
										<td>${ap.gender}</td>
										<td>${ap.age}</td>
										<td>${ap.appointDate}</td>
										<td>${ap.diseases}</td>
										<td>${ap.doctorId}</td>
										<td><c:choose>
												<c:when test="${ap.status eq 'Pending'}">
													<span class="badge bg-warning">Pending</span>
												</c:when>

												<c:when test="${ap.status eq 'OK'}">
													<span class="badge bg-success">OK</span>
												</c:when>

												<c:otherwise>
													<span class="badge bg-danger">${ap.status}</span>
												</c:otherwise>
											</c:choose></td>
									</tr>

								</c:forEach>

							</tbody>
						</table>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>