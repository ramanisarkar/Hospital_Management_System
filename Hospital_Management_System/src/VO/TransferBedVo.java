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
@Table(name = "TransferBed")
public class TransferBedVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "AllotmentDate")
	private String allotmentdate;
	
	@Column(name = "ExpectedDischargeDate")
	private String expecteddischargedate;
	
	@Column(name = "Joiningdate")
	private String joiningdate;
	
	@Column(name = "Description")
	private String Description;
	
	@ManyToOne
	@JoinColumn(name="AssignBedId")
	private AssignBedVo assignbedid;
	
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

	public String getAllotmentdate() {
		return allotmentdate;
	}

	public void setAllotmentdate(String allotmentdate) {
		this.allotmentdate = allotmentdate;
	}

	public String getExpecteddischargedate() {
		return expecteddischargedate;
	}

	public void setExpecteddischargedate(String expecteddischargedate) {
		this.expecteddischargedate = expecteddischargedate;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public AssignBedVo getAssignbedid() {
		return assignbedid;
	}

	public void setAssignbedid(AssignBedVo assignbedid) {
		this.assignbedid = assignbedid;
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

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
}