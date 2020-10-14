package VO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Prescription",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "DonorId"))
public class PrescriptionVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "Type")
	private String type;

	@Column(name = "CaseHistory")
	private String casehistory;
	
	@Column(name = "Frequency")
	private String frequency;
	
	@Column(name = "NoOf")
	private String noof;
	
	@Column(name = "TimePeriod")
	private String timeperiod;
	
	@Column(name = "WhenToTake")
	private String whentotake;
	
	@Column(name = "Note")
	private String note;

	@Column(name = "CustomField")
	private String customfield;
	
	@Column(name = "CustomFieldValue")
	private String customfieldvalue;
	
	@Column(name = "ReportType")
	private String reporttype;
	
	@Column(name = "ReportDescription")
	private String reportdescription;
	
	@Column(name = "DoctorVisitingCharge")
	private String doctorvisitingcharge;
	
	@Column(name = "DoctorConsultingCharge")
	private String doctorconsultingcharge;

}
