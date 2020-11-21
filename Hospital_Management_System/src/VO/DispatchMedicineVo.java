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
@Table(name = "DispatchMedicine")
public class DispatchMedicineVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Quantity")
	private String quantity;
	
	@Column(name = "Discount")
	private String discount;
	
	@Column(name = "DiscountAmount")
	private float discountamount;
	
	@Column(name = "TotalPriceAmount")
	private float totalpriceamount;
	
	@Column(name = "TotalDiscountAmount")
	private float totaldiscountamount;
	
	@Column(name = "SubTotal")
	private float subtotal;
	
	@Column(name = "Discription")
	private String discription;
	
	@ManyToOne
	@JoinColumn(name="AdminId")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="PatientId")
	private PatientRegistretionVo patientid;
		
	@ManyToOne
	@JoinColumn(name="PrescriptionId")
	private PrescriptionVo prescriptionid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public float getDiscountamount() {
		return discountamount;
	}

	public void setDiscountamount(float discountamount) {
		this.discountamount = discountamount;
	}

	public float getTotalpriceamount() {
		return totalpriceamount;
	}

	public void setTotalpriceamount(float totalpriceamount) {
		this.totalpriceamount = totalpriceamount;
	}

	public float getTotaldiscountamount() {
		return totaldiscountamount;
	}

	public void setTotaldiscountamount(float totaldiscountamount) {
		this.totaldiscountamount = totaldiscountamount;
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

	public PrescriptionVo getPrescriptionid() {
		return prescriptionid;
	}

	public void setPrescriptionid(PrescriptionVo prescriptionid) {
		this.prescriptionid = prescriptionid;
	}
	
}
