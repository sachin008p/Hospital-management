<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<main class="hm-page">
		<div class="container">
			<section class="hm-hero mb-4" style="--hero-image: url('<c:url value='/resources/images/image-8.png'/>');">
				<p class="fw-bold text-uppercase mb-2">Patient Dashboard</p>
				<h1>My Appointments</h1>
				<p class="mt-3">Track appointment requests, assigned doctors, and current visit status.</p>
			</section>

			<div class="hm-card">
				<div class="card-body">
					<div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-3">
						<div>
							<h2 class="hm-section-title mb-1">Appointment List</h2>
							<p class="hm-section-subtitle mb-0">Your recent hospital bookings</p>
						</div>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/user_appointment"><i class="fa-solid fa-plus me-2"></i>Book Again</a>
					</div>

					<div class="hm-table-tools">
						<div class="hm-search-box"><i class="fa-solid fa-magnifying-glass"></i><input type="search" class="form-control" placeholder="Search appointments"></div>
						<select class="form-select"><option>All statuses</option><option>Pending</option><option>OK</option></select>
					</div>

					<div class="table-responsive">
						<table class="table table-hover align-middle">
							<thead>
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
										<td colspan="7" class="text-center text-danger py-4">No Appointments Found</td>
									</tr>
								</c:if>
								<c:forEach var="ap" items="${appointmentList}" varStatus="s">
									<tr>
										<td class="fw-semibold">${ap.fullname}</td>
										<td>${ap.gender}</td>
										<td>${ap.age}</td>
										<td>${ap.appointDate}</td>
										<td>${ap.diseases}</td>
										<td>${ap.doctorId}</td>
										<td>
											<c:choose>
												<c:when test="${ap.status eq 'Pending'}"><span class="badge bg-warning text-dark">Pending</span></c:when>
												<c:when test="${ap.status eq 'OK'}"><span class="badge bg-success">OK</span></c:when>
												<c:otherwise><span class="badge bg-danger">${ap.status}</span></c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="hm-pagination"><span>Showing your appointment history</span><div><button class="btn btn-sm btn-light">Prev</button><button class="btn btn-sm btn-primary">1</button><button class="btn btn-sm btn-light">Next</button></div></div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
