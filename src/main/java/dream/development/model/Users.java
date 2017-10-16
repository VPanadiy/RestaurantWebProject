package dream.development.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.util.Arrays;

@Entity
@Table(name = "users")
public class Users {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private long id;

    @Column(name = "username")
    @NotEmpty(message = "{username.notEmpty.error}")
    @Length(min = 4, message = "{username.length.min.error}")
    @Length(max = 20, message = "{username.length.max.error}")
    private String username;

    @Column(name = "first_name")
    @Length(max = 20, message = "{username.length.max.error}")
    private String firstName;

    @Column(name = "last_name")
    @Length(max = 20, message = "{username.length.max.error}")
    private String lastName;

    @Column(name = "email")
    @NotEmpty(message = "{email.notEmpty.error}")
    @Email(message = "{email.valid.error}")
    @Length(max = 30, message = "{email.length.max.error}")
    private String email;

    @Column(name = "password")
    @NotEmpty(message = "*Please provide your password")
    @Length(min = 4, message = "*Your password must have at least 4 characters")
    private String password;

    @Column(name = "date_birth")
    private LocalDate dateBirth;

    @Column(name = "gender")
    private String gender;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "second_email")
    @Email(message = "{email.valid.error}")
    @Length(max = 30, message = "{email.length.max.error}")
    private String secondEmail;

    @Column(name = "country")
    private String country;

    @Column(name = "enabled", nullable = false, columnDefinition = "short default 1") // 1 - enabled;
    private short enabled = 1;

    @Column(name = "image_data")
    private byte[] imageData;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public LocalDate getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(LocalDate dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getSecondEmail() {
        return secondEmail;
    }

    public void setSecondEmail(String secondEmail) {
        this.secondEmail = secondEmail;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public short getEnabled() {
        return enabled;
    }

    public void setEnabled(short enabled) {
        this.enabled = enabled;
    }

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", dateBirth=" + dateBirth +
                ", gender='" + gender + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", secondEmail='" + secondEmail + '\'' +
                ", country='" + country + '\'' +
                ", enabled=" + enabled +
                ", imageData=" + Arrays.toString(imageData) +
                '}';
    }
}
