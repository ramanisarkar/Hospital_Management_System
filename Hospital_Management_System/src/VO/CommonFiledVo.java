package VO;

public class CommonFiledVo {
	int prescriptionId ,PatientID, quantity,id ,adminId,id2 ;
	String date,joiningdate,discription ,patientId,patientName,type,treatmentName,Name,title,field1,field2,field3;
	float price ,discount ,subtotal,floatfield1;
	boolean bool1,bool2 ,bool3 ,bool4 ,bool5;
	java.sql.Date chargedate;
	
	public java.sql.Date getChargedate() {
		return chargedate;
	}
	public void setChargedate(java.sql.Date chargedate) {
		this.chargedate = chargedate;
	}
	public boolean isBool1() {
		
		return bool1;
	}
	public void setBool1(boolean bool1) {
		this.bool1 = bool1;
	}
	public boolean isBool2() {
		return bool2;
	}
	public void setBool2(boolean bool2) {
		this.bool2 = bool2;
	}
	public boolean isBool3() {
		return bool3;
	}
	public void setBool3(boolean bool3) {
		this.bool3 = bool3;
	}
	public boolean isBool4() {
		return bool4;
	}
	public void setBool4(boolean bool4) {
		this.bool4 = bool4;
	}
	public boolean isBool5() {
		return bool5;
	}
	public void setBool5(boolean bool5) {
		this.bool5 = bool5;
	}
	public float getFloatfield1() {
		return floatfield1;
	}
	public void setFloatfield1(float floatfield1) {
		this.floatfield1 = floatfield1;
	}
	public int getId2() {
		return id2;
	}
	public void setId2(int id2) {
		this.id2 = id2;
	}
	public String getField3() {
		return field3;
	}
	public void setField3(String field3) {
		this.field3 = field3;
	}
	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public String getField2() {
		return field2;
	}
	public void setField2(String field2) {
		this.field2 = field2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public int getPatientID() {
		return PatientID;
	}
	public void setPatientID(int patientID) {
		PatientID = patientID;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
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
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getPrescriptionId() {
		return prescriptionId;
	}
	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTreatmentName() {
		return treatmentName;
	}
	public void setTreatmentName(String treatmentName) {
		this.treatmentName = treatmentName;
	}
	@Override
	public String toString() {
		return "CommonFiledVo [prescriptionId=" + prescriptionId + ", PatientID=" + PatientID + ", quantity=" + quantity
				+ ", id=" + id + ", adminId=" + adminId + ", id2=" + id2 + ", date=" + date + ", joiningdate="
				+ joiningdate + ", discription=" + discription + ", patientId=" + patientId + ", patientName="
				+ patientName + ", type=" + type + ", treatmentName=" + treatmentName + ", Name=" + Name + ", title="
				+ title + ", field1=" + field1 + ", field2=" + field2 + ", field3=" + field3 + ", price=" + price
				+ ", discount=" + discount + ", subtotal=" + subtotal + ", floatfield1=" + floatfield1 + ", bool1="
				+ bool1 + ", bool2=" + bool2 + ", bool3=" + bool3 + ", bool4=" + bool4 + ", bool5=" + bool5
				+ ", chargedate=" + chargedate + "]";
	}
	
}
