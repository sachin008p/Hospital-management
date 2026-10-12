package hospital.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hospital.entity.Doctor;
import hospital.entity.Specialist;

@Repository
public class DoctorDaoImpl implements DoctorDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // ✅ Add Doctor
    @Override
    @Transactional
    public boolean addDoctor(Doctor d) {
        try {
            hibernateTemplate.save(d);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get All Doctors
    @Override
    public List<Doctor> getAllDoctor() {
        return hibernateTemplate.loadAll(Doctor.class);
    }

    // ✅ Get Doctor by ID
    @Override
    public Doctor getDoctorById(int id) {
        return hibernateTemplate.get(Doctor.class, id);
    }

    // ✅ Update Doctor
    @Override
    @Transactional
    public boolean updateDoctor(Doctor d) {
        try {
            hibernateTemplate.update(d);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Delete Doctor
    @Override
    @Transactional
    public boolean deleteDoctor(int id) {
        try {
            Doctor d = hibernateTemplate.get(Doctor.class, id);
            if (d != null) {
                hibernateTemplate.delete(d);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Doctor Login
    @Override
    public Doctor loginDoctor(String email, String password) {

        String hql = "from Doctor where email=:email and password=:password";

        List<Doctor> list = (List<Doctor>) hibernateTemplate.findByNamedParam(
                hql,
                new String[]{"email", "password"},
                new Object[]{email, password});

        if (list != null && !list.isEmpty()) {
            return list.get(0);
        }

        return null;
    }

    // ✅ Count Doctors
    @Override
    public int countDoctorlist() {

        String hql = "select count(*) from Doctor";

        List<Long> list = (List<Long>) hibernateTemplate.find(hql);

        return list.get(0).intValue();
    }

    // ✅ Update Doctor Profile
    @Override
    @Transactional
    public boolean updateDoctorProfile(Doctor d) {
        try {
            hibernateTemplate.update(d);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Change Password
    @Override
    @Transactional
    public boolean changePassword(int id, String oldPass, String newPass) {

        Doctor d = hibernateTemplate.get(Doctor.class, id);

        if (d != null && d.getPassword().equals(oldPass)) {
            d.setPassword(newPass);
            hibernateTemplate.update(d);
            return true;
        }

        return false;
    }

    // ✅ Get All Specialists
    @Override
    public List<Specialist> getSpecialists() {
        return (List<Specialist>) hibernateTemplate.loadAll(Specialist.class);
    }
}