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
@Table(name = "Patient", uniqueConstraints = @UniqueConstraint(name = "unique", columnNames={"Email", "UserName","PatientId"}))
public class PatientVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "PatientId")
	private String patientid;

	@Column(name = "GuardianId")
	private String guardianid;
	
	@Column(name = "FirstName")
	private String firstname;
	
	@Column(name = "MidalName")
	private String midalname;
	
	@Column(name = "LastName")
	private String lastname;
	
	@Column(name = "DateOfBirth")
	private java.sql.Date birthdate;
	
	@Column(name = "BloodGroup")
	private String bloodgroup;
	
	@Column(name = "Gender")
	private String gender;
	
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

	@Column(name = "GuardianFirstName")
	private String guardianfirstname;
	
	@Column(name = "GuardianMidalName")
	private String guardianmidalname;
	
	@Column(name = "GuardianLastName")
	private String guardianlastname;
	
	@Column(name = "GuardianGender")
	private String Guardiangender;
	
	@Column(name = "RelationWithPatient")
	private String relationwithpatient;
	
	@Column(name = "GuardianHomeAddress")
	private String guardianhomeeaddrss;
	
	@Column(name = "GuardianHomeCity")
	private String guardianhomecity;
	
	@Column(name = "GuardianHomeState")	
	private String guardianhomestate;

	@Column(name = "GuardianHomeCountry")
	private String guardianhomecountry;
	
	@Column(name = "GuardianHomeZipCode")
	private String guardianhomezipcode;

	@Column(name = "GuardianMobileCountryCode")
	private String guardianmobilecountrycode;
	
	@Column(name = "GuardianMobileNo")
	private String guardianmobileno;
	
	@Column(name = "GuardianPhoneNo")
	private String guardianphoneno;
	
	@Column(name = "GuardianImage")
	private String guardianimage;
	
	@Column(name = "AdmintDate")
	private java.sql.Date admintdate;
	
	@Column(name = "AdmintTime")
	private java.sql.Time adminttime;
	
	@Column(name = "PatientStatus")
	private String patientstatus;
	
	@Column(name = "Symtoms")
	private String symptoms;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@OneToMany( mappedBy = "patientid", cascade = CascadeType.REMOVE)
	private List<LoginVO> loginid;
	
	@OneToMany( mappedBy = "patientid", cascade = CascadeType.REMOVE)
	private List<PatientDoctorVo> patientdoctorid;


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

	public String getGuardianid() {
		return guardianid;
	}

	public void setGuardianid(String guardianid) {
		this.guardianid = guardianid;
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

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}

	public String getGuardianfirstname() {
		return guardianfirstname;
	}

	public void setGuardianfirstname(String guardianfirstname) {
		this.guardianfirstname = guardianfirstname;
	}

	public String getGuardianmidalname() {
		return guardianmidalname;
	}

	public void setGuardianmidalname(String guardianmidalname) {
		this.guardianmidalname = guardianmidalname;
	}

	public String getGuardianlastname() {
		return guardianlastname;
	}

	public void setGuardianlastname(String guardianlastname) {
		this.guardianlastname = guardianlastname;
	}

	public String getGuardiangender() {
		return Guardiangender;
	}

	public void setGuardiangender(String guardiangender) {
		Guardiangender = guardiangender;
	}

	public String getRelationwithpatient() {
		return relationwithpatient;
	}

	public void setRelationwithpatient(String relationwithpatient) {
		this.relationwithpatient = relationwithpatient;
	}

	public String getGuardianhomeeaddrss() {
		return guardianhomeeaddrss;
	}

	public void setGuardianhomeeaddrss(String guardianhomeeaddrss) {
		this.guardianhomeeaddrss = guardianhomeeaddrss;
	}

	public String getGuardianhomecity() {
		return guardianhomecity;
	}

	public void setGuardianhomecity(String guardianhomecity) {
		this.guardianhomecity = guardianhomecity;
	}

	public String getGuardianhomestate() {
		return guardianhomestate;
	}

	public void setGuardianhomestate(String guardianhomestate) {
		this.guardianhomestate = guardianhomestate;
	}

	public String getGuardianhomecountry() {
		return guardianhomecountry;
	}

	public void setGuardianhomecountry(String guardianhomecountry) {
		this.guardianhomecountry = guardianhomecountry;
	}

	public String getGuardianhomezipcode() {
		return guardianhomezipcode;
	}

	public void setGuardianhomezipcode(String guardianhomezipcode) {
		this.guardianhomezipcode = guardianhomezipcode;
	}

	public String getGuardianmobilecountrycode() {
		return guardianmobilecountrycode;
	}

	public void setGuardianmobilecountrycode(String guardianmobilecountrycode) {
		this.guardianmobilecountrycode = guardianmobilecountrycode;
	}

	public String getGuardianmobileno() {
		return guardianmobileno;
	}

	public void setGuardianmobileno(String guardianmobileno) {
		this.guardianmobileno = guardianmobileno;
	}

	public String getGuardianphoneno() {
		return guardianphoneno;
	}

	public void setGuardianphoneno(String guardianphoneno) {
		this.guardianphoneno = guardianphoneno;
	}

	public String getGuardianimage() {
		return guardianimage;
	}

	public void setGuardianimage(String guardianimage) {
		this.guardianimage = guardianimage;
	}

	public java.sql.Date getAdmintdate() {
		return admintdate;
	}

	public void setAdmintdate(java.sql.Date admintdate) {
		this.admintdate = admintdate;
	}

	public java.sql.Time getAdminttime() {
		return adminttime;
	}

	public void setAdminttime(java.sql.Time adminttime) {
		this.adminttime = adminttime;
	}

	public String getPatientstatus() {
		return patientstatus;
	}

	public void setPatientstatus(String patientstatus) {
		this.patientstatus = patientstatus;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public List<LoginVO> getLoginid() {
		return loginid;
	}

	public void setLoginid(List<LoginVO> loginid) {
		this.loginid = loginid;
	}

	public List<PatientDoctorVo> getPatientdoctorid() {
		return patientdoctorid;
	}

	public void setPatientdoctorid(List<PatientDoctorVo> patientdoctorid) {
		this.patientdoctorid = patientdoctorid;
	}
	
}
