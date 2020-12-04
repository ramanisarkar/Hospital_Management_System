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
@Table(name = "PatientChargesHistory")
public class PatientChargesHistoryVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name="ChargeType")
	private String chargetype;

	@Column(name="Title")
	private String title;
	
	@Column(name="date")
	private java.sql.Date date;
	
	@Column(name="Unit")
	private String unit;
	
	@Column(name="Amount")
	private float amount;
	
	@Column(name="DiscountAmount")
	private float discountamount;
	
	@Column(name="TotalAmount")
	private float totalamount;
	
	@Column(name="PramentType")
	private boolean pramenttype;

	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="patientid")
	private PatientRegistretionVo patientid;

	@ManyToOne
	@JoinColumn(name="AssginBedId")
	private AssignBedVo assginbedid;
	
	@ManyToOne
	@JoinColumn(name="DiagnosisId")
	private DiagnosisReportAddVo  diagnosisid ;
	
	@ManyToOne
	@JoinColumn(name="InstrumentId")
	private InstrumentAssignVO  instrumentid ;
	
	@ManyToOne
	@JoinColumn(name="OperationId")
	private OperationVo  operationid ;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChargetype() {
		return chargetype;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}

	public void setChargetype(String chargetype) {
		this.chargetype = chargetype;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	public float getAmount() {
		return amount;
	}

	public float getDiscountamount() {
		return discountamount;
	}

	public void setDiscountamount(float discountamount) {
		this.discountamount = discountamount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public float getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(float totalamount) {
		this.totalamount = totalamount;
	}

	public boolean isPramenttype() {
		return pramenttype;
	}

	public void setPramenttype(boolean pramenttype) {
		this.pramenttype = pramenttype;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public AssignBedVo getAssginbedid() {
		return assginbedid;
	}

	public void setAssginbedid(AssignBedVo assginbedid) {
		this.assginbedid = assginbedid;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public DiagnosisReportAddVo getDiagnosisid() {
		return diagnosisid;
	}

	public void setDiagnosisid(DiagnosisReportAddVo diagnosisid) {
		this.diagnosisid = diagnosisid;
	}

	public InstrumentAssignVO getInstrumentid() {
		return instrumentid;
	}

	public void setInstrumentid(InstrumentAssignVO instrumentid) {
		this.instrumentid = instrumentid;
	}

	public OperationVo getOperationid() {
		return operationid;
	}

	public void setOperationid(OperationVo operationid) {
		this.operationid = operationid;
	}
}
