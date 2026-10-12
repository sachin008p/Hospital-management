package hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hospital.dao.DoctorDao;
import hospital.dao.SpecialistDao;
import hospital.entity.Doctor;
import hospital.entity.Specialist;

@Service
@Transactional
public class DoctorService {

    @Autowired
    public DoctorDao doctorDao;

    @Autowired
    private SpecialistDao specialistDao;

    public boolean addDoctor(Doctor d) {

        return doctorDao.addDoctor(d);
    }

    public List<Doctor> getAllDoctor() {

        return doctorDao.getAllDoctor();
    }

    public Doctor getDoctorById(int id) {

        return doctorDao.getDoctorById(id);
    }

    public boolean deleteDoctor(int id) {

        return doctorDao.deleteDoctor(id);
    }

    public boolean updateDoctor(Doctor d) {

        return doctorDao.updateDoctor(d);
    }

    public int countDoctor() {

        return doctorDao.countDoctorlist();
    }

    public Doctor loginDoctor(String email,
                              String password) {

        return doctorDao.loginDoctor(email,
                                     password);
    }

    public boolean changePassword(int id,
                                  String oldPass,
                                  String newPass) {

        return doctorDao.changePassword(id,
                                        oldPass,
                                        newPass);
    }

    public List<Specialist> getAllSpecialist() {

        return specialistDao.getAllSpecialist();
    }

}