package VO;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Operation")
public class OperationVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "OperationDate")
	private java.sql.Date operationdate;
	
	@Column(name = "OperationTime")
	private java.sql.Time Operationtime;
	
	@Column(name = "OperationStatus")
	private String OperationStatus;
	
	@Column(name = "Description")
	private String description;

	@Column(name = "OutComeStatus")
	private String OutComeStatus;
	
	@Column(name = "Joiningdate")
	private Timestamp joiningdate;
	
	@Column(name = "TotalOpearationCharge")
	private float totalopearationcharge;
	
	@ManyToOne
	@JoinColumn(name="Patient")
	private PatientRegistretionVo patientid;

	@ManyToOne
	@JoinColumn(name="OpreationAddId")
	private OpreationAddVo opreationaddid;
	
	@ManyToOne
	@JoinColumn(name="BedId")
	private AddBedVo bedid;

	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public java.sql.Date getOperationdate() {
		return operationdate;
	}

	public void setOperationdate(java.sql.Date operationdate) {
		this.operationdate = operationdate;
	}

	public Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Timestamp joiningdate) {
		this.joiningdate = joiningdate;
	}

	public java.sql.Time getOperationtime() {
		return Operationtime;
	}

	public void setOperationtime(java.sql.Time operationtime) {
		Operationtime = operationtime;
	}

	public String getOperationStatus() {
		return OperationStatus;
	}

	public String getOutComeStatus() {
		return OutComeStatus;
	}

	public void setOutComeStatus(String outComeStatus) {
		OutComeStatus = outComeStatus;
	}

	public void setOperationStatus(String operationStatus) {
		OperationStatus = operationStatus;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getTotalopearationcharge() {
		return totalopearationcharge;
	}

	public void setTotalopearationcharge(float totalopearationcharge) {
		this.totalopearationcharge = totalopearationcharge;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}

	public OpreationAddVo getOpreationaddid() {
		return opreationaddid;
	}

	public void setOpreationaddid(OpreationAddVo opreationaddid) {
		this.opreationaddid = opreationaddid;
	}

	public AddBedVo getBedid() {
		return bedid;
	}

	public void setBedid(AddBedVo bedid) {
		this.bedid = bedid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
