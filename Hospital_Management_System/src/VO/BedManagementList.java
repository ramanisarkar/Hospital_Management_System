package VO;

public class BedManagementList {
	int bedcategoryid,id, adminid,addbedid,bednumber;
	String bedtype,description,patientId,location,joiningdate,startdate,enddate,patientname,bedupdate;
	float charges;
	
	
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getBedupdate() {
		return bedupdate;
	}
	public void setBedupdate(String bedupdate) {
		this.bedupdate = bedupdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public int getBednumber() {
		return bednumber;
	}
	public void setBednumber(int bednumber) {
		this.bednumber = bednumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getAddbedid() {
		return addbedid;
	}
	public void setAddbedid(int addbedid) {
		this.addbedid = addbedid;
	}
	public int getBedcategoryid() {
		return bedcategoryid;
	}
	public void setBedcategoryid(int bedcategoryid) {
		this.bedcategoryid = bedcategoryid;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getBedtype() {
		return bedtype;
	}
	public void setBedtype(String bedtype) {
		this.bedtype = bedtype;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getCharges() {
		return charges;
	}
	public void setCharges(float charges) {
		this.charges = charges;
	}
}
