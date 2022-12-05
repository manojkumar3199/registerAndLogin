package com.manoj.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userId;

	@Size(min = 3, max = 20, message = "Invalid firstName(size must be between 3 and 20)")
	@Column(length = 20)
	private String firstName;
	@Size(min = 3, max = 20, message = "Invalid lastName(size must be between 3 and 20)")
	@Column(length = 20)
	private String lastName;
	@Size(min = 3, max = 20, message = "Invalid fatherName(size must be between 3 and 40)")
	@Column(length = 40)
	private String fatherName;

	@NotNull(message = "Please enter your date of birth!")
	@Past(message = "Date of birth must be past date!")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date dob;

	@NotNull(message = "Please select your gender!")
	@Column(length = 10)
	private String gender;
	@Email(message = "Invalid email(must match \".+@.+\\.[a-z]+\")", regexp = ".+@.+\\.[a-z]+")
	@Column(length = 50)
	private String email;
	@NotBlank(message = "Password is required!")
	@Column(length = 16)
	private String password;
	@NotBlank(message = "Please confirm your password!")
	@Transient
	private String confirmPassword;
	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	private UserAddress address;
	@NotBlank(message = "Please select your category!")
	@Column(length = 20)
	private String category;

	private String profile;

	@AssertTrue(message = "Please agree with terms & conditions if you want to proceed!")
	@Transient
	private Boolean agreedToTerms;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserAddress getAddress() {
		return address;
	}

	public void setAddress(UserAddress address) {
		this.address = address;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Boolean getAgreedToTerms() {
		return agreedToTerms;
	}

	public void setAgreedToTerms(Boolean agreedToTerms) {
		this.agreedToTerms = agreedToTerms;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", fatherName="
				+ fatherName + ", dob=" + dob + ", gender=" + gender + ", email=" + email + ", password=" + password
				+ ", confirmPassword=" + confirmPassword + ", address=" + address + ", category=" + category
				+ ", profile=" + profile + ", agreedToTerms=" + agreedToTerms + "]";
	}
}