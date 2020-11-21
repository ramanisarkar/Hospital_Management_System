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
@Table(name = "DataCount")
public class AllDataCountVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Patient")
	private int patient;
	
	@Column(name = "Doctor")
	private int doctor;
	
	@Column(name = "Nurse")
	private int nurse;
	
	@Column(name = "SupportStaff")
	private int supportingstaff;
	
	@Column(name = "Message")
	private int message;
	
	@Column(name = "Appointment")
	private int appointment;
	
	@Column(name = "Prescription")
	private int prescription;
	
	@Column(name = "AssginBed")
	private int assginbed;
	
	@Column(name = "Treatment")
	private int treatment;
	
	@Column(name = "Event")
	private int event;
	
	@Column(name = "Pharmacist")
	private int pharmacist;
	
	@Column(name = "Medicine")
	private int medicine;
	
	@Column(name = "LaboratoryStaff")
	private int laboratorystaff;
	
	@Column(name = "DiagnosisReport")
	private int diagnosisreport;
	
	@Column(name = "Account")
	private int account;
	
	@Column(name = "Invoice")
	private int invoice;

	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPatient() {
		return patient;
	}

	public void setPatient(int patient) {
		this.patient = patient;
	}

	public int getDoctor() {
		return doctor;
	}

	public void setDoctor(int doctor) {
		this.doctor = doctor;
	}

	public int getNurse() {
		return nurse;
	}

	public void setNurse(int nurse) {
		this.nurse = nurse;
	}

	public int getSupportingstaff() {
		return supportingstaff;
	}

	public void setSupportingstaff(int supportingstaff) {
		this.supportingstaff = supportingstaff;
	}

	public int getMessage() {
		return message;
	}

	public void setMessage(int message) {
		this.message = message;
	}

	public int getAppointment() {
		return appointment;
	}

	public void setAppointment(int appointment) {
		this.appointment = appointment;
	}

	public int getPrescription() {
		return prescription;
	}

	public void setPrescription(int prescription) {
		this.prescription = prescription;
	}

	public int getAssginbed() {
		return assginbed;
	}

	public void setAssginbed(int assginbed) {
		this.assginbed = assginbed;
	}

	public int getTreatment() {
		return treatment;
	}

	public void setTreatment(int treatment) {
		this.treatment = treatment;
	}

	public int getEvent() {
		return event;
	}

	public void setEvent(int event) {
		this.event = event;
	}

	public int getPharmacist() {
		return pharmacist;
	}

	public void setPharmacist(int pharmacist) {
		this.pharmacist = pharmacist;
	}

	public int getMedicine() {
		return medicine;
	}

	public void setMedicine(int medicine) {
		this.medicine = medicine;
	}

	public int getLaboratorystaff() {
		return laboratorystaff;
	}

	public void setLaboratorystaff(int laboratorystaff) {
		this.laboratorystaff = laboratorystaff;
	}

	public int getDiagnosisreport() {
		return diagnosisreport;
	}

	public void setDiagnosisreport(int diagnosisreport) {
		this.diagnosisreport = diagnosisreport;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public int getInvoice() {
		return invoice;
	}

	public void setInvoice(int invoice) {
		this.invoice = invoice;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
}
