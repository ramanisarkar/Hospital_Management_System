package VO;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.NotFound;

@Entity
@Table(name = "UserRolePermissions")
public class ParsonRollVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "Owndata",nullable = false)
	private boolean owndata;

	@Column(name = "ViewData" , nullable = false)
	private boolean view;

	@Column(name = "AddData",nullable = false)
	private boolean add;

	@Column(name = "EditData",nullable = false)
	private boolean edit;

	@Column(name = "DeleteData",nullable = false)
	private boolean delete;

	@Column(name = "RollName")
	private String rollname;

	@Column(name = "JoiningDate")
	private Timestamp joiningdate;

	@ManyToOne
	@JoinColumn(name = "Adminid")
	private AdminVo adminid;

	@ManyToOne
	@JoinColumn(name = "UserId")
	private UserRoleVo userid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isOwndata() {
		return owndata;
	}

	public void setOwndata(boolean owndata) {
		this.owndata = owndata;
	}

	public boolean isView() {
		return view;
	}

	public void setView(boolean view) {
		this.view = view;
	}

	public boolean isAdd() {
		return add;
	}

	public void setAdd(boolean add) {
		this.add = add;
	}

	public boolean isEdit() {
		return edit;
	}

	public void setEdit(boolean edit) {
		this.edit = edit;
	}

	public boolean isDelete() {
		return delete;
	}

	public void setDelete(boolean delete) {
		this.delete = delete;
	}

	public String getRollname() {
		return rollname;
	}

	public void setRollname(String rollname) {
		this.rollname = rollname;
	}

	public Timestamp getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Timestamp joiningdate) {
		this.joiningdate = joiningdate;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public UserRoleVo getUserid() {
		return userid;
	}

	public void setUserid(UserRoleVo userid) {
		this.userid = userid;
	}
}
