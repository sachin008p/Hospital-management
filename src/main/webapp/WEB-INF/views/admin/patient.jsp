<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Records</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<main class="hm-page">
		<div class="container-fluid px-4">
			<div class="hm-card hm-fade-in">
				<div class="card-body">
					<h1 class="hm-section-title">Patient Details</h1>
					<p class="hm-section-subtitle">Appointment requests and patient intake information.</p>

					<div class="hm-table-tools">
						<div class="hm-search-box"><i class="fa-solid fa-magnifying-glass"></i><input type="search" class="form-control" placeholder="Search patients"></div>
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
									<th>Email</th>
									<th>Mobile</th>
									<th>Disease</th>
									<th>Doctor Name</th>
									<th>Address</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty appointmentList}">
									<tr>
										<td colspan="10" class="text-center text-danger py-4">No Appointments Found</td>
									</tr>
								</c:if>
								<c:forEach var="ap" items="${appointmentList}" varStatus="s">
									<tr>
										<td class="fw-semibold">${ap.fullname}</td>
										<td>${ap.gender}</td>
										<td>${ap.age}</td>
										<td>${ap.appointDate}</td>
										<td>${ap.email}</td>
										<td>${ap.phno}</td>
										<td>${ap.diseases}</td>
										<td>${ap.doctorName}</td>
										<td>${ap.address}</td>
										<td><span class="badge bg-primary">${ap.status}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="hm-pagination"><span>Showing appointment records</span><div><button class="btn btn-sm btn-light">Prev</button><button class="btn btn-sm btn-primary">1</button><button class="btn btn-sm btn-light">Next</button></div></div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
