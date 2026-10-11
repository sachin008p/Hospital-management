package hospital.repository;

import java.util.List;
import hospital.model.Appointment;

public interface AppointmentDao {

    public boolean addAppointment(Appointment ap);

    List<Appointment> getAllAppointmentByLoginUser(int userId);

    int countAppointmentlist();

    List<Appointment> getAllAppointment();

    int countAppointmentByDoctorId(int doctorId);

    List<Appointment> getAllAppointmentByDoctorId(int doctorId);

    Appointment getAppointmentById(int id);

    boolean updateCommentStatus(int id, int doctorId, String comment);

    boolean existsForDoctorOnDate(int doctorId, String appointDate);
}
