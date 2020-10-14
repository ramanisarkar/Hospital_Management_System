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
@Table(name = "Event")
public class EventVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "EventName")
	private String eventname;
	
	@Column(name = "Title")
	private String title;

	@Column(name = "Comment")
	private String comment;
	
	@Column(name = "StartDate")
	private String startdate;
	
	@Column(name = "EndDate")	
	private String enddate;

	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@OneToMany( mappedBy = "eventid" , cascade = CascadeType.REMOVE)
	private List<EventForVo> eventforid;
	
	private int aid;
	private String eventfor , updateevent;
	
	public String getUpdateevent() {
		return updateevent;
	}

	public void setUpdateevent(String updateevent) {
		this.updateevent = updateevent;
	}

	public List<EventForVo> getEventforid() {
		return eventforid;
	}

	public void setEventforid(List<EventForVo> eventforid) {
		this.eventforid = eventforid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getEventfor() {
		return eventfor;
	}

	public void setEventfor(String eventfor) {
		this.eventfor = eventfor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEventname() {
		return eventname;
	}

	public void setEventname(String eventname) {
		this.eventname = eventname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
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
	
}
