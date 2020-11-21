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
@Table(name = "DiagnosisReportAdd")
public class DiagnosisReportAddVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Description")
	private String description;
	
	@Column(name = "SendEmailPatient")
	private String sendemailpatient;
	
	@Column(name = "SendEmailDoctor")
	private String sendemaildoctor;
	
	@Column(name = "Total")
	private float total;
	
	@Column(name = "Date")
	private Date date;
	
	@Column(name = "JoiningDate")
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSendemailpatient() {
		return sendemailpatient;
	}

	public void setSendemailpatient(String sendemailpatient) {
		this.sendemailpatient = sendemailpatient;
	}

	public String getSendemaildoctor() {
		return sendemaildoctor;
	}

	public void setSendemaildoctor(String sendemaildoctor) {
		this.sendemaildoctor = sendemaildoctor;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
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
}