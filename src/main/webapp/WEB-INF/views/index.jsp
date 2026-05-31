<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthCare HMS</title>
<%@ include file="./component/allcss.jsp" %>
</head>
<body class="home-page">
<%@ include file="./component/navbar.jsp" %>

<main>
  <section class="home-hero">
    <div class="container home-container">
      <div class="row align-items-center g-5">
        <div class="col-lg-6">
          <div class="home-hero-copy hm-fade-in">
            <span class="home-eyebrow"><i class="fa-solid fa-heart-pulse"></i> Trusted hospital management</span>
            <h1>Premium healthcare software for modern clinics and hospitals.</h1>
            <p>Book appointments, manage doctors, track patient visits, and support care teams with a clean hospital management experience.</p>
            <div class="home-hero-actions">
              <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary btn-lg">
                <i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment
              </a>
              <a href="${pageContext.request.contextPath}/doctor/login" class="btn btn-outline-primary btn-lg">
                <i class="fa-solid fa-user-doctor me-2"></i>Doctor Portal
              </a>
            </div>
            <div class="home-trust-row">
              <div><strong data-count="24">0</strong><span>Care access</span></div>
              <div><strong data-count="4">0</strong><span>Core portals</span></div>
              <div><strong data-count="99">0</strong><span>Uptime-ready UI</span></div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="home-hero-media hm-fade-in">
            <img src='<c:url value="/resources/images/hospital.jpg"/>' alt="Modern hospital reception">
            <div class="home-floating-card home-floating-top">
              <i class="fa-solid fa-user-doctor"></i>
              <div>
                <strong>Doctors Online</strong>
                <span>Specialist care teams</span>
              </div>
            </div>
            <div class="home-floating-card home-floating-bottom">
              <i class="fa-solid fa-calendar-check"></i>
              <div>
                <strong>Appointments</strong>
                <span>Fast patient scheduling</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="container home-container">
      <div class="row g-4 home-counter-grid">
        <div class="col-sm-6 col-xl-3">
          <div class="home-counter-card"><i class="fa-solid fa-user-doctor"></i><strong data-count="120">0</strong><span>Doctors</span></div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="home-counter-card"><i class="fa-solid fa-user-injured"></i><strong data-count="8500">0</strong><span>Patients Served</span></div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="home-counter-card"><i class="fa-solid fa-calendar-check"></i><strong data-count="32000">0</strong><span>Appointments</span></div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="home-counter-card"><i class="fa-solid fa-stethoscope"></i><strong data-count="28">0</strong><span>Specialists</span></div>
        </div>
      </div>

      <div class="home-section-head">
        <span class="home-eyebrow">Doctor Services</span>
        <h2>Everything care teams need to run smoother daily operations.</h2>
        <p>Designed for hospital workflows with clear navigation, balanced layouts, and fast access to the most important actions.</p>
      </div>

      <div class="row g-4">
        <div class="col-md-6 col-xl-3">
          <div class="home-service-card">
            <div class="home-icon"><i class="fa-solid fa-calendar-check"></i></div>
            <h3>Appointment Booking</h3>
            <p>Patients can request visits while doctors and admins keep the schedule organized.</p>
          </div>
        </div>
        <div class="col-md-6 col-xl-3">
          <div class="home-service-card">
            <div class="home-icon"><i class="fa-solid fa-user-doctor"></i></div>
            <h3>Doctor Management</h3>
            <p>Maintain doctor profiles, qualifications, specialties, and contact details.</p>
          </div>
        </div>
        <div class="col-md-6 col-xl-3">
          <div class="home-service-card">
            <div class="home-icon"><i class="fa-solid fa-bed-pulse"></i></div>
            <h3>Patient Records</h3>
            <p>Review patient appointment details and status in clean responsive tables.</p>
          </div>
        </div>
        <div class="col-md-6 col-xl-3">
          <div class="home-service-card">
            <div class="home-icon"><i class="fa-solid fa-chart-line"></i></div>
            <h3>Admin Insights</h3>
            <p>Track doctors, patients, appointments, and specialist departments in one place.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section home-soft-section">
    <div class="container home-container">
      <div class="row align-items-center g-5">
        <div class="col-lg-5">
          <span class="home-eyebrow">Specialist Departments</span>
          <h2 class="home-split-title">Specialist care presented with clarity and confidence.</h2>
          <p class="home-split-text">A modern hospital homepage should quickly communicate clinical capability. These aligned specialist cards create a polished preview of departments patients expect to find.</p>
          <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary mt-3">
            <i class="fa-solid fa-stethoscope me-2"></i>Find a Specialist
          </a>
        </div>
        <div class="col-lg-7">
          <div class="row g-4">
            <div class="col-sm-6">
              <div class="home-specialist-card">
                <i class="fa-solid fa-heart-pulse"></i>
                <h3>Cardiology</h3>
                <p>Heart care, consultation, and follow-up appointment support.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="home-specialist-card">
                <i class="fa-solid fa-brain"></i>
                <h3>Neurology</h3>
                <p>Specialized care coordination for neurological conditions.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="home-specialist-card">
                <i class="fa-solid fa-bone"></i>
                <h3>Orthopedics</h3>
                <p>Bone, joint, and mobility care with streamlined scheduling.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="home-specialist-card">
                <i class="fa-solid fa-child-reaching"></i>
                <h3>Pediatrics</h3>
                <p>Friendly care workflows for children and family appointments.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section home-doctors-section">
    <div class="container home-container">
      <div class="home-section-head">
        <span class="home-eyebrow">Our Doctors</span>
        <h2>Our Specialist Doctors</h2>
        <p>Meet experienced consultants across leading specialties, available for in-person appointments and online consultation support.</p>
      </div>

      <div class="row g-2 lh-sm home-doctors-scroll">
        <div class="col-md-6 col-xl-3">
          <article class="home-doctor-card">
            <div class="home-doctor-photo">
              <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&amp;fit=crop&amp;w=720&amp;q=85" alt="Dr. Ananya Sharma">
              
            </div>
            <div class="home-doctor-body">
             
              <h3>Dr. Ananya Sharma</h3>
              <div class="home-doctor-specialty">Cardiologist</div>
              <div class="home-doctor-meta">
                <span>MD, DM Cardiology</span>
                <span>12+ Years Experience</span>
              </div>
              <p>Expert in preventive heart care, cardiac diagnostics, and long-term treatment planning.</p>
              <div class="home-doctor-tags"><span>Heart Care</span><span>ECG</span></div>
              <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary w-100"><i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment</a>
            </div>
          </article>
        </div>

        <div class="col-md-6 col-xl-3">
          <article class="home-doctor-card">
            <div class="home-doctor-photo">
              <img src="https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&amp;fit=crop&amp;w=720&amp;q=85" alt="Dr. Rohan Mehta">
            </div>
            <div class="home-doctor-body">
            
              <h3>Dr. Rohan Mehta</h3>
              <div class="home-doctor-specialty">Neurologist</div>
              <div class="home-doctor-meta">
                <span>MD, DM Neurology</span>
                <span>10+ Years Experience</span>
              </div>
              <p>Focused on headache care, neurological disorders, patient counseling, and follow-up plans.</p>
              <div class="home-doctor-tags"><span>Brain Care</span><span>Consults</span></div>
              <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary w-100"><i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment</a>
            </div>
          </article>
        </div>

        <div class="col-md-6 col-xl-3">
          <article class="home-doctor-card">
            <div class="home-doctor-photo">
              <img src="https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&amp;fit=crop&amp;w=720&amp;q=85" alt="Dr. Kavya Iyer">
              
            </div>
            <div class="home-doctor-body">
              
              <h3>Dr. Kavya Iyer</h3>
              <div class="home-doctor-specialty">Pediatrician</div>
              <div class="home-doctor-meta">
                <span>MD Pediatrics</span>
                <span>9+ Years Experience</span>
              </div>
              <p>Compassionate pediatric care for children, wellness checks, and family appointment support.</p>
              <div class="home-doctor-tags"><span>Child Care</span><span>Wellness</span></div>
              <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary w-100"><i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment</a>
            </div>
          </article>
        </div>

        <div class="col-md-6 col-xl-3">
          <article class="home-doctor-card">
            <div class="home-doctor-photo">
              <img src="https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&amp;fit=crop&amp;w=720&amp;q=85" alt="Dr. Arjun Nair">
              
            </div>
            <div class="home-doctor-body">
              
              <h3>Dr. Arjun Nair</h3>
              <div class="home-doctor-specialty">Orthopedic Surgeon</div>
              <div class="home-doctor-meta">
                <span>MS Orthopedics</span>
                <span>14+ Years Experience</span>
              </div>
              <p>Specialized in bone, joint, sports injury, and mobility-focused treatment planning.</p>
              <div class="home-doctor-tags"><span>Joints</span><span>Mobility</span></div>
              <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-primary w-100"><i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment</a>
            </div>
          </article>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="container home-container">
      <div class="home-section-head">
        <span class="home-eyebrow">Hospital Services</span>
        <h2>Premium patient experience across every care touchpoint.</h2>
        <p>Modern hospital operations need fast intake, clear visibility, and dependable communication between patients, doctors, and administrators.</p>
      </div>
      <div class="row g-4">
        <div class="col-md-6 col-xl-3"><div class="home-service-card"><div class="home-icon"><i class="fa-solid fa-truck-medical"></i></div><h3>Emergency Desk</h3><p>Always-visible urgent care access and appointment routing for critical cases.</p></div></div>
        <div class="col-md-6 col-xl-3"><div class="home-service-card"><div class="home-icon"><i class="fa-solid fa-vials"></i></div><h3>Diagnostics</h3><p>Organized patient details help clinical teams prepare for investigations.</p></div></div>
        <div class="col-md-6 col-xl-3"><div class="home-service-card"><div class="home-icon"><i class="fa-solid fa-notes-medical"></i></div><h3>Digital Intake</h3><p>Structured appointment forms reduce manual coordination at the front desk.</p></div></div>
        <div class="col-md-6 col-xl-3"><div class="home-service-card"><div class="home-icon"><i class="fa-solid fa-shield-heart"></i></div><h3>Care Continuity</h3><p>Role-based portals keep hospital teams aligned from booking to follow-up.</p></div></div>
      </div>
    </div>
  </section>

  <section class="home-section home-emergency">
    <div class="container home-container">
      <div class="home-appointment-band">
        <div class="row align-items-center g-4">
          <div class="col-lg-7">
            <span class="home-eyebrow home-eyebrow-light">Emergency Support</span>
            <h2>Need urgent assistance? Connect with hospital care teams faster.</h2>
            <p>Use the patient portal to share symptoms, request care, and keep every appointment status visible from one secure place.</p>
          </div>
          <div class="col-lg-5 text-lg-end">
            <a href="${pageContext.request.contextPath}/user_appointment" class="btn btn-light btn-lg text-primary">
              <i class="fa-solid fa-calendar-plus me-2"></i>Book Appointment
            </a>
            <a href="${pageContext.request.contextPath}/view_appointment" class="btn btn-outline-light btn-lg ms-lg-2 mt-2 mt-lg-0">
              View Status
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section home-about">
    <div class="container home-container">
      <div class="row align-items-center g-5">
        <div class="col-lg-6">
          <div class="home-about-grid">
            <img src='<c:url value="/resources/images/hospital4.jpg"/>' alt="Hospital care team">
            <img src='<c:url value="/resources/images/hospital2.jpg"/>' alt="Hospital facility">
          </div>
        </div>
        <div class="col-lg-6">
          <span class="home-eyebrow">About Hospital</span>
          <h2 class="home-split-title">A cleaner digital front desk for safer, faster care.</h2>
          <p class="home-split-text">HealthCare HMS gives hospitals a professional online experience for common workflows: patient registration, appointment booking, doctor dashboards, and administration.</p>
          <div class="home-check-list">
            <div><i class="fa-solid fa-circle-check"></i> Clean patient and doctor portals</div>
            <div><i class="fa-solid fa-circle-check"></i> Responsive layouts for mobile and desktop</div>
            <div><i class="fa-solid fa-circle-check"></i> Premium healthcare visual system</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="home-section home-soft-section">
    <div class="container home-container">
      <div class="home-section-head">
        <span class="home-eyebrow">Patient Reviews</span>
        <h2>Built for trust, clarity, and confident care decisions.</h2>
      </div>
      <div class="row g-4">
        <div class="col-md-4"><div class="home-testimonial-card"><div class="home-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div><p>Booking appointments became simple and transparent. The portal feels clean, fast, and professional.</p><strong>Priya Sharma</strong><span>Patient</span></div></div>
        <div class="col-md-4"><div class="home-testimonial-card"><div class="home-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div><p>The dashboard gives our team a quick operational overview without clutter or confusion.</p><strong>Admin Team</strong><span>Hospital Operations</span></div></div>
        <div class="col-md-4"><div class="home-testimonial-card"><div class="home-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div><p>Doctor appointment tracking is easy to understand and responsive on every device.</p><strong>Dr. Mehta</strong><span>Consultant</span></div></div>
      </div>
    </div>
  </section>
</main>

<%@ include file="./component/footer.jsp" %>
</body>
</html>
