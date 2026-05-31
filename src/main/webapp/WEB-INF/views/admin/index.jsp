<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body>
	<%@ include file="./navbar.jsp"%>

	<div class="hm-shell">
		<aside class="hm-sidebar">
			<div class="hm-sidebar-title">Admin Workspace</div>
			<a class="hm-side-link active" href="${pageContext.request.contextPath}/admin/index"><i class="fa-solid fa-chart-pie"></i> Dashboard</a>
			<a class="hm-side-link" href="${pageContext.request.contextPath}/admin/add_doctor"><i class="fa-solid fa-user-plus"></i> Add Doctor</a>
			<a class="hm-side-link" href="${pageContext.request.contextPath}/admin/view_doctor"><i class="fa-solid fa-user-doctor"></i> Doctor Directory</a>
			<a class="hm-side-link" href="${pageContext.request.contextPath}/admin/patient"><i class="fa-solid fa-bed-pulse"></i> Patient Records</a>
		</aside>

		<main class="hm-main hm-fade-in">
			<section class="hm-hero hm-loading mb-4" style="--hero-image: url('<c:url value='/resources/images/hospital11.webp'/>');">
				<div class="row align-items-center g-4">
					<div class="col-lg-8">
						<p class="fw-bold text-uppercase mb-2">Enterprise Healthcare Console</p>
						<h1>Admin Dashboard</h1>
						<p class="mt-3">Monitor doctors, patients, specialists, and appointment volume from one operational view.</p>
					</div>
					<div class="col-lg-4 text-lg-end">
						<button class="btn btn-light text-primary fw-bold" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<i class="fa-solid fa-plus me-2"></i>Add Specialist
						</button>
					</div>
				</div>
			</section>

			<c:if test="${not empty errorMsg}">
				<div class="alert alert-danger hm-alert">${errorMsg}</div>
				<c:remove var="errorMsg" scope="session" />
			</c:if>
			<c:if test="${not empty succMsg}">
				<div class="alert alert-success hm-alert">${succMsg}</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<div class="row g-4 mb-4">
				<div class="col-sm-6 col-xl-3"><div class="hm-card hm-stat hm-lift"><div class="hm-stat-icon"><i class="fas fa-user-md"></i></div><div class="hm-stat-value">${doctCount}</div><div class="hm-stat-label">Total Doctors</div></div></div>
				<div class="col-sm-6 col-xl-3"><div class="hm-card hm-stat hm-lift"><div class="hm-stat-icon"><i class="fas fa-user-injured"></i></div><div class="hm-stat-value">${userCount}</div><div class="hm-stat-label">Total Patients</div></div></div>
				<div class="col-sm-6 col-xl-3"><div class="hm-card hm-stat hm-lift"><div class="hm-stat-icon"><i class="far fa-calendar-check"></i></div><div class="hm-stat-value">${apCount}</div><div class="hm-stat-label">Appointments</div></div></div>
				<div class="col-sm-6 col-xl-3"><div class="hm-card hm-stat hm-lift" role="button" data-bs-toggle="modal" data-bs-target="#exampleModal"><div class="hm-stat-icon"><i class="fa-solid fa-stethoscope"></i></div><div class="hm-stat-value">${spCount}</div><div class="hm-stat-label">Specialists</div></div></div>
			</div>

			<div class="row g-4">
				<div class="col-lg-8">
					<div class="hm-card"><div class="card-body">
						<div class="d-flex justify-content-between align-items-center mb-3">
							<div><h2 class="hm-section-title mb-1">Recent Appointments</h2><p class="hm-section-subtitle mb-0">Live appointment activity summary</p></div>
							<a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/admin/patient">View all</a>
						</div>
						<div class="table-responsive"><table class="table table-hover align-middle"><thead><tr><th>Metric</th><th>Status</th><th>Volume</th></tr></thead><tbody>
							<tr><td>All scheduled appointments</td><td><span class="badge bg-info">Active</span></td><td class="fw-bold">${apCount}</td></tr>
							<tr><td>Registered patient accounts</td><td><span class="badge bg-success">Managed</span></td><td class="fw-bold">${userCount}</td></tr>
							<tr><td>Available specialist departments</td><td><span class="badge bg-primary">Configured</span></td><td class="fw-bold">${spCount}</td></tr>
						</tbody></table></div>
					</div></div>
				</div>
				<div class="col-lg-4">
					<div class="hm-card h-100"><div class="card-body">
						<h2 class="hm-section-title mb-3">Quick Actions</h2>
						<div class="d-grid gap-3">
							<a class="hm-quick-action" href="${pageContext.request.contextPath}/admin/add_doctor"><i class="fa-solid fa-user-plus"></i> Register a doctor</a>
							<a class="hm-quick-action" href="${pageContext.request.contextPath}/admin/view_doctor"><i class="fa-solid fa-list-check"></i> Manage doctor list</a>
							<a class="hm-quick-action" href="${pageContext.request.contextPath}/admin/patient"><i class="fa-solid fa-notes-medical"></i> Review appointments</a>
							<button class="hm-quick-action text-start" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-stethoscope"></i> Add specialist</button>
						</div>
					</div></div>
				</div>
			</div>

			<div class="row g-4 mt-1">
				<div class="col-lg-8">
					<div class="hm-card h-100">
						<div class="card-body">
							<div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-3">
								<div><h2 class="hm-section-title mb-1">Hospital Analytics</h2><p class="hm-section-subtitle mb-0">Operational trend preview</p></div>
								<span class="badge bg-primary">Live Console</span>
							</div>
							<div class="hm-chart-placeholder">
								<span style="height: 44%"></span><span style="height: 68%"></span><span style="height: 52%"></span><span style="height: 82%"></span><span style="height: 74%"></span><span style="height: 90%"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="hm-card h-100">
						<div class="card-body">
							<h2 class="hm-section-title mb-3">Notifications</h2>
							<div class="hm-activity-list">
								<div><i class="fa-solid fa-circle-check"></i><span>Doctor directory is ready for review.</span></div>
								<div><i class="fa-solid fa-bell"></i><span>Appointment volume requires daily monitoring.</span></div>
								<div><i class="fa-solid fa-shield-heart"></i><span>Specialist departments are configured.</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered"><div class="modal-content">
			<div class="modal-header"><h5 class="modal-title"><i class="fa-solid fa-stethoscope me-2 text-primary"></i>Add Specialist</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
			<form action="${pageContext.request.contextPath}/addSpecialist" method="post">
				<div class="modal-body"><div class="form-floating"><input type="text" name="specName" class="form-control" id="specName" placeholder="Specialist Name" required><label for="specName">Specialist Name</label></div></div>
				<div class="modal-footer"><button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button><button type="submit" class="btn btn-primary"><i class="fa-solid fa-plus me-2"></i>Add Specialist</button></div>
			</form>
		</div></div>
	</div>
</body>
</html>
