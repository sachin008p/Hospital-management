<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">

		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<i class="fa-solid fa-house-chimney-medical"></i> HEALTH CARE
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
						href="${pageContext.request.contextPath}/admin/login"> ADMIN </a>
					</li>

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/doctor/login"> DOCTOR
					</a></li>


					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user/appointment">
							APPOINTMENT </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user/login"> USER </a></li>

				</c:if>

				<!-- 🔹 When user logged in -->
				<c:if test="${not empty sessionScope.userObj}">

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user/appointment">
							BOOK APPOINTMENT </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/user/view_appointment">
							VIEW APPOINTMENT </a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> <i class="fa-solid fa-circle-user"></i>
							${sessionScope.userObj.fullName}
					</a>

						<ul class="dropdown-menu dropdown-menu-end">

							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/user/change_password">
									Change Password </a></li>

							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/userLogout"> Logout
							</a></li>

						</ul></li>

				</c:if>

			</ul>
		</div>
	</div>
</nav>