<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointment</title>

<%@include file="../common/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}


</style>
</head>

<body>

	<%@include file="navbar.jsp"%>

	

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center text-primary fs-3 fw-bold">
							Patient Details</p>

						<table class="table table-bordered">
							<thead class="table-light">
								<tr>
									
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Date</th>
									<th>Email</th>
									<th>Mob No</th>
									<th>Disease</th>
									<th>Doctor Name</th>
									<th>Address</th>
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
										<td>${ap.email}</td>
										<td>${ap.phno}</td>
										<td>${ap.diseases}</td>
										<td>${ap.doctorName}</td>
										<td>${ap.address}</td>
										<td>${ap.status}</td>
										
										
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