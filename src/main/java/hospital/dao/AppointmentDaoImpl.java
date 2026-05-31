package hospital.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hospital.entity.Appointment;

@Repository
@Transactional
public class AppointmentDaoImpl implements AppointmentDao {

    @Autowired
    private SessionFactory sessionFactory;

    // ================= ADD APPOINTMENT =================

    @Override
    public boolean addAppointment(Appointment ap) {

        try {

            Serializable id =
                    sessionFactory
                    .getCurrentSession()
                    .save(ap);

            return id != null;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }

    // ================= USER APPOINTMENT =================

    @Override
    public List<Appointment> getAllAppointmentByLoginUser(int userId) {

        Session session =
                sessionFactory.getCurrentSession();

        Query<Appointment> q =
                session.createQuery(
                        "from Appointment where userId=:uid",
                        Appointment.class);

        q.setParameter("uid", userId);

        return q.list();
    }

    // ================= TOTAL APPOINTMENT =================

    @Override
    public int countAppointmentlist() {

        Long count =
                (Long) sessionFactory
                .getCurrentSession()
                .createQuery(
                        "select count(*) from Appointment")
                .uniqueResult();

        return count.intValue();
    }

    // ================= GET ALL APPOINTMENT =================

    @Override
    public List<Appointment> getAllAppointment() {

        return sessionFactory
                .getCurrentSession()
                .createQuery(
                        "from Appointment",
                        Appointment.class)
                .list();
    }

    // ================= COUNT APPOINTMENT BY DOCTOR =================

    @Override
    public int countAppointmentByDoctorId(int doctorId) {

        String hql =
                "select count(a) from Appointment a where a.doctorId=:did";

        Long count =
                (Long) sessionFactory
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("did", doctorId)
                .uniqueResult();

        return count.intValue();
    }

    // ================= DOCTOR APPOINTMENT LIST =================

    @Override
    public List<Appointment> getAllAppointmentByDoctorId(int doctorId) {

        return sessionFactory
                .getCurrentSession()
                .createQuery(
                        "from Appointment where doctorId=:did",
                        Appointment.class)
                .setParameter("did", doctorId)
                .list();
    }

    // ================= GET APPOINTMENT BY ID =================

    @Override
    public Appointment getAppointmentById(int id) {

        return sessionFactory
                .getCurrentSession()
                .get(Appointment.class, id);
    }

    // ================= UPDATE COMMENT & STATUS =================

    @Override
    public boolean updateCommentStatus(int id,
                                       int doctorId,
                                       String comment) {

        try {

            Session session =
                    sessionFactory.getCurrentSession();

            Appointment ap =
                    session.get(Appointment.class, id);

            if (ap != null) {

                ap.setDoctorId(doctorId);

                // COMMENT SAVE
                ap.setComment(comment);

                // STATUS UPDATE
                ap.setStatus("Completed");

                session.update(ap);

                return true;
            }

            return false;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}