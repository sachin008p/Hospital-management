package hospital.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hospital.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public boolean registerUser(User u) {
        try {
            hibernateTemplate.save(u);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User loginUser(String email, String password) {

        String query = "from User where email=:email and password=:password";

        List<User> list = (List<User>) hibernateTemplate.findByNamedParam(
                query,
                new String[]{"email", "password"},
                new Object[]{email, password});

        if (list != null && !list.isEmpty()) {
            return list.get(0);
        }

        return null;
    }

    @Override
    public User getUserById(int id) {
        return hibernateTemplate.get(User.class, id);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        hibernateTemplate.update(user);
    }

    @Override
    public int countUserlist() {
        String hql = "select count(*) from User";

        List<Long> list = (List<Long>) hibernateTemplate.find(hql);

        return list.get(0).intValue();
    }
}