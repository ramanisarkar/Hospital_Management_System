package VO;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "PatientRegistration",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "email"))
public class PatientRegistretionVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "PatientId")
	private String patientid;

	@Column(name = "FirstName")
	private String firstname;
	
	@Column(name = "MidalName")
	private String midalname;
	
	@Column(name = "LastName")
	private String lastname;
	
	@Column(name = "BloodGroup")
	private String bloodgroup;
	
	@Column(name = "DateOfBirth")
	private java.sql.Date birthdate;
	
	@Column(name = "Gender")
	private String gender;
	
	@Column(name = "Symptoms")
	private String symptoms;
	
	@Column(name = "HomeAddress")
	private String homeeaddrss;
	
	@Column(name = "HomeCity")
	private String homecity;
	
	@Column(name = "HomeState")	
	private String homestate;

	@Column(name = "HomeCountry")
	private String homecountry;
	
	@Column(name = "HomeZipCode")
	private String homezipcode;

	@Column(name = "MobileCountryCode")
	private String mobilecountrycode;
	
	@Column(name = "MobileNo")
	private String mobileno;
	
	@Column(name = "PhoneNo")
	private String phoneno;

	@Column(name = "Email")
	private String email;

	@Column(name = "UserName")
	private String username;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "ProfileImage")
	private String profileimage;
	
	@Column(name = "Diagnosis")
	private String diagnosis;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@OneToMany( mappedBy = "patientregistreationid", cascade = CascadeType.REMOVE)
	private List<PatientVo> patientadmintid;	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPatientid() {
		return patientid;
	}

	public void setPatientid(String patientid) {
		this.patientid = patientid;
	}

	public List<PatientVo> getPatientadmintid() {
		return patientadmintid;
	}

	public void setPatientadmintid(List<PatientVo> patientadmintid) {
		this.patientadmintid = patientadmintid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMidalname() {
		return midalname;
	}

	public void setMidalname(String midalname) {
		this.midalname = midalname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public java.sql.Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(java.sql.Date birthdate) {
		this.birthdate = birthdate;
	}
 
	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHomeeaddrss() {
		return homeeaddrss;
	}

	public void setHomeeaddrss(String homeeaddrss) {
		this.homeeaddrss = homeeaddrss;
	}

	public String getHomecity() {
		return homecity;
	}

	public void setHomecity(String homecity) {
		this.homecity = homecity;
	}

	public String getHomestate() {
		return homestate;
	}

	public void setHomestate(String homestate) {
		this.homestate = homestate;
	}

	public String getHomecountry() {
		return homecountry;
	}

	public void setHomecountry(String homecountry) {
		this.homecountry = homecountry;
	}

	public String getHomezipcode() {
		return homezipcode;
	}

	public void setHomezipcode(String homezipcode) {
		this.homezipcode = homezipcode;
	}

	public String getMobilecountrycode() {
		return mobilecountrycode;
	}

	public void setMobilecountrycode(String mobilecountrycode) {
		this.mobilecountrycode = mobilecountrycode;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

}
