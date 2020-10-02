package VO;

public class TreatmentList {
	int id,adminid;
	String treatmentname,joiningdate, treatmentupdate;
	float price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float treatmentPrise) {
		this.price = treatmentPrise;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getTreatmentname() {
		return treatmentname;
	}
	public void setTreatmentname(String treatmentname) {
		this.treatmentname = treatmentname;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public String getTreatmentupdate() {
		return treatmentupdate;
	}
	public void setTreatmentupdate(String treatmentupdate) {
		this.treatmentupdate = treatmentupdate;
	}
	
	
}
