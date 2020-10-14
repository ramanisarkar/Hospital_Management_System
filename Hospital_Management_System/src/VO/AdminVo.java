package VO;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Admin", uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "email"))
public class AdminVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "HospitalName")
	private String hospitalname;
	
	@Column(name = "StartingYear")
	private String startingyear;
	
	@Column(name = "Address")
	private String address;
	
	@Column(name = "Contact_NO")
	private String con_no;
	
	@Column(name = "Country")
	private String country;
	
	@Column(name = "Currency")
	private String currency;

	@Column(name = "Email")
	private String email;
	
	@Column(name = "Password")
	private String password;

	@Column(name = "HospitalLogo")
	private String hospitallogo;

	@Column(name = "ProfileCoverImage")
	private String coverimage;
	
	@Column(name = "UserCanChangeImage")
	private String usercanchangeimage;
	
	@Column(name = "HospitalNamePrescription")
	private String hospitalnameprescription;
	
	@Column(name = "MessageAdmin")
	private String messageadmin;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@OneToMany( mappedBy = "adminid", cascade = CascadeType.REMOVE)
	private List<LoginVO> loginid;

	@OneToMany(mappedBy = "departmentadminid", cascade = CascadeType.REMOVE)
	private List<DepartmentVo> departmentid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<SpecializationVo> sepid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<DoctorVo> doctorid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<NurseVo> nurseid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<Support_StaffVo> supportstaffid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<PharmacistVo> pharmacistid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<LaboratoryVo> laboratoryid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<AccountantStaffVo> accountantid;

	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<CategoryVo> categoryid;

	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<MedicineVo> medicinetid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<TreatmentVo> treatmentid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<BloodManageVo> bloodManageid;
	
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<BloodDonorVo> bloodDonorid;

	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<PatientRegistretionVo> patientRegistrationid;

    @OneToMany( mappedBy = "adminid", cascade = CascadeType.REMOVE)
    private List<PatientVo> patientid;
    
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<BloodStockVo> bloodstockid;

    @OneToMany( mappedBy = "adminid", cascade = CascadeType.REMOVE)
    private List<BloodOutwordVo> bloodoutwordid;
    
	@OneToMany( mappedBy = "adminid" , cascade = CascadeType.REMOVE)
	private List<EventVo> eventid;

    @OneToMany( mappedBy = "adminid", cascade = CascadeType.REMOVE)
    private List<EventForVo> eventforid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHospitalname() {
		return hospitalname;
	}

	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}

	public String getStartingyear() {
		return startingyear;
	}

	public void setStartingyear(String startingyear) {
		this.startingyear = startingyear;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCon_no() {
		return con_no;
	}

	public void setCon_no(String con_no) {
		this.con_no = con_no;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
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

	public String getHospitallogo() {
		return hospitallogo;
	}

	public void setHospitallogo(String hospitallogo) {
		this.hospitallogo = hospitallogo;
	}

	public String getCoverimage() {
		return coverimage;
	}

	public void setCoverimage(String coverimage) {
		this.coverimage = coverimage;
	}

	public String getUsercanchangeimage() {
		return usercanchangeimage;
	}

	public void setUsercanchangeimage(String usercanchangeimage) {
		this.usercanchangeimage = usercanchangeimage;
	}

	public String getHospitalnameprescription() {
		return hospitalnameprescription;
	}

	public void setHospitalnameprescription(String hospitalnameprescription) {
		this.hospitalnameprescription = hospitalnameprescription;
	}

	public String getMessageadmin() {
		return messageadmin;
	}

	public void setMessageadmin(String messageadmin) {
		this.messageadmin = messageadmin;
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

	public List<DepartmentVo> getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(List<DepartmentVo> departmentid) {
		this.departmentid = departmentid;
	}

	public List<SpecializationVo> getSepid() {
		return sepid;
	}

	public void setSepid(List<SpecializationVo> sepid) {
		this.sepid = sepid;
	}

	public List<DoctorVo> getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(List<DoctorVo> doctorid) {
		this.doctorid = doctorid;
	}

	public List<NurseVo> getNurseid() {
		return nurseid;
	}

	public void setNurseid(List<NurseVo> nurseid) {
		this.nurseid = nurseid;
	}

	public List<Support_StaffVo> getSupportstaffid() {
		return supportstaffid;
	}

	public void setSupportstaffid(List<Support_StaffVo> supportstaffid) {
		this.supportstaffid = supportstaffid;
	}

	public List<PharmacistVo> getPharmacistid() {
		return pharmacistid;
	}

	public void setPharmacistid(List<PharmacistVo> pharmacistid) {
		this.pharmacistid = pharmacistid;
	}

	public List<LaboratoryVo> getLaboratoryid() {
		return laboratoryid;
	}

	public void setLaboratoryid(List<LaboratoryVo> laboratoryid) {
		this.laboratoryid = laboratoryid;
	}

	public List<AccountantStaffVo> getAccountantid() {
		return accountantid;
	}

	public void setAccountantid(List<AccountantStaffVo> accountantid) {
		this.accountantid = accountantid;
	}

	public List<CategoryVo> getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(List<CategoryVo> categoryid) {
		this.categoryid = categoryid;
	}

	public List<MedicineVo> getMedicinetid() {
		return medicinetid;
	}

	public void setMedicinetid(List<MedicineVo> medicinetid) {
		this.medicinetid = medicinetid;
	}

	public List<TreatmentVo> getTreatmentid() {
		return treatmentid;
	}

	public void setTreatmentid(List<TreatmentVo> treatmentid) {
		this.treatmentid = treatmentid;
	}

	public List<BloodManageVo> getBloodManageid() {
		return bloodManageid;
	}

	public void setBloodManageid(List<BloodManageVo> bloodManageid) {
		this.bloodManageid = bloodManageid;
	}

	public List<BloodDonorVo> getBloodDonorid() {
		return bloodDonorid;
	}

	public void setBloodDonorid(List<BloodDonorVo> bloodDonorid) {
		this.bloodDonorid = bloodDonorid;
	}

	public List<PatientRegistretionVo> getPatientRegistrationid() {
		return patientRegistrationid;
	}

	public void setPatientRegistrationid(List<PatientRegistretionVo> patientRegistrationid) {
		this.patientRegistrationid = patientRegistrationid;
	}

	public List<PatientVo> getPatientid() {
		return patientid;
	}

	public void setPatientid(List<PatientVo> patientid) {
		this.patientid = patientid;
	}

	public List<BloodStockVo> getBloodstockid() {
		return bloodstockid;
	}

	public void setBloodstockid(List<BloodStockVo> bloodstockid) {
		this.bloodstockid = bloodstockid;
	}

	public List<BloodOutwordVo> getBloodoutwordid() {
		return bloodoutwordid;
	}

	public void setBloodoutwordid(List<BloodOutwordVo> bloodoutwordid) {
		this.bloodoutwordid = bloodoutwordid;
	}

	public List<EventVo> getEventid() {
		return eventid;
	}

	public void setEventid(List<EventVo> eventid) {
		this.eventid = eventid;
	}

	public List<EventForVo> getEventforid() {
		return eventforid;
	}

	public void setEventforid(List<EventForVo> eventforid) {
		this.eventforid = eventforid;
	}
}
