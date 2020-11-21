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
@Table(name = "Prescription")
public class PrescriptionVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Type")
	private String type;

	@Column(name = "CaseHistory")
	private String casehistory;
	
	@Column(name = "Date")
	private String date;
	
	@Column(name = "Joiningdate")
	private String joiningdate;
	
	@Column(name = "ReportDescription")
	private String reportdescription;
	
	@Column(name = "DoctorVisitingCharge")
	private String doctorvisitingcharge;
	
	@Column(name = "DoctorConsultingCharge")
	private String doctorconsultingcharge;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="DoctorId")
	private DoctorVo doctorid;
	
	@ManyToOne
	@JoinColumn(name="PatientId")
	private PatientRegistretionVo patientid;
	
	@ManyToOne
	@JoinColumn(name="TreatmentId")
	private TreatmentVo treatmentid;
	
	@ManyToOne
	@JoinColumn(name="MedicineId")
	private MedicineVo medicineid;

	@ManyToOne
	@JoinColumn(name="ReportId")
	private ReportVo reportid;
	
	public int getId() {
		return id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCasehistory() {
		return casehistory;
	}

	public void setCasehistory(String casehistory) {
		this.casehistory = casehistory;
	}

	public String getReportdescription() {
		return reportdescription;
	}

	public void setReportdescription(String reportdescription) {
		this.reportdescription = reportdescription;
	}

	public String getDoctorvisitingcharge() {
		return doctorvisitingcharge;
	}

	public void setDoctorvisitingcharge(String doctorvisitingcharge) {
		this.doctorvisitingcharge = doctorvisitingcharge;
	}

	public String getDoctorconsultingcharge() {
		return doctorconsultingcharge;
	}

	public void setDoctorconsultingcharge(String doctorconsultingcharge) {
		this.doctorconsultingcharge = doctorconsultingcharge;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public DoctorVo getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(DoctorVo doctorid) {
		this.doctorid = doctorid;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}

	public TreatmentVo getTreatmentid() {
		return treatmentid;
	}

	public void setTreatmentid(TreatmentVo treatmentid) {
		this.treatmentid = treatmentid;
	}

	public MedicineVo getMedicineid() {
		return medicineid;
	}

	public void setMedicineid(MedicineVo medicineid) {
		this.medicineid = medicineid;
	}

	public ReportVo getReportid() {
		return reportid;
	}

	public void setReportid(ReportVo reportid) {
		this.reportid = reportid;
	}
}