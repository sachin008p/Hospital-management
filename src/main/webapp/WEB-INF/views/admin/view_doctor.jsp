<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Directory</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="./navbar.jsp"%>

	<main class="hm-page">
		<div class="container-fluid px-4">
			<div class="hm-card hm-fade-in">
				<div class="card-body">
					<div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-3">
						<div>
							<h1 class="hm-section-title mb-1">Doctor Directory</h1>
							<p class="hm-section-subtitle mb-0">Manage clinician profiles, specialties, and contact details.</p>
						</div>
						<a href="${pageContext.request.contextPath}/admin/add_doctor" class="btn btn-primary"><i class="fa-solid fa-user-plus me-2"></i>Add Doctor</a>
					</div>

					<c:if test="${not empty errorMsg}">
						<div class="alert alert-danger hm-alert">${errorMsg}</div>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<div class="alert alert-success hm-alert">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<div class="hm-table-tools">
						<div class="hm-search-box"><i class="fa-solid fa-magnifying-glass"></i><input type="search" class="form-control" placeholder="Search doctors"></div>
						<select class="form-select"><option>All specialists</option><option>Cardiology</option><option>Neurology</option></select>
					</div>

					<div class="table-responsive">
						<table class="table table-hover align-middle">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>DOB</th>
									<th>Qualification</th>
									<th>Specialist</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${doctorList}" var="d">
									<tr>
										<td class="fw-semibold">${d.fullname}</td>
										<td>${d.dob}</td>
										<td>${d.qualification}</td>
										<td><span class="badge bg-info">${d.spec}</span></td>
										<td>${d.email}</td>
										<td>${d.mobno}</td>
										<td>
											<a href="${pageContext.request.contextPath}/admin/edit_doctor?id=${d.id}" class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-pen me-1"></i>Edit</a>
											<a href="${pageContext.request.contextPath}/delete_doctor?id=${d.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete this doctor?')"><i class="fa-solid fa-trash me-1"></i>Delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="hm-pagination"><span>Showing doctor records</span><div><button class="btn btn-sm btn-light">Prev</button><button class="btn btn-sm btn-primary">1</button><button class="btn btn-sm btn-light">Next</button></div></div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
