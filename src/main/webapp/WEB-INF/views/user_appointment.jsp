<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
  <%@include file="component/navbar.jsp"%>

  <main class="hm-page">
    <div class="container">
      <section class="hm-hero mb-4" style="--hero-image: url('<c:url value='/resources/images/image-8.png'/>');">
        <div class="row align-items-center g-4">
          <div class="col-lg-8">
            <p class="fw-bold text-uppercase mb-2">Patient Dashboard</p>
            <h1>Book Appointment</h1>
            <p class="mt-3">Choose a doctor, share your symptoms, and submit your appointment request securely.</p>
          </div>
          <div class="col-lg-4 text-lg-end">
            <a class="btn btn-light text-primary fw-bold" href="${pageContext.request.contextPath}/view_appointment">
              <i class="fa-solid fa-clipboard-list me-2"></i>My Appointments
            </a>
          </div>
        </div>
      </section>

      <div class="row g-4 align-items-stretch">
        <div class="col-lg-5">
          <img src="<c:url value='/resources/images/hospital4.jpg'/>" class="hm-feature-img" alt="Hospital care">
        </div>
        <div class="col-lg-7">
          <div class="hm-card h-100">
            <div class="card-body p-lg-4">
              <h2 class="hm-section-title">Appointment Details</h2>
              <p class="hm-section-subtitle">All fields help the hospital team prepare for your visit.</p>

              <c:if test="${not empty errorMsg}">
                <div class="alert alert-danger hm-alert">${errorMsg}</div>
                <c:remove var="errorMsg" scope="session" />
              </c:if>
              <c:if test="${not empty succMsg}">
                <div class="alert alert-success hm-alert">${succMsg}</div>
                <c:remove var="succMsg" scope="session" />
              </c:if>

              <form class="row g-3" action="${pageContext.request.contextPath}/appAppointment" method="post">
                <input type="hidden" name="userid" value="${sessionScope.userObj.id}">

                <div class="col-md-6">
                  <div class="form-floating">
                    <input required type="text" class="form-control" id="fullname" name="fullname" placeholder="Full Name">
                    <label for="fullname">Full Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <select class="form-select" id="gender" name="gender" required>
                      <option value="male">Male</option>
                      <option value="female">Female</option>
                    </select>
                    <label for="gender">Gender</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input required type="number" class="form-control" id="age" name="age" placeholder="Age">
                    <label for="age">Age</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="date" class="form-control" id="appointDate" required name="appoint_date" placeholder="Appointment Date">
                    <label for="appointDate">Appointment Date</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input required type="email" class="form-control" id="email" name="email" placeholder="Email">
                    <label for="email">Email</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input required maxlength="10" type="number" class="form-control" id="phno" name="phno" placeholder="Phone No">
                    <label for="phno">Phone No</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input required type="text" class="form-control" id="diseases" name="diseases" placeholder="Symptoms or Diseases">
                    <label for="diseases">Symptoms or Disease</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <select required class="form-select" id="doctorId" name="doctorId">
                      <option value="">Select Doctor</option>
                      <c:forEach items="${doctorList}" var="d">
                        <option value="${d.id}">${d.fullname} (${d.spec})</option>
                      </c:forEach>
                    </select>
                    <label for="doctorId">Doctor</label>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-floating">
                    <textarea required name="address" class="form-control" id="address" placeholder="Full Address" style="height: 110px"></textarea>
                    <label for="address">Full Address</label>
                  </div>
                </div>
                <div class="col-md-12">
                  <button class="btn btn-primary w-100 py-3"><i class="fa-solid fa-calendar-plus me-2"></i>Submit Appointment</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <%@include file="component/footer.jsp"%>
</body>
</html>
