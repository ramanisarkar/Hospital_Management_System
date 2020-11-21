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
@Table(name = "AssignBed")
public class AssignBedVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "AllotmentDate")
	private java.sql.Date allotmentdate;
	
	@Column(name = "ExpectedDischargeDate")
	private java.sql.Date expecteddischargedate;
	
	@Column(name = "Description")
	private String description;
	
	@Column(name = "Flag")
	private boolean flag;
	
	@Column(name = "Joiningdate")
	private java.sql.Timestamp joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="BedId")
	private AddBedVo bedid;
	
	@ManyToOne
	@JoinColumn(name="OperationId")
	private OperationVo operationid;
	
	@ManyToOne
	@JoinColumn(name="Patient")
	private PatientRegistretionVo patientid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public java.sql.Date getAllotmentdate() {
		return allotmentdate;
	}

	public void setAllotmentdate(java.sql.Date allotmentdate) {
		this.allotmentdate = allotmentdate;
	}

	public java.sql.Date getExpecteddischargedate() {
		return expecteddischargedate;
	}

	public void setExpecteddischargedate(java.sql.Date expecteddischargedate) {
		this.expecteddischargedate = expecteddischargedate;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public java.sql.Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(java.sql.Timestamp joiningdate) {
		this.joiningdate = joiningdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public AddBedVo getBedid() {
		return bedid;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}

	public void setBedid(AddBedVo bedid) {
		this.bedid = bedid;
	}

	public OperationVo getOperationid() {
		return operationid;
	}

	public void setOperationid(OperationVo operationid) {
		this.operationid = operationid;
	}
}	
