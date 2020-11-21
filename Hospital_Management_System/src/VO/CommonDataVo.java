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
@Table(name = "CommonData")
public class CommonDataVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="SymptomsId")
	private SymptomsVo symptomsid;
	
	@ManyToOne
	@JoinColumn(name="SymptomsPatientId")
	private PatientRegistretionVo symptomspatientid;

	@ManyToOne
	@JoinColumn(name="OprationDocctorId")
	private DoctorVo opreationdoctorid;
	
	@ManyToOne
	@JoinColumn(name="OutpatientId")
	private OperationVo opreationid;

	@Column(name = "TransferBedNurseId")
	private int transferbednurseid;
	
	@ManyToOne
	@JoinColumn(name="TransferBedId")
	private TransferBedVo transferbedid;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public SymptomsVo getSymptomsid() {
		return symptomsid;
	}

	public void setSymptomsid(SymptomsVo symptomsid) {
		this.symptomsid = symptomsid;
	}

	public PatientRegistretionVo getSymptomspatientid() {
		return symptomspatientid;
	}

	public void setSymptomspatientid(PatientRegistretionVo symptomspatientid) {
		this.symptomspatientid = symptomspatientid;
	}

	public DoctorVo getOpreationdoctorid() {
		return opreationdoctorid;
	}

	public void setOpreationdoctorid(DoctorVo opreationdoctorid) {
		this.opreationdoctorid = opreationdoctorid;
	}

	public OperationVo getOpreationid() {
		return opreationid;
	}

	public void setOpreationid(OperationVo opreationid) {
		this.opreationid = opreationid;
	}

	public int getTransferbednurseid() {
		return transferbednurseid;
	}

	public void setTransferbednurseid(int transferbednurseid) {
		this.transferbednurseid = transferbednurseid;
	}

	public TransferBedVo getTransferbedid() {
		return transferbedid;
	}

	public void setTransferbedid(TransferBedVo transferbedid) {
		this.transferbedid = transferbedid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
}
