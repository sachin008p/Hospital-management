package hospital.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hospital.entity.Specialist;

@Repository
public class SpecialistDaoImpl implements SpecialistDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public boolean addSpecialist(Specialist s) {
        try {
            sessionFactory.getCurrentSession().save(s);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<Specialist> getAllSpecialist() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Specialist", Specialist.class)
                .list();
    }

    @Override
    public int countSpecialist() {
        Long count = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Specialist")
                .uniqueResult();
        return count.intValue();
    }
}