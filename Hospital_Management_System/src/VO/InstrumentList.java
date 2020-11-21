package VO;

public class InstrumentList {
	
	int id;
	String patientname ,instrumentUpdate,instrument,assigndate ,enddate , type;
	float total, charege  ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getInstrumentUpdate() {
		return instrumentUpdate;
	}
	public void setInstrumentUpdate(String instrumentUpdate) {
		this.instrumentUpdate = instrumentUpdate;
	}
	public String getInstrument() {
		return instrument;
	}
	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}
	public String getAssigndate() {
		return assigndate;
	}
	public void setAssigndate(String assigndate) {
		this.assigndate = assigndate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getCharege() {
		return charege;
	}
	public void setCharege(float charege) {
		this.charege = charege;
	}
	
}