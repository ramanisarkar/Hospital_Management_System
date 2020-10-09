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
@Table(name = "BloodManage")

public class BloodManageVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "BloodGroup")
	private String bloodgroup;
	
	@Column(name = "NumberOfBags")
	private int numberofbags;

	@Column(name = "DonationCampAddres")
	private String donationcampaddres;
	
	@Column(name = "City")
	private String city;
	
	@Column(name = "State")	
	private String state;

	@Column(name = "Country")
	private String country;
	
	@Column(name = "ZipCode")
	private String zipcode;
	
	@Column(name = "LastDonationDate")
	private java.sql.Date lastdonationdate;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="Donorid")
	private BloodDonorVo donorid;

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

	public String getDonationcampaddres() {
		return donationcampaddres;
	}

	public void setDonationcampaddres(String donationcampaddres) {
		this.donationcampaddres = donationcampaddres;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public java.sql.Date getLastdonationdate() {
		return lastdonationdate;
	}

	public void setLastdonationdate(java.sql.Date lastdonationdate) {
		this.lastdonationdate = lastdonationdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public BloodDonorVo getDonorid() {
		return donorid;
	}

	public void setDonorid(BloodDonorVo donorid) {
		this.donorid = donorid;
	}
}
