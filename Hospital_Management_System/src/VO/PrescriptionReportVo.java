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
@Table(name = "PrescriptionReport")
public class PrescriptionReportVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="ReportId")
	private ReportVo reportid;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	@ManyToOne
	@JoinColumn(name="PrescriptionId")
	private PrescriptionVo prescriptionid;

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

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public PrescriptionVo getPrescriptionid() {
		return prescriptionid;
	}

	public void setPrescriptionid(PrescriptionVo prescriptionid) {
		this.prescriptionid = prescriptionid;
	}
}
