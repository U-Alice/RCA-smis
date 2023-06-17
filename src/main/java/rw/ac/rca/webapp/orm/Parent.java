package rw.ac.rca.webapp.orm;



import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;


@MappedSuperclass
public class Parent implements Serializable{

    private static final long serialVersionUID = 2173199134252447177L;
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    int id;
    private String firstName;
    private String lastName;

    private String student;
    private String phoneNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(nullable = false)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    //@Column(nullable = false)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Parent() {
    }


    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public Parent(String firstName, String lastName, Student student, String phoneNumber) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.student = String.valueOf(student);
        this.phoneNumber = phoneNumber;
    }
}

