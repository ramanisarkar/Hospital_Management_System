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
@Table(name = "Out_Patient")
public class OutPatientVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "FirstName")
	private String firstname;
	
	@Column(name = "MidalName")
	private String midalname;
	
	@Column(name = "LastName")
	private String lastname;
	
	@Column(name = "DateOfBirth")
	private String birthdate;
	
	@Column(name = "BloodGroup")
	private String bloodgroup;
	
	@Column(name = "Gender")
	private String gender;
	
	@Column(name = "HomeAddress")
	private String homeeaddrss;
	
	@Column(name = "HomeCity")
	private String homecity;
	
	@Column(name = "HomeState")	
	private String homestate;

	@Column(name = "HomeCountry")
	private String homecountry;
	
	@Column(name = "HomeZipCode")
	private String homezipcode;

	@Column(name = "MobileCountryCode")
	private String mobilecountrycode;
	
	@Column(name = "MobileNo")
	private String mobileno;
	
	@Column(name = "PhoneNo")
	private String phoneno;

	@Column(name = "Email")
	private String email;

	@Column(name = "UserName")
	private String username;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "ProfileImage")
	private String profileimage;

	@Column(name = "Symtoms")
	private String symptoms;
	
	@Column(name = "DiagnosisReport")
	private String diagnosis;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;

	@ManyToOne
	@JoinColumn(name="PatientRegistretionId")
	private PatientRegistretionVo patientregistreation;
	
	@ManyToOne
	@JoinColumn(name="DoctorId")
	private DoctorVo doctorid;
	
	@OneToMany( mappedBy = "patientloginid", cascade = CascadeType.REMOVE)
	private List<LoginVO> loginid;
	
}
