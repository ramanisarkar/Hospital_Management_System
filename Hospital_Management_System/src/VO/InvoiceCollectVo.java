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
@Table(name = "InvoicePatientCharges")
public class InvoiceCollectVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="InvoiceId")
	private InvoiceHospitalVo invoiceid;
	
	@ManyToOne
	@JoinColumn(name = "PatientChageId")
	private PatientChargesHistoryVo chargeid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public InvoiceHospitalVo getInvoiceid() {
		return invoiceid;
	}

	public void setInvoiceid(InvoiceHospitalVo invoiceid) {
		this.invoiceid = invoiceid;
	}

	public PatientChargesHistoryVo getChargeid() {
		return chargeid;
	}

	public void setChargeid(PatientChargesHistoryVo chargeid) {
		this.chargeid = chargeid;
	}
	
}
