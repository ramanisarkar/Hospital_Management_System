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
@Table(name = "DispatchedMedicine")
public class DispatchedMedicineVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "TotalPrice")
	private float totalprice;

	@Column(name = "TotalDiscount")
	private float totaldiscount;

	@Column(name = "SubTotal")
	private float subtotal;
	
	@Column(name = "Discription")
	private String discription;
	
	@Column(name = "JoiningDate")
	private String joinindate;
	
	@ManyToOne
	@JoinColumn(name="patientId")
	private PatientRegistretionVo patientid;

	@ManyToOne
	@JoinColumn(name="PrescriptionId")
	private PrescriptionVo prescriptionid;
	
	@ManyToOne
	@JoinColumn(name="AdminId")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}

	public float getTotaldiscount() {
		return totaldiscount;
	}

	public void setTotaldiscount(float totaldiscount) {
		this.totaldiscount = totaldiscount;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public PatientRegistretionVo getPatientid() {
		return patientid;
	}

	public void setPatientid(PatientRegistretionVo patientid) {
		this.patientid = patientid;
	}

	public PrescriptionVo getPrescriptionid() {
		return prescriptionid;
	}

	public void setPrescriptionid(PrescriptionVo prescriptionid) {
		this.prescriptionid = prescriptionid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public String getJoinindate() {
		return joinindate;
	}

	public void setJoinindate(String joinindate) {
		this.joinindate = joinindate;
	}
	
}
