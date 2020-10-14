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
@Table(name = "Diagnosis_Report")
public class DiagnosisReportVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "Report")
	private String report;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="OutPatientid")
	private OutPatientVo outpatientid;
	
	@ManyToOne
	@JoinColumn(name="PatientRegistreationid")
	private PatientRegistretionVo patientregistreationid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public OutPatientVo getOutpatientid() {
		return outpatientid;
	}

	public void setOutpatientid(OutPatientVo outpatientid) {
		this.outpatientid = outpatientid;
	}

	public PatientRegistretionVo getPatientregistreationid() {
		return patientregistreationid;
	}

	public void setPatientregistreationid(PatientRegistretionVo patientregistreationid) {
		this.patientregistreationid = patientregistreationid;
	}
	
}
