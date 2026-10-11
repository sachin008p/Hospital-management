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
<meta charset="ISO-8859-1">
<title>User Appointment</title>

<%@include file="../common/allcss.jsp"%>

<style>
.paint-card {
  box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
  background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
    url("<c:url value='/resources/images/image-8.png'/>");
  height: 20vh;
  width: 100%;
  background-size: cover;
  background-repeat: no-repeat;
}
</style>

</head>
<body>

  <%@include file="../common/navbar.jsp"%>

  <div class="container-fluid backImg p-5">
    <p class="text-center fs-2 text-white"></p>
  </div>


  <div class="container p-3">

    <div class="row">

      <div class="col-md-6 p-5">
        <img  src="<c:url value="/resources/images/hospital10.jpg"/>" class="mt-5" style="width: 450px;">
      </div>


      <div class="col-md-6">

        <div class="card paint-card">

          <div class="card-body">

            <p class="text-center text-primary fs-3 fw-bold">User
              Appointment</p>


            <c:if test="${not empty errorMsg}">
              <p class="fs-4 text-center text-danger">${errorMsg}</p>
              <c:remove var="errorMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg}">
              <p class="fs-4 text-center text-success">${succMsg}</p>
              <c:remove var="succMsg" scope="session" />
            </c:if>


            <form class="row g-3"
              action="${pageContext.request.contextPath}/appAppointment"
              method="post">

              <input type="hidden" name="userid"
                value="${sessionScope.userObj.id}">

              <div class="col-md-6">
                <label class="form-label">Full Name</label> <input required
                  type="text" class="form-control" name="fullname">
              </div>


              <div class="col-md-6">
                <label>Gender</label> <select class="form-control" name="gender"
                  required>
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                </select>
              </div>


              <div class="col-md-6">
                <label class="form-label">Age</label> <input required
                  type="number" class="form-control" name="age">
              </div>


              <div class="col-md-6">
                <label class="form-label">Appointment Date</label> <input
                  type="date" class="form-control" required name="appoint_date">
              </div>


              <div class="col-md-6">
                <label class="form-label">Email</label> <input required
                  type="email" class="form-control" name="email">
              </div>


              <div class="col-md-6">
                <label class="form-label">Phone No</label> <input required
                  maxlength="10" type="number" class="form-control" name="phno">
              </div>


              <div class="col-md-6">
              
                <label class="form-label">Diseases</label> <input required
                  type="text" class="form-control" name="diseases">
              </div>


              <div class="col-md-6">

                <label class="form-label">Doctor</label> <select required
                  class="form-control" name="doctorId">

                  <option value="">--Select Doctor--</option>
                  <c:forEach items="${doctorList }" var="d">
                       <option value="${d.id }">${d.fullname } (${d.spec})</option>
                  </c:forEach>

                </select>

              </div>


              <div class="col-md-12">
                <label>Full Address</label>

                <textarea required name="address" class="form-control" rows="3"></textarea>
              </div>

                <button class="col-md-6 offset-md-3 btn btn-primary">
                  Submit Appointment</button>
       
            </form>

          </div>
        </div>
      </div>

    </div>
  </div>

  <%@include file="../common/footer.jsp"%>

</body>
</html>
