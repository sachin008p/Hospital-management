package hospital.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.method.annotation.ModelAttributeMethodProcessor;

import hospital.entity.Doctor;
import hospital.entity.Specialist;
import hospital.entity.User;
import hospital.service.AppointmentService;
import hospital.service.DoctorService;
import hospital.service.SpecialistService;
import hospital.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private SpecialistService specialistService;
	
	@Autowired
    private DoctorService doctorService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	// 🔹 Login page open
	@RequestMapping("/admin/login")
	public String admin() {
		return "admin_login";
	}

	// 🔹 Login check
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {

		String configuredEmail = System.getenv("HOSPITAL_ADMIN_EMAIL");
		String configuredPassword = System.getenv("HOSPITAL_ADMIN_PASSWORD");
		if (configuredEmail != null && configuredPassword != null
				&& configuredEmail.equals(email) && configuredPassword.equals(password)) {
			session.setAttribute("adminObj", new User());
			return "redirect:/admin/index";
		} else {
			session.setAttribute("errorMsg", "Invalid email & password");
			return "redirect:/admin/login";
		}
	}

	
	@RequestMapping("/admin/index")
	public String adminDashboard(HttpSession session,Model m) {

		if (session.getAttribute("adminObj") == null) {
			return "redirect:/admin/login";
		}
		
		int doctorCount = doctorService.countDoctor();
		int userCount = userService.countUser();
		int appCount = appointmentService.countAppointment();
		int spCount = specialistService.countSpecialist();
		
		m.addAttribute("doctCount",doctorCount);
		m.addAttribute("userCount",userCount);
		m.addAttribute("apCount",appCount);
		m.addAttribute("spCount",spCount);
		     
		return "admin/index";
	}

	// 🔹 Add Specialist
	@RequestMapping(value = "/addSpecialist", method = RequestMethod.POST)
	public String addSpecialist(@RequestParam("specName") String specName, HttpSession session) {
		if (!isAdmin(session)) return "redirect:/admin/login";

		System.out.println(specName);

		Specialist s = new Specialist();
		s.setSpecName(specName);

		boolean f = specialistService.addSpecialist(s);

		if (f) {
			session.setAttribute("succMsg", "Specialist Added Successfully");
		} else {
			session.setAttribute("errorMsg", "Something went wrong");
		}

		return "redirect:/admin/index";
	}
	
	@RequestMapping("/admin/add_doctor")
	public String addDoctor(Model m, HttpSession session) {
		if (!isAdmin(session)) return "redirect:/admin/login";

	    m.addAttribute("specList", specialistService.getSpecialists());

	    return "admin/add_doctor";
	}
	
	@RequestMapping(value = "/addDoctor",method = RequestMethod.POST)
	public String addDoctor(@ModelAttribute Doctor d, HttpSession session) {
		if (!isAdmin(session)) return "redirect:/admin/login";
		
		boolean f  = doctorService.addDoctor(d);
		
		if(f) {
			session.setAttribute("succMsg", "Doctor Added Successfuly");
		}else {
			session.setAttribute("errorMsg", "Something Went Wrong");
		}
		return "redirect:/admin/add_doctor";		
	}
	
	@RequestMapping("admin/view_doctor")
	public String viewDoctor(HttpSession session, Model m) {
		
		if (session.getAttribute("adminObj") == null) {
			return "redirect:/admin/login";
		}
		
		m.addAttribute("doctorList",doctorService.getAllDoctor());
		
		
		return "admin/view_doctor";
	}
	
	@RequestMapping("/admin/edit_doctor")
	public String editDoctor(@RequestParam("id") int id,Model m,HttpSession session) {
		
		if(session.getAttribute("adminObj")== null) {
			return "redirect:/admin/login";
		}
		
		m.addAttribute("doctor",doctorService.getDoctorById(id));
		m.addAttribute("specList",specialistService.getSpecialists());
		
		return "admin/edit_doctor";
	}
	
	@RequestMapping("/updateDoctor")
	public String updateDoctor(@ModelAttribute Doctor d, HttpSession session) {
		if (!isAdmin(session)) return "redirect:/admin/login";
		boolean f = doctorService.updateDoctor(d);
		
		if(f) {
			session.setAttribute("succMsg", "Doctor Update Successfully");
		}else {
			session.setAttribute("errorMsg", "Somethis Went Wrong");
		}
		
		return "redirect:/admin/view_doctor";
	}
	
	@RequestMapping("/delete_doctor")
	public String daleteDoctor(@RequestParam("id") int id, HttpSession session) {
		if (!isAdmin(session)) return "redirect:/admin/login";
		boolean f = doctorService.deleteDoctor(id);
		
		if(f) {
			session.setAttribute("succMsg", "Doctor Deleted Successfully");
		}else {
			session.setAttribute("errorMsg", "Somethis Went Wrong");
		}
		
		return "redirect:/admin/view_doctor";
			
		}
	
	@RequestMapping("/admin/patient")
	public String patient(HttpSession session,Model m) {
		
		if(session.getAttribute("adminObj") == null) {
			return "redirect:/admin/login";
		}
		m.addAttribute("appointmentList",appointmentService.getAllAppointment());
		return "admin/patient";
		
	}
	    
	@RequestMapping("/adminlogout")
	    public String adminLogout(HttpSession session) {
	    	
	    	session.removeAttribute("adminObj");
	    	session.setAttribute("succMsg", "Admin Logout Successfully");
	    	
	    	return "redirect:/admin/login";
	    }

	private boolean isAdmin(HttpSession session) {
		return session.getAttribute("adminObj") != null;
	}
	
	
	}

	

