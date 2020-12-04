package VO;

import java.sql.Timestamp;

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
@Table(name = "InvoiceForPatient",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "InvoiceID"))
public class InvoiceHospitalVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "InvoiceID")
	private int invoiceid;
	
	@Column(name = "InvoiceTitle")
	private String invoicetitle;
	
	@Column(name = "SubtotalAmount")
	private float subtotalamount;

	@Column(name = "AdjustmentAmount")
	private float adjustmentamount;
	
	@Column(name = "TotalAmount")
	private float totalamount;
	
	@Column(name = "PaidAmount")
	private float paidamount;

	@Column(name = "Date")
	private java.sql.Date date;
	
	@Column(name = "Comments")
	private String comments;
	
	@Column(name = "Status")
	private String status;
	
	@Column(name = "Joiningdate")
	private Timestamp joiningdate;

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

	public int getInvoiceid() {
		return invoiceid;
	}

	public void setInvoiceid(int invoiceid) {
		this.invoiceid = invoiceid;
	}

	public String getInvoicetitle() {
		return invoicetitle;
	}

	public float getTotalamount() {
		return totalamount;
	}

	public Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Timestamp joiningdate) {
		this.joiningdate = joiningdate;
	}

	public void setTotalamount(float totalamount) {
		this.totalamount = totalamount;
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

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
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

	public float getPaidamount() {
		return paidamount;
	}

	public void setPaidamount(float paidamount) {
		this.paidamount = paidamount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
