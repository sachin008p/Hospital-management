<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Patient Appointment</title>

<%@ include file="../common/allcss.jsp"%>

</head>

<body class="bg-light">

	<!-- SESSION CHECK -->
	<c:if test="${empty sessionScope.doctorObj}">
		<c:redirect url="/doctor/login"/>
	</c:if>

	<!-- NAVBAR -->
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-4">

		<div class="row">

			<div class="col-md-12">

				<div class="card shadow">

					<div class="card-header bg-primary text-white">

						<h3 class="text-center mb-0">

							<i class="fas fa-calendar-check"></i>

							Patient Appointment Details

						</h3>

					</div>

					<div class="card-body">

						<!-- SUCCESS MESSAGE -->
						<c:if test="${not empty sucMsg}">

							<div class="alert alert-success alert-dismissible fade show"
								role="alert">

								${sucMsg}

								<button type="button"
									class="btn-close"
									data-bs-dismiss="alert"></button>

							</div>

							<c:remove var="sucMsg" scope="session"/>

						</c:if>

						<!-- ERROR MESSAGE -->
						<c:if test="${not empty errorMsg}">

							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">

								${errorMsg}

								<button type="button"
									class="btn-close"
									data-bs-dismiss="alert"></button>

							</div>

							<c:remove var="errorMsg" scope="session"/>

						</c:if>

						<div class="table-responsive">

							<table class="table table-bordered table-hover align-middle">

								<thead class="table-primary text-center">

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

								<tbody class="text-center">

									<!-- EMPTY DATA -->

									<c:if test="${empty appointmentList}">

										<tr>

											<td colspan="10"
												class="text-danger fw-bold">

												No Appointments Found

											</td>

										</tr>

									</c:if>

									<!-- LOOP -->

									<c:forEach var="ap"
										items="${appointmentList}"
										varStatus="s">

										<tr>

											<td>${s.count}</td>

											<td>${ap.fullname}</td>

											<td>${ap.gender}</td>

											<td>${ap.age}</td>

											<td>${ap.appointDate}</td>

											<td>${ap.email}</td>

											<td>${ap.phno}</td>

											<td>${ap.diseases}</td>

											<td>

												<c:choose>

													<c:when test="${ap.status eq 'Pending'}">

														<span class="badge bg-warning text-dark">

															${ap.status}

														</span>

													</c:when>

													<c:otherwise>

														<span class="badge bg-success">

															${ap.status}

														</span>

													</c:otherwise>

												</c:choose>

											</td>

											<td>

												<c:choose>

													<c:when test="${ap.status eq 'Pending'}">

														<a
															href="${pageContext.request.contextPath}/doctor/comment?id=${ap.id}"
															class="btn btn-success btn-sm">

															<i class="fas fa-comment-medical"></i>

															Comment

														</a>

													</c:when>

													<c:otherwise>

														<button
															class="btn btn-secondary btn-sm"
															disabled>

															<i class="fas fa-check-circle"></i>

															Completed

														</button>

													</c:otherwise>

												</c:choose>

											</td>

										</tr>

									</c:forEach>

								</tbody>

							</table>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>

</html>