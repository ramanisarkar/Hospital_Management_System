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
@Table(name = "PrescriptionMedication")
public class PrescriptionMedicationVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Frequency")
	private int frequency;
	
	@Column(name = "NoOf")
	private int noof;
	
	@Column(name = "TimePeriod")
	private String timeperiod;
	
	@Column(name = "WhenToTake")
	private String whentotake;
	
	@ManyToOne
	@JoinColumn(name="MedicineId")
	private MedicineVo medicineid;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PrescriptionId")
	private PrescriptionVo prescriptionid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public int getNoof() {
		return noof;
	}

	public void setNoof(int noof) {
		this.noof = noof;
	}

	public String getTimeperiod() {
		return timeperiod;
	}

	public void setTimeperiod(String timeperiod) {
		this.timeperiod = timeperiod;
	}

	public String getWhentotake() {
		return whentotake;
	}

	public void setWhentotake(String whentotake) {
		this.whentotake = whentotake;
	}

	public MedicineVo getMedicineid() {
		return medicineid;
	}

	public void setMedicineid(MedicineVo medicineid) {
		this.medicineid = medicineid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public PrescriptionVo getPrescriptionid() {
		return prescriptionid;
	}

	public void setPrescriptionid(PrescriptionVo prescriptionid) {
		this.prescriptionid = prescriptionid;
	}	
	
}