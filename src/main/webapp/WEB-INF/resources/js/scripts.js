document.addEventListener("DOMContentLoaded", function () {
  var counters = document.querySelectorAll("[data-count]");
  var reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  function animateCounter(item) {
    var target = Number(item.getAttribute("data-count") || "0");
    var duration = reduceMotion ? 0 : 1200;
    var started = performance.now();

    function frame(now) {
      var progress = duration === 0 ? 1 : Math.min((now - started) / duration, 1);
      var eased = 1 - Math.pow(1 - progress, 3);
      item.textContent = Math.round(target * eased).toLocaleString();
      if (progress < 1) {
        requestAnimationFrame(frame);
      }
    }

    requestAnimationFrame(frame);
  }

  if ("IntersectionObserver" in window) {
    var counterObserver = new IntersectionObserver(function (entries, observer) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.35 });

    counters.forEach(function (counter) {
      counterObserver.observe(counter);
    });
  } else {
    counters.forEach(animateCounter);
  }

  document.querySelectorAll(".hm-card, .home-service-card, .home-specialist-card, .home-doctor-card, .home-testimonial-card").forEach(function (item) {
    item.classList.add("hm-reveal");
  });
});
