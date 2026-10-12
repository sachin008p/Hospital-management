package hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hospital.dao.AppointmentDao;
import hospital.dao.DoctorDao;
import hospital.entity.Appointment;
import hospital.entity.Doctor;

@Service
@Transactional
public class AppointmentService {
	
	@Autowired
	private AppointmentDao appointmentDao; 
		
	@Autowired
	private DoctorDao doctorDao;
		
	@Autowired
	private DoctorService doctorService;
	
	public boolean addAppointment(Appointment ap) {
		if (ap == null || ap.getDoctorId() <= 0 || ap.getUserId() <= 0
				|| ap.getAppointDate() == null || ap.getAppointDate().trim().isEmpty()) {
			return false;
		}
		if (doctorDao.getDoctorById(ap.getDoctorId()) == null
				|| appointmentDao.existsForDoctorOnDate(ap.getDoctorId(), ap.getAppointDate())) {
			return false;
		}
		return appointmentDao.addAppointment(ap);
		
	}
	public List<Appointment> getAllAppointmentByLoginUser(int userId){
		List<Appointment> list = appointmentDao.getAllAppointmentByLoginUser(userId);
		
		for(Appointment ap: list) {
			Doctor d = doctorDao.getDoctorById(ap.getDoctorId());
			if(d != null) {
				ap.setDoctorName(d.getFullname());
			}
		}
		return list;
	}
	
	public int countAppointment() {
		return appointmentDao.countAppointmentlist();
	}
	
	public List<Appointment> getAllAppointment(){
		List<Appointment> list = appointmentDao.getAllAppointment();
		for(Appointment a: list) {
			Doctor d = doctorService.getDoctorById(a.getDoctorId());
			
			if(d != null) {
				a.setDoctorName(d.getFullname());
			}
		}
		
	return list;
	}
	
	public int countAppointmentByDoctorId(int doctorId) {
	    return appointmentDao.countAppointmentByDoctorId(doctorId);
	}

	public List<Appointment> getAllAppointmentByDoctorId(int doctorId) {
	    List<Appointment> list = appointmentDao.getAllAppointmentByDoctorId(doctorId);
	    return list;
	}

	public Appointment getAppointmentById(int id) {
	    return appointmentDao.getAppointmentById(id);
	}

	public boolean updateCommentStatus(int id, int doctorId, String comment) {
	    return comment != null && !comment.trim().isEmpty()
				&& appointmentDao.updateCommentStatus(id, doctorId, comment.trim());
	}
		
	

}
