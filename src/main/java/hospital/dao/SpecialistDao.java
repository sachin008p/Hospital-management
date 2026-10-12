package hospital.dao;

import java.util.List;
import hospital.entity.Specialist;

public interface SpecialistDao {

    public boolean addSpecialist(Specialist s);   // ✔ correct spelling

    public List<Specialist> getAllSpecialist();

    public int countSpecialist();
}