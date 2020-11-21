package VO;

import java.util.List;

public class DiagnosisReportAddList {
	int id ,patientid,reportid,adminid;
	String reportpath,reportname,patientname,patientuniqid,date,discription,uniqid,emailtopatient,emailtodoctor,joiningdate;
	float total,reportcost;
	List<DiagnosisReportApplyVo> lis ;
	
	public List<DiagnosisReportApplyVo> getLis() {
		return lis;
	}
	public void setLis(List<DiagnosisReportApplyVo> lis) {
		this.lis = lis;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public String getEmailtopatient() {
		return emailtopatient;
	}
	public void setEmailtopatient(String emailtopatient) {
		this.emailtopatient = emailtopatient;
	}
	public String getEmailtodoctor() {
		return emailtodoctor;
	}
	public void setEmailtodoctor(String emailtodoctor) {
		this.emailtodoctor = emailtodoctor;
	}
	public int getId() {
		return id;
	}
	public String getUniqid() {
		return uniqid;
	}
	public void setUniqid(String uniqid) {
		this.uniqid = uniqid;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPatientid() {
		return patientid;
	}
	public void setPatientid(int patientid) {
		this.patientid = patientid;
	}
	public int getReportid() {
		return reportid;
	}
	public void setReportid(int reportid) {
		this.reportid = reportid;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getReportpath() {
		return reportpath;
	}
	public void setReportpath(String reportpath) {
		this.reportpath = reportpath;
	}
	public String getReportname() {
		return reportname;
	}
	public void setReportname(String reportname) {
		this.reportname = reportname;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getPatientuniqid() {
		return patientuniqid;
	}
	public void setPatientuniqid(String patientuniqid) {
		this.patientuniqid = patientuniqid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getReportcost() {
		return reportcost;
	}
	public void setReportcost(float reportcost) {
		this.reportcost = reportcost;
	}
}
