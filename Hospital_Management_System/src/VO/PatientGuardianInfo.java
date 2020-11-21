package VO;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class PatientGuardianInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "GuardianId")
	private String guardianid;
	
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
	
	@ManyToOne
	@JoinColumn(name="PatientOtherInfoId")
	private PatientOtherInfo patientotherinfoid;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuardianid() {
		return guardianid;
	}

	public void setGuardianid(String guardianid) {
		this.guardianid = guardianid;
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

	public PatientOtherInfo getPatientotherinfoid() {
		return patientotherinfoid;
	}

	public void setPatientotherinfoid(PatientOtherInfo patientotherinfoid) {
		this.patientotherinfoid = patientotherinfoid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
