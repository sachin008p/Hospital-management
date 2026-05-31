package hospital.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hospital.entity.Appointment;
import hospital.entity.Doctor;
import hospital.entity.User;
import hospital.service.AppointmentService;
import hospital.service.DoctorService;
import hospital.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private DoctorService doctorService;
    
    @Autowired
    private AppointmentService appointmentService;

    // 🔹 Open Login Page
    @RequestMapping("/user_login")
    public String userLogin() {
        return "user_login";
    }

    // 🔹 Open Signup Page
    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    // 🔹 Register User
    @PostMapping("/user_register")
    public String registerUser(@RequestParam String fullname,
                               @RequestParam String email,
                               @RequestParam String password,
                               HttpSession session) {

        User u = new User();
        u.setFullName(fullname);
        u.setEmail(email);
        u.setPassword(password);

        boolean f = userService.registerUser(u);

        if (f) {
            session.setAttribute("sucMsg", "User Register Successfully");
        } else {
            session.setAttribute("errorMsg", "Something Went Wrong...");
        }

        return "redirect:/signup";
    }

    // 🔹 Login User
    @PostMapping("/userLogin")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            HttpSession session) {

        User u = userService.loginUser(email, password);

        if (u != null) {
            session.setAttribute("userObj", u);

            // ✅ FIXED REDIRECT
            return "redirect:/user_appointment";

        } else {
            session.setAttribute("errorMsg", "Invalid Email & Password");
            return "redirect:/user_login";
        }
    }

    // 🔹 Logout User
    @RequestMapping("/userLogout")
    public String logout(HttpSession session) {

        // ✅ BEST PRACTICE
        session.invalidate();

        return "redirect:/user_login";
    }

    // 🔹 User Appointment Page
    @RequestMapping("/user_appointment")
    public String userAppointment(HttpSession session, Model m) {

        if (session.getAttribute("userObj") == null) {
            return "redirect:/user_login";
        }

        List<Doctor> list = doctorService.getAllDoctor();
        m.addAttribute("doctorList", list);

        return "user_appointment";
    }
    @PostMapping("/appAppointment")
    public String addAppointment(@ModelAttribute Appointment ap,
                                 @RequestParam("appoint_date") String appointDate,
                                 @RequestParam("doctorId") int doctorId,
                                 HttpSession session) {

        User user = (User) session.getAttribute("userObj");

        ap.setUserId(user.getId());
        ap.setAppointDate(appointDate);
        ap.setDoctorId(doctorId);
        ap.setStatus("Pending");

        boolean f = appointmentService.addAppointment(ap);

        if (f) {
            session.setAttribute("succMsg", "Appointment Booked Successfully");
        } else {
            session.setAttribute("errorMsg", "Something went Wrong");
        }

        return "redirect:/user_appointment";
    }
    
    @GetMapping("/view_appointment")
    public String viewAppointment(HttpSession session, Model m) {

        User user = (User) session.getAttribute("userObj");

        if (user == null) {
            return "redirect:/user_login";
        }

        List<Appointment> list =
            appointmentService.getAllAppointmentByLoginUser(user.getId());

        m.addAttribute("appointmentList", list);

        return "view_appointment";  
    }
    @RequestMapping("/change_password")
    public String changePassword() {
        return "change_password";
    }

    @PostMapping("/userChangePassword")   // 🔥 IMPORTANT
    public String change_pass(@RequestParam String oldPassword,
                              @RequestParam String newPassword,
                              @RequestParam int uid,
                              HttpSession session) {

        boolean f = userService.changPassword(uid, oldPassword, newPassword);

        if (f) {
            session.setAttribute("succMsg", "Password Changed Successfully");
        } else {
            session.setAttribute("errorMsg", "Old Password Incorrect");
        }

        return "redirect:/change_password";
    }
}
