<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Patient Appointments</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login"/>
	</c:if>
	<%@ include file="navbar.jsp"%>

	<main class="hm-page">
		<div class="container-fluid px-4">
			<div class="hm-card hm-fade-in">
				<div class="card-body">
					<h1 class="hm-section-title">Patient Appointment Details</h1>
					<p class="hm-section-subtitle">Review appointment requests and complete consultations with comments.</p>

					<c:if test="${not empty sucMsg}">
						<div class="alert alert-success alert-dismissible fade show hm-alert" role="alert">
							${sucMsg}
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
						</div>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMsg}">
						<div class="alert alert-danger alert-dismissible fade show hm-alert" role="alert">
							${errorMsg}
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
						</div>
						<c:remove var="errorMsg" scope="session"/>
					</c:if>

					<div class="hm-table-tools">
						<div class="hm-search-box"><i class="fa-solid fa-magnifying-glass"></i><input type="search" class="form-control" placeholder="Search appointments"></div>
						<select class="form-select"><option>All statuses</option><option>Pending</option><option>Completed</option></select>
					</div>

					<div class="table-responsive">
						<table class="table table-hover align-middle">
							<thead>
								<tr>
									<th>#</th>
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Appointment Date</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Diseases</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty appointmentList}">
									<tr>
										<td colspan="10" class="text-center text-danger fw-bold py-4">No Appointments Found</td>
									</tr>
								</c:if>
								<c:forEach var="ap" items="${appointmentList}" varStatus="s">
									<tr>
										<td>${s.count}</td>
										<td class="fw-semibold">${ap.fullname}</td>
										<td>${ap.gender}</td>
										<td>${ap.age}</td>
										<td>${ap.appointDate}</td>
										<td>${ap.email}</td>
										<td>${ap.phno}</td>
										<td>${ap.diseases}</td>
										<td>
											<c:choose>
												<c:when test="${ap.status eq 'Pending'}"><span class="badge bg-warning text-dark">${ap.status}</span></c:when>
												<c:otherwise><span class="badge bg-success">${ap.status}</span></c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${ap.status eq 'Pending'}">
													<a href="${pageContext.request.contextPath}/doctor/comment?id=${ap.id}" class="btn btn-success btn-sm"><i class="fas fa-comment-medical me-1"></i>Comment</a>
												</c:when>
												<c:otherwise>
													<button class="btn btn-secondary btn-sm" disabled><i class="fas fa-check-circle me-1"></i>Completed</button>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="hm-pagination"><span>Showing assigned appointments</span><div><button class="btn btn-sm btn-light">Prev</button><button class="btn btn-sm btn-primary">1</button><button class="btn btn-sm btn-light">Next</button></div></div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
