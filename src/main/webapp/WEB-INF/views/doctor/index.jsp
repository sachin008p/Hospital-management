<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Doctor Dashboard</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login"/>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="hm-shell">
		<aside class="hm-sidebar">
			<div class="hm-sidebar-title">Doctor Workspace</div>
			<a class="hm-side-link active" href="${pageContext.request.contextPath}/doctor/index"><i class="fa-solid fa-chart-pie"></i> Dashboard</a>
			<a class="hm-side-link" href="${pageContext.request.contextPath}/doctor/patient"><i class="fa-solid fa-calendar-check"></i> Appointments</a>
			<a class="hm-side-link" href="${pageContext.request.contextPath}/doctor/editProfile"><i class="fa-solid fa-user-pen"></i> Profile</a>
		</aside>

		<main class="hm-main hm-fade-in">
			<section class="hm-hero hm-loading mb-4" style="--hero-image: url('<c:url value='/resources/images/hospital3.jpg'/>');">
				<div class="row align-items-center g-4">
					<div class="col-lg-8">
						<p class="fw-bold text-uppercase mb-2">Clinical Workspace</p>
						<h1>Welcome, Dr. ${sessionScope.doctorObj.fullname}</h1>
						<p class="mt-3">Track patient appointments, review cases, and keep your profile current.</p>
					</div>
					<div class="col-lg-4 text-lg-end">
						<a href="${pageContext.request.contextPath}/doctor/patient" class="btn btn-light text-primary fw-bold">
							<i class="fa-solid fa-calendar-check me-2"></i>View Appointments
						</a>
					</div>
				</div>
			</section>

			<div class="row g-4 mb-4">
				<div class="col-md-6">
					<div class="hm-card hm-stat hm-lift">
						<div class="hm-stat-icon"><i class="fas fa-user-md"></i></div>
						<div class="hm-stat-value">${doctorCount}</div>
						<div class="hm-stat-label">Doctors in System</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="hm-card hm-stat hm-lift">
						<div class="hm-stat-icon"><i class="far fa-calendar-check"></i></div>
						<div class="hm-stat-value">${appointmentCount}</div>
						<div class="hm-stat-label">Assigned Appointments</div>
					</div>
				</div>
			</div>

			<div class="row g-4">
				<div class="col-lg-8">
					<div class="hm-card">
						<div class="card-body">
							<h2 class="hm-section-title">Today's Focus</h2>
							<p class="hm-section-subtitle">A clean summary of your active care workload.</p>
							<div class="table-responsive">
								<table class="table table-hover align-middle">
									<thead>
										<tr>
											<th>Work Area</th>
											<th>Priority</th>
											<th>Count</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Appointment review</td>
											<td><span class="badge bg-warning text-dark">Pending checks</span></td>
											<td class="fw-bold">${appointmentCount}</td>
										</tr>
										<tr>
											<td>Clinical availability</td>
											<td><span class="badge bg-success">Online</span></td>
											<td class="fw-bold">Active</td>
										</tr>
										<tr>
											<td>Profile completeness</td>
											<td><span class="badge bg-info">Recommended</span></td>
											<td><a href="${pageContext.request.contextPath}/doctor/editProfile" class="btn btn-sm btn-outline-primary">Update</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="hm-card h-100">
						<div class="card-body">
							<h2 class="hm-section-title mb-3">Quick Actions</h2>
							<div class="d-grid gap-3">
								<a class="hm-quick-action" href="${pageContext.request.contextPath}/doctor/patient"><i class="fa-solid fa-notes-medical"></i> Patient appointments</a>
								<a class="hm-quick-action" href="${pageContext.request.contextPath}/doctor/editProfile"><i class="fa-solid fa-user-pen"></i> Edit profile</a>
								<a class="hm-quick-action" href="${pageContext.request.contextPath}/doctor/logout"><i class="fa-solid fa-arrow-right-from-bracket"></i> Secure logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row g-4 mt-1">
				<div class="col-lg-7">
					<div class="hm-card h-100">
						<div class="card-body">
							<h2 class="hm-section-title mb-1">Consultation Flow</h2>
							<p class="hm-section-subtitle">Daily workload visualization</p>
							<div class="hm-chart-placeholder hm-chart-line">
								<span style="height: 36%"></span><span style="height: 58%"></span><span style="height: 46%"></span><span style="height: 76%"></span><span style="height: 64%"></span><span style="height: 86%"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="hm-card h-100">
						<div class="card-body">
							<h2 class="hm-section-title mb-3">Care Notifications</h2>
							<div class="hm-activity-list">
								<div><i class="fa-solid fa-calendar-check"></i><span>${appointmentCount} appointments assigned to your workspace.</span></div>
								<div><i class="fa-solid fa-user-pen"></i><span>Keep your profile updated for patient routing.</span></div>
								<div><i class="fa-solid fa-lock"></i><span>Use secure logout after clinical sessions.</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
