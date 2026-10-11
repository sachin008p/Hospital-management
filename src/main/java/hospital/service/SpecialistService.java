package hospital.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hospital.repository.SpecialistDao;
import hospital.model.Specialist;

@Service
@Transactional
public class SpecialistService {

    @Autowired
    private SpecialistDao specialistDao;

    public boolean addSpecialist(Specialist s) {
        return specialistDao.addSpecialist(s);   // ✔ SAME NAME
    }

    public List<Specialist> getSpecialists() {
        return specialistDao.getAllSpecialist();
    }

    public int countSpecialist() {
        return specialistDao.countSpecialist();
    }
}