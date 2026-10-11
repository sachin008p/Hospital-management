<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>


<!doctype html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Doctor Dashboard</title>

    <%@include file="../common/allcss.jsp"%>

    <style>
      .paint-card {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }
    </style>
  </head>

  <body>
<c:if test="${empty sessionScope.doctorObj}">
    <c:redirect url="/doctor/login"/>
</c:if>

<%@include file="navbar.jsp"%>
    <p class="text-center fs-3 fw-bold">Doctor Dashboard</p>

    <div class="container p-5">
      <div class="row">
        <div class="col-md-4 offset-md-2">
          <div class="card paint-card">
            <div class="card-body text-center text-primary">
              <i class="fas fa-user-md fa-3x"></i><br />

              <p class="fs-4 text-center">Doctor <br> ${doctorCount}</p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card paint-card">
            <div class="card-body text-center text-primary">
              <i class="far fa-calendar-check fa-3x"></i><br />

              <p class="fs-4 text-center">Total Appointment <br> ${appointmentCount}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

