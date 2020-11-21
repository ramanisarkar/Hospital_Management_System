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
@Table(name = "PatientOtherInfo")
public class PatientOtherInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "AdmintDate")
	private String admintdate;
	
	@Column(name = "AdmintTime")
	private java.sql.Time adminttime;
	
	@Column(name = "Status")
	private String status;
	
	@Column(name = "PatientType")
	private String patienttype;
	
	@ManyToOne
	@JoinColumn(name="DoctorId")
	private DoctorVo doctorid;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PatientRegistrationId")
	private PatientRegistretionVo patientregistrationid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdmintdate() {
		return admintdate;
	}

	public void setAdmintdate(String admintdate) {
		this.admintdate = admintdate;
	}

	public java.sql.Time getAdminttime() {
		return adminttime;
	}

	public void setAdminttime(java.sql.Time adminttime) {
		this.adminttime = adminttime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPatienttype() {
		return patienttype;
	}

	public void setPatienttype(String patienttype) {
		this.patienttype = patienttype;
	}

	public DoctorVo getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(DoctorVo doctorid) {
		this.doctorid = doctorid;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public PatientRegistretionVo getPatientregistrationid() {
		return patientregistrationid;
	}

	public void setPatientregistrationid(PatientRegistretionVo patientregistrationid) {
		this.patientregistrationid = patientregistrationid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
