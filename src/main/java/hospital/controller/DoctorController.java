package hospital.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hospital.entity.Appointment;
import hospital.entity.Doctor;
import hospital.entity.Specialist;
import hospital.service.AppointmentService;
import hospital.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private AppointmentService appointmentService;

    // ================= Doctor Login Page =================
    @GetMapping("/login")
    public String loginPage() {
        return "doctor_login";
    }

    // ================= Doctor Login Logic =================
    @PostMapping("/login")
    public String loginDoctor(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              HttpSession session) {

        Doctor d = doctorService.loginDoctor(email, password);

        if (d != null) {
            session.setAttribute("doctorObj", d);
            return "redirect:/doctor/index";
        } else {
            session.setAttribute("errorMsg", "Invalid Email & Password");
            return "redirect:/doctor/login";
        }
    }

    // ================= Doctor index =================
    @GetMapping("/index")
    public String dashboard(HttpSession session,
                            Model m) {

        Doctor d =
                (Doctor) session.getAttribute("doctorObj");

        if (d == null) {

            return "redirect:/doctor/login";
        }

        System.out.println("Doctor Id = " + d.getId());

        List<Appointment> appointmentList =
                appointmentService
                .getAllAppointmentByDoctorId(d.getId());

        int appointmentCount =
                appointmentList.size();

        System.out.println("Appointment Count = "
                + appointmentCount);

        int doctorCount =
                doctorService.countDoctor();

        m.addAttribute("doctorCount",
                       doctorCount);

        m.addAttribute("appointmentCount",
                       appointmentCount);

        return "doctor/index";
    }
    // ================= Doctor Patient / Appointment Page =================
    @GetMapping("/patient")
    public String doctorPatient(HttpSession session, Model model) {

        Doctor d = (Doctor) session.getAttribute("doctorObj");

        if (d == null) {
            return "redirect:/doctor/login";
        }

        List<Appointment> list = appointmentService.getAllAppointmentByDoctorId(d.getId());
        model.addAttribute("appointmentList", list);

        return "doctor/patient";
    }

    // ================= Logout =================
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/doctor/login";
    }
    
    @GetMapping("/comment")
    public String openCommentPage(@RequestParam("id") int id,
                                  HttpSession session,
                                  Model m) {
        Doctor d = (Doctor) session.getAttribute("doctorObj");

        if (d == null) {
            return "redirect:/doctor/login";
        }
        Appointment ap = appointmentService.getAppointmentById(id);
        m.addAttribute("appointment", ap);
        return "doctor/comment";
    }
    
    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam("id") int id,
                               @RequestParam("comm") String comm,
                               HttpSession session) {

        Doctor d = (Doctor) session.getAttribute("doctorObj");
        if (d == null) {
            return "redirect:/doctor/login";
        }
        boolean f = appointmentService.updateCommentStatus(id,
                                                           d.getId(),
                                                           comm);
        if (f) {
            session.setAttribute("sucMsg",
                    "Comment Updated Successfully");
        } else {
            session.setAttribute("errorMsg",
                    "Something Went Wrong");
        }
        return "redirect:/doctor/patient";
    }

    @RequestMapping("/editProfile")
    public String editDoctorProfile(HttpSession session,
                                    Model m) {
        Doctor d = (Doctor)
                session.getAttribute("doctorObj");
        if (d == null) {
            return "redirect:/doctor/login";
        }
        List<Specialist> list =
                doctorService.getAllSpecialist();
        m.addAttribute("specialistList", list);
        return "doctor/edit_profile";
    }
    
    @PostMapping("/updateProfile")
    public String updateProfile(Doctor d,
                                HttpSession session) {

        boolean f = doctorService.updateDoctor(d);
        if (f) {
            session.setAttribute("succMsgd",
                    "Profile Updated Successfully");
            session.setAttribute("doctorObj", d);
        } else {
            session.setAttribute("errorMsgd",
                    "Something Went Wrong");
        }
        return "redirect:/doctor/editProfile";
    }
    
    @PostMapping("/changePassword")
    public String changePassword(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            HttpSession session) {

        Doctor loginDoctor =
                (Doctor) session.getAttribute("doctorObj");

        if (loginDoctor == null) {

            return "redirect:/doctor/login";
        }

        boolean f = doctorService.changePassword(
                loginDoctor.getId(),
                oldPassword,
                newPassword);

        if (f) {

            session.setAttribute(
                    "succMsg",
                    "Password Changed Successfully");

        } else {

            session.setAttribute(
                    "errorMsg",
                    "Old Password Incorrect");
        }

        return "redirect:/doctor/editProfile";
    }
}
