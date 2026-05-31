package hospital.dao;

import java.util.List;

import hospital.entity.Doctor;
import hospital.entity.Specialist;

public interface DoctorDao {

    boolean addDoctor(Doctor d);
    List<Doctor> getAllDoctor();
    Doctor getDoctorById(int id);
    boolean updateDoctor(Doctor d);
    boolean deleteDoctor(int id);
    
    Doctor loginDoctor(String email, String password);
    int countDoctorlist();
    public boolean updateDoctorProfile(Doctor d);
    public boolean changePassword(int id,String oldPass,String newPass);
    public List<Specialist>getSpecialists();
}