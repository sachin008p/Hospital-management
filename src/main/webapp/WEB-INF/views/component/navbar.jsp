<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top hm-topnav">
	<div class="container-fluid">

		<a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/">
			<i class="fa-solid fa-house-chimney-medical"></i> HealthCare HMS
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<!-- 🔹 When user NOT logged in -->
				<c:if test="${empty sessionScope.userObj}">

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user_appointment">
							<i class="fa-solid fa-calendar-check me-1"></i> Appointment </a></li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">
							<i class="fa-solid fa-right-to-bracket me-1"></i> Portals
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin_login"><i class="fa-solid fa-user-shield me-2"></i>Admin Portal</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctor/login"><i class="fa-solid fa-user-doctor me-2"></i>Doctor Portal</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user_login"><i class="fa-solid fa-circle-user me-2"></i>Patient Portal</a></li>
						</ul>
					</li>

				</c:if>

				<!-- 🔹 When user logged in -->
				<c:if test="${not empty sessionScope.userObj}">

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user_appointment">
							<i class="fa-solid fa-calendar-plus me-1"></i> Book Appointment </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/view_appointment">
							<i class="fa-solid fa-clipboard-list me-1"></i> My Appointments </a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> <i class="fa-solid fa-circle-user"></i>
							${sessionScope.userObj.fullName}
					</a>

						<ul class="dropdown-menu dropdown-menu-end">

							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/change_password">
									<i class="fa-solid fa-key me-2"></i>Change Password </a></li>

							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/userLogout"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i> Logout
							</a></li>

						</ul></li>

				</c:if>

			</ul>
		</div>
	</div>
</nav>
