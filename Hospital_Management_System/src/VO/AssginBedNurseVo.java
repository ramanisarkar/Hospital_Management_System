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
@Table(name = "AssignBedNurse")
public class AssginBedNurseVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="NurseId")
	private NurseVo nurseid;
	
	@ManyToOne
	@JoinColumn(name="AssignBedId")
	private  AssignBedVo assignbedvo;
	
	@ManyToOne
	@JoinColumn(name="TransferBedId")
	private  TransferBedVo transferid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public NurseVo getNurseid() {
		return nurseid;
	}

	public void setNurseid(NurseVo nurseid) {
		this.nurseid = nurseid;
	}

	public AssignBedVo getAssignbedvo() {
		return assignbedvo;
	}

	public void setAssignbedvo(AssignBedVo assignbedvo) {
		this.assignbedvo = assignbedvo;
	}

	public TransferBedVo getTransferid() {
		return transferid;
	}

	public void setTransferid(TransferBedVo transferid) {
		this.transferid = transferid;
	}
	
}
