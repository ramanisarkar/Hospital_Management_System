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
@Table(name = "InvoiceForPatient")
public class InvoiceHospitalVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "InvoiceID")
	private int InvoiceID;
	
	@Column(name = "InvoiceTitle")
	private String invoicetitle;
	
	@Column(name = "SubtotalAmount")
	private float subtotalamount;

	@Column(name = "AdjustmentAmount")
	private float adjustmentamount;

	@Column(name = "Date")
	private String date;
	
	@Column(name = "Comments")
	private String comments;

	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PatientId")
	private PatientRegistretionVo patientid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInvoiceID() {
		return InvoiceID;
	}

	public void setInvoiceID(int invoiceID) {
		InvoiceID = invoiceID;
	}

	public String getInvoicetitle() {
		return invoicetitle;
	}

	public void setInvoicetitle(String invoicetitle) {
		this.invoicetitle = invoicetitle;
	}

	public float getSubtotalamount() {
		return subtotalamount;
	}

	public void setSubtotalamount(float subtotalamount) {
		this.subtotalamount = subtotalamount;
	}

	public float getAdjustmentamount() {
		return adjustmentamount;
	}

	public void setAdjustmentamount(float adjustmentamount) {
		this.adjustmentamount = adjustmentamount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}
}
