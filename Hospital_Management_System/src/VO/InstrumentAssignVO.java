package VO;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Hardik
 *
 */
@Entity
@Table(name = "InstrumentAssign")
public class InstrumentAssignVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "StartDate")
	private Date startdate ;
	
	@Column(name = "ExpectedEndDate")
	private Date expectedenddate;
	
	@Column(name = "EndDate")
	private Timestamp enddate;
	
	@Column(name = "starttime")
	private Time starttime;
	
	@Column(name = "ExpectedEndTime")
	private Time expectedendtime;
	
	@Column(name = "Description")
	private String description;
	
	@Column(name = "JoningDate")
	private Timestamp joiningdate;
	
	@Column(name = "Total")
	private float total;
	
	@Column(name = "flag")
	private boolean flag;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PatientId")
	private PatientRegistretionVo patientid;
	
	@ManyToOne
	@JoinColumn(name="InstrumentId")
	private InstrumentVO instrumnetid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getExpectedenddate() {
		return expectedenddate;
	}

	public void setExpectedenddate(Date expectedenddate) {
		this.expectedenddate = expectedenddate;
	}

	public Time getStarttime() {
		return starttime;
	}

	public void setStarttime(Time starttime) {
		this.starttime = starttime;
	}

	public Time getExpectedendtime() {
		return expectedendtime;
	}

	public void setExpectedendtime(Time expectedendtime) {
		this.expectedendtime = expectedendtime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Timestamp joiningdate) {
		this.joiningdate = joiningdate;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public Timestamp getEnddate() {
		return enddate;
	}

	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
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

	public InstrumentVO getInstrumnetid() {
		return instrumnetid;
	}

	public void setInstrumnetid(InstrumentVO instrumnetid) {
		this.instrumnetid = instrumnetid;
	}
	
	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	@Override
	public String toString() {
		return "InstrumentAssignVO [id=" + id + ", startdate=" + startdate + ", expectedenddate=" + expectedenddate
				+ ", starttime=" + starttime + ", expectedendtime=" + expectedendtime + ", description=" + description
				+ ", joiningdate=" + joiningdate + ", total=" + total + "]";
	}
	
	
}
