<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/doctor/index"> <i
			class="fas fa-clinic-medical"></i> HEALTH CARE
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/doctor/index"> HOME </a></li>

				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/doctor/patient">
						PATIENT </a></li>

			</ul>

			<!-- Doctor Dropdown -->
			<c:if test="${not empty sessionScope.doctorObj}">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						data-bs-toggle="dropdown">
						<i class="fas fa-user-circle"></i>
						${sessionScope.doctorObj.fullname}
					</button>

					<ul class="dropdown-menu">

						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/doctor/editProfile">

								Edit Profile </a></li>

						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/doctor/logout">
								Logout </a></li>

					</ul>
				</div>
			</c:if>

		</div>
	</div>
</nav>