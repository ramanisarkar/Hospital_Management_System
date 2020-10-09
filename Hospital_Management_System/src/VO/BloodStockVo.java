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
@Table(name = "BloodStock")
public class BloodStockVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "BloodGroup")
	private String bloodgroup;
	
	@Column(name = "NumberOfBags")
	private int numberofbags;
	
	@Column(name = "LastJoiningDate")
	private String Lastjoiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public int getNumberofbags() {
		return numberofbags;
	}

	public void setNumberofbags(int numberofbags) {
		this.numberofbags = numberofbags;
	}

	public String getLastjoiningdate() {
		return Lastjoiningdate;
	}

	public void setLastjoiningdate(String lastjoiningdate) {
		Lastjoiningdate = lastjoiningdate;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
