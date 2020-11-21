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
@Table(name = "DispatchedMedicineInfo")
public class DispatchMedicineInfoVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Quantity")
	private int quantity;
	
	@Column(name = "Discount")
	private float discount;
	
	@Column(name = "DiscountAmount")
	private float discountamount;

	@ManyToOne
	@JoinColumn(name="medicineId")
	private MedicineVo medicineId;
	
	@ManyToOne
	@JoinColumn(name="DispatchedMedicineId")
	private DispatchedMedicineVo dispatchedmedicineid;
	
	@ManyToOne
	@JoinColumn(name="AdminId")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getDiscountamount() {
		return discountamount;
	}

	public void setDiscountamount(float discountamount) {
		this.discountamount = discountamount;
	}

	public MedicineVo getMedicineId() {
		return medicineId;
	}

	public void setMedicineId(MedicineVo medicineId) {
		this.medicineId = medicineId;
	}

	public DispatchedMedicineVo getDispatchedmedicineid() {
		return dispatchedmedicineid;
	}

	public void setDispatchedmedicineid(DispatchedMedicineVo dispatchedmedicineid) {
		this.dispatchedmedicineid = dispatchedmedicineid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
}
