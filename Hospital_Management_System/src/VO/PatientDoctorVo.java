package VO;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PatientDoctor")
public class PatientDoctorVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PatientOtherInfoId")
	private PatientOtherInfo patientotherinfoid;
	
	@Column(name = "PatientType")
	private String patienttype;
	
	@ManyToOne
	@JoinColumn(name="DoctorId")
	private DoctorVo doctorid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public PatientOtherInfo getPatientotherinfoid() {
		return patientotherinfoid;
	}

	public void setPatientotherinfoid(PatientOtherInfo patientotherinfoid) {
		this.patientotherinfoid = patientotherinfoid;
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
	
}