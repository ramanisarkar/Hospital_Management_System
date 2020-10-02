package VO;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Department")
public class DepartmentVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "DepartmentName")
	private String department;
	
	@ManyToOne
	@JoinColumn(name="DepartmentAdminid")
	private AdminVo departmentadminid;
	
	@OneToMany( mappedBy = "departmentid" , cascade = CascadeType.REMOVE)
	private List<SpecializationVo> specializationid;
	
	@OneToMany( mappedBy = "departmentid" , cascade = CascadeType.REMOVE)
	private List<DoctorVo> doctorid;
	
	@OneToMany( mappedBy = "departmentid" , cascade = CascadeType.REMOVE)
	private List<NurseVo> nurseid;

	@OneToMany( mappedBy = "departmentid" , cascade = CascadeType.REMOVE)
	private List<Support_StaffVo> supportstaffid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public AdminVo getDepartmentadminid() {
		return departmentadminid;
	}

	public void setDepartmentadminid(AdminVo departmentadminid) {
		this.departmentadminid = departmentadminid;
	}

	public List<SpecializationVo> getSpecializationid() {
		return specializationid;
	}

	public void setSpecializationid(List<SpecializationVo> specializationid) {
		this.specializationid = specializationid;
	}

	public List<DoctorVo> getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(List<DoctorVo> doctorid) {
		this.doctorid = doctorid;
	}

	public List<NurseVo> getNurseid() {
		return nurseid;
	}

	public void setNurseid(List<NurseVo> nurseid) {
		this.nurseid = nurseid;
	}

	public List<Support_StaffVo> getSupportstaffid() {
		return supportstaffid;
	}

	public void setSupportstaffid(List<Support_StaffVo> supportstaffid) {
		this.supportstaffid = supportstaffid;
	}
	
}
