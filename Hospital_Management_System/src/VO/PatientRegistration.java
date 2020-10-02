package VO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "Patient", uniqueConstraints = @UniqueConstraint(name = "unique", columnNames={"Email", "UserName" ,"PatientId"}))
public class PatientRegistration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "PatientId")
	private String patientid;
	
	@Column(name = "FirstName")
	private String firstname;
	
	@Column(name = "MidalName")
	private String midalname;
	
	@Column(name = "LastName")
	private String lastname;
	
	@Column(name = "DateOfBirth")
	private java.sql.Date birthdate;
	
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
	
	@Column(name = "DiagnosisReport")
	private String diagnosisreport;
	

}
