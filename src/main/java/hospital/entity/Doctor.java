package hospital.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String fullname;
    private String dob;
    private String qualification;
    private String spec;
    private String mobno;
    private String email;
    private String password;

    // 🔥 MUST (Default Constructor)
    public Doctor() {
    }

    // Parameterized Constructor
    public Doctor(int id, String fullname, String dob, String qualification,
                  String spec, String mobno, String email, String password) {
        this.id = id;
        this.fullname = fullname;
        this.dob = dob;
        this.qualification = qualification;
        this.spec = spec;
        this.mobno = mobno;
        this.email = email;
        this.password = password;
    }

    // 🔥 IMPORTANT Getter for JSP
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getMobno() {
        return mobno;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}