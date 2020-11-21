package VO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Medicine",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "medicineid"))
public class MedicineVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "MedicineName")
	private String medicinename;
	
	@Column(name = "MedicineDesrciption")
	private String medicinedesrciption;
	
	@Column(name = "MedicineBatchNumber")
	private String medicinebatchnumber;
	
	@Column(name = "MedicineQuantity")
	private int medicinequantity;
	
	@Column(name = "Price")
	private float price;
	
	@Column(name = "MedicineId")
	private String medicineid;
	
	@Column(name = "Note")
	private String note;
	
	@Column(name = "Discount")
	private float discount;
	
	@Column(name = "TypeOfDiscount")
	private String typeofdiscount;
	
	@Column(name = "ManufacturerCompanyName")
	private String manufacturercompanyname;
	
	@Column(name = "ManufactureDate")
	private String manufacturedate;
	
	@Column(name = "ExpiryDate")
	private String expirydate;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="CategoryName")
	private CategoryVo categoryid;
	
	@ManyToOne
	@JoinColumn(name="DoctorId")
	private DoctorVo doctorid;
	
	@ManyToOne
	@JoinColumn(name="AdminId")
	private AdminVo adminid;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMedicinename() {
		return medicinename;
	}

	public void setMedicinename(String medicinename) {
		this.medicinename = medicinename;
	}

	public String getMedicinedesrciption() {
		return medicinedesrciption;
	}

	public void setMedicinedesrciption(String medicinedesrciption) {
		this.medicinedesrciption = medicinedesrciption;
	}

	public String getMedicinebatchnumber() {
		return medicinebatchnumber;
	}

	public void setMedicinebatchnumber(String medicinebatchnumber) {
		this.medicinebatchnumber = medicinebatchnumber;
	}

	public int getMedicinequantity() {
		return medicinequantity;
	}

	public void setMedicinequantity(int medicinequantity) {
		this.medicinequantity = medicinequantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getMedicineid() {
		return medicineid;
	}

	public void setMedicineid(String medicineid) {
		this.medicineid = medicineid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getTypeofdiscount() {
		return typeofdiscount;
	}

	public void setTypeofdiscount(String typeofdiscount) {
		this.typeofdiscount = typeofdiscount;
	}

	public String getManufacturercompanyname() {
		return manufacturercompanyname;
	}

	public void setManufacturercompanyname(String manufacturercompanyname) {
		this.manufacturercompanyname = manufacturercompanyname;
	}
	
	public String getManufacturedate() {
		return manufacturedate;
	}

	public void setManufacturedate(String manufacturedate) {
		this.manufacturedate = manufacturedate;
	}

	public String getExpirydate() {
		return expirydate;
	}

	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public CategoryVo getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(CategoryVo categoryid) {
		this.categoryid = categoryid;
	}

	public DoctorVo getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(DoctorVo doctorid) {
		this.doctorid = doctorid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
