<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top hm-topnav">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/admin/index"><i
      class="fas fa-clinic-medical"></i> HealthCare Admin</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/index"><i class="fa-solid fa-chart-line me-1"></i> Dashboard</a></li>
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/add_doctor"><i class="fa-solid fa-user-plus me-1"></i> Add Doctor</a></li>
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/view_doctor"><i class="fa-solid fa-user-doctor me-1"></i> Doctors</a></li>
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/patient"><i class="fa-solid fa-bed-pulse me-1"></i> Patients</a></li>



      </ul>

      <form class="d-flex">
        <div class="dropdown">
          <button class="btn btn-light dropdown-toggle" type="button"
            id="dropdownMenuButton1" data-bs-toggle="dropdown"
            aria-expanded="false"><i class="fa-solid fa-circle-user me-1"></i> Admin</button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/adminlogout"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Logout</a></li>
          </ul>
        </div>
      </form>
    </div>
  </div>
</nav>
