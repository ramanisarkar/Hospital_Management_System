package VO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="Login",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "email"))
public class LoginVO {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id")
	private int id;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="UserName")
	private String username;
	
	@Column(name="Roll")
	private String roll;
	
	@Column(name="LastLogin")
	private String lastlogin;
	
	@ManyToOne
	@JoinColumn(name="adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="loginid")
	private DoctorVo doctorid;

	@ManyToOne
	@JoinColumn(name="nurseloginid")
	private NurseVo nurseloginid;

	@ManyToOne
	@JoinColumn(name="supportStaffLoginId")
	private Support_StaffVo supportstaffloginid;
	
	@ManyToOne
	@JoinColumn(name="pharmacistLoginId")
	private PharmacistVo pharmacistloginid;
	
	@ManyToOne
	@JoinColumn(name="laboratoryLoginId")
	private LaboratoryVo laboratoryloginid;
	
	@ManyToOne
	@JoinColumn(name="accountantLoginId")
	private AccountantStaffVo  accountantloginid;
	
//	@ManyToOne
//	@JoinColumn(name="loginid")
//	private PatientVo patientid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public DoctorVo getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(DoctorVo doctorid) {
		this.doctorid = doctorid;
	}

	public NurseVo getNurseloginid() {
		return nurseloginid;
	}

	public void setNurseloginid(NurseVo nurseloginid) {
		this.nurseloginid = nurseloginid;
	}

	public Support_StaffVo getSupportstaffloginid() {
		return supportstaffloginid;
	}

	public void setSupportstaffloginid(Support_StaffVo supportstaffloginid) {
		this.supportstaffloginid = supportstaffloginid;
	}

	public PharmacistVo getPharmacistloginid() {
		return pharmacistloginid;
	}

	public void setPharmacistloginid(PharmacistVo pharmacistloginid) {
		this.pharmacistloginid = pharmacistloginid;
	}

	public LaboratoryVo getLaboratoryloginid() {
		return laboratoryloginid;
	}

	public void setLaboratoryloginid(LaboratoryVo laboratoryloginid) {
		this.laboratoryloginid = laboratoryloginid;
	}

	public AccountantStaffVo getAccountantloginid() {
		return accountantloginid;
	}

	public void setAccountantloginid(AccountantStaffVo accountantloginid) {
		this.accountantloginid = accountantloginid;
	}
	

//	public PatientVo getPatientid() {
//		return patientid;
//	}
//
//	public void setPatientid(PatientVo patientid) {
//		this.patientid = patientid;
//	}

}
