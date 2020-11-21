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
@Table(name = "DiagnosisReportApply")
public class DiagnosisReportApplyVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="ReportId")
	private ReportVo reportid;
	
	@Column(name = "Report")
	private String report;
	
	@ManyToOne
	@JoinColumn(name="DiagnosisReportId")
	private DiagnosisReportAddVo diagnosisreportid;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ReportVo getReportid() {
		return reportid;
	}

	public void setReportid(ReportVo reportid) {
		this.reportid = reportid;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public DiagnosisReportAddVo getDiagnosisreportid() {
		return diagnosisreportid;
	}

	public void setDiagnosisreportid(DiagnosisReportAddVo diagnosisreportid) {
		this.diagnosisreportid = diagnosisreportid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
