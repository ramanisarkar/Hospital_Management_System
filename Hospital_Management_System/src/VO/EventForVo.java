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
@Table(name = "EventFor")
public class EventForVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "EventFor")
	private String eventfor;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;
	
	@ManyToOne
	@JoinColumn(name="EventId")
	private EventVo eventid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEventfor() {
		return eventfor;
	}

	public void setEventfor(String eventfor) {
		this.eventfor = eventfor;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public EventVo getEventid() {
		return eventid;
	}

	public void setEventid(EventVo eventid) {
		this.eventid = eventid;
	}
	
}
