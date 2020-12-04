package VO;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "InvoiceIncome")

public class InvoiceIncomeVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "PaymentMethod")
	private String paymentmethod;

	@Column(name = "Status")
	private String status;

	@Column(name = "PaymentDetails")
	private String paymentdetails;

	@Column(name = "Date")
	private Date date;

	@Column(name = "Joiningdate")
	private Timestamp joiningdate;

	@ManyToOne
	@JoinColumn(name = "Adminid")
	private AdminVo adminid;

	@ManyToOne
	@JoinColumn(name = "PatientId")
	private PatientRegistretionVo patientid;
	
	@ManyToOne
	@JoinColumn(name = "InvoiceId")
	private InvoiceHospitalVo invoiceid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(String paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentdetails() {
		return paymentdetails;
	}

	public void setPaymentdetails(String paymentdetails) {
		this.paymentdetails = paymentdetails;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Timestamp joiningdate) {
		this.joiningdate = joiningdate;
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

	public InvoiceHospitalVo getInvoiceid() {
		return invoiceid;
	}

	public void setInvoiceid(InvoiceHospitalVo invoiceid) {
		this.invoiceid = invoiceid;
	}
	
}
