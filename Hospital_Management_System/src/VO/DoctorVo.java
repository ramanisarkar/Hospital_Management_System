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
@Table(name = "Doctor",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "email"))
public class DoctorVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "FirstName")
	private String firstname;
	
	@Column(name = "MidalName")
	private String midalname;
	
	@Column(name = "LastName")
	private String lastname;
	
	@Column(name = "DateOfBirth")
	private java.sql.Date birthdate;
	
	@Column(name = "Gender")
	private String gender;
	
	@Column(name = "OfficeAddress")
	private String officeaddrss;
	
	@Column(name = "OfficeCity")
	private String officecity;
	
	@Column(name = "OfficeState")	
	private String officestate;

	@Column(name = "OfficeCountry")
	private String officecountry;
	
	@Column(name = "OfficeZipCode")
	private String officezipcode;
	
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
	
	@Column(name = "Degree")
	private String degree;
	
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
	
	@Column(name = "VisitingCharge")
	private String visitingcharge;

	@Column(name = "ConsultingCharge")
	private String consultingcharge;
	
	@Column(name = "ProfileImage")
	private String profileimage;
	
	@Column(name = "CurriculumVitae")
	private String curriculumvitae;
	
	@Column(name = "EducationCertificate")
	private String educationcertificate;
	
	@Column(name = "ExperienceCertificate")
	private String experiencecertificate;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="Departmentid")
	private DepartmentVo departmentid;
	
	@ManyToOne
	@JoinColumn(name="Specializationid")
	private SpecializationVo specializationid;
	
	@OneToMany( mappedBy = "doctorid", cascade = CascadeType.REMOVE)
	private List<LoginVO> loginid;
	
	@OneToMany( mappedBy = "doctorid", cascade = CascadeType.REMOVE)
	private List<MedicineVo> medicinid;
	
	/*
	 * @OneToMany( mappedBy = "doctorid", cascade = CascadeType.REMOVE) private
	 * List<PatientDoctorVo> patientdoctorid;
	 */


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getOfficeaddrss() {
		return officeaddrss;
	}

	public void setOfficeaddrss(String officeaddrss) {
		this.officeaddrss = officeaddrss;
	}

	public String getOfficecity() {
		return officecity;
	}

	public void setOfficecity(String officecity) {
		this.officecity = officecity;
	}

	public String getOfficestate() {
		return officestate;
	}

	public void setOfficestate(String officestate) {
		this.officestate = officestate;
	}

	public String getOfficecountry() {
		return officecountry;
	}

	public void setOfficecountry(String officecountry) {
		this.officecountry = officecountry;
	}

	public String getOfficezipcode() {
		return officezipcode;
	}

	public void setOfficezipcode(String officezipcode) {
		this.officezipcode = officezipcode;
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

	public String getVisitingcharge() {
		return visitingcharge;
	}

	public void setVisitingcharge(String visitingcharge) {
		this.visitingcharge = visitingcharge;
	}

	public String getConsultingcharge() {
		return consultingcharge;
	}

	public void setConsultingcharge(String consultingcharge) {
		this.consultingcharge = consultingcharge;
	}

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}

	public String getCurriculumvitae() {
		return curriculumvitae;
	}

	public void setCurriculumvitae(String curriculumvitae) {
		this.curriculumvitae = curriculumvitae;
	}

	public String getEducationcertificate() {
		return educationcertificate;
	}

	public void setEducationcertificate(String educationcertificate) {
		this.educationcertificate = educationcertificate;
	}

	public String getExperiencecertificate() {
		return experiencecertificate;
	}

	public void setExperiencecertificate(String experiencecertificate) {
		this.experiencecertificate = experiencecertificate;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public DepartmentVo getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(DepartmentVo departmentid) {
		this.departmentid = departmentid;
	}

	public SpecializationVo getSpecializationid() {
		return specializationid;
	}

	public void setSpecializationid(SpecializationVo specializationid) {
		this.specializationid = specializationid;
	}

	public List<LoginVO> getLoginid() {
		return loginid;
	}

	public void setLoginid(List<LoginVO> loginid) {
		this.loginid = loginid;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

//	public List<PatientDoctorVo> getPatientdoctorid() {
//		return patientdoctorid;
//	}
//
//	public void setPatientdoctorid(List<PatientDoctorVo> patientdoctorid) {
//		this.patientdoctorid = patientdoctorid;
//	}	
}