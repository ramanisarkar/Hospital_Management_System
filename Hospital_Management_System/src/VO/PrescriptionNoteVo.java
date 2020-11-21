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
@Table(name = "PrescriptionNote")
public class PrescriptionNoteVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "CustomFiled1")
	private String filed1;
	
	@Column(name = "CustomFiled2")
	private String filed2;
	
	@Column(name = "Note")
	private String note;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	@ManyToOne
	@JoinColumn(name="PrescriptionId")
	private PrescriptionVo prescriptionid;

	public int getId() {
		return id;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFiled1() {
		return filed1;
	}

	public void setFiled1(String filed1) {
		this.filed1 = filed1;
	}

	public String getFiled2() {
		return filed2;
	}

	public void setFiled2(String filed2) {
		this.filed2 = filed2;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public PrescriptionVo getPrescriptionid() {
		return prescriptionid;
	}

	public void setPrescriptionid(PrescriptionVo prescriptionid) {
		this.prescriptionid = prescriptionid;
	}
	
	
}
