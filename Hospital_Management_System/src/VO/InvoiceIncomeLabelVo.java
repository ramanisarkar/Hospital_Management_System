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
@Table(name = "InvoiceIncomeLabel")
public class InvoiceIncomeLabelVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "IncomeAmount")
	private float incomeamount;

	@Column(name = "IncomeLabel")
	private String incomelabel;
	
	@ManyToOne
	@JoinColumn(name = "InvoiceIncomeId")
	private InvoiceIncomeVo invoiceincomeid;
	
	@ManyToOne
	@JoinColumn(name = "AdminId")
	private AdminVo adminid ;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getIncomeamount() {
		return incomeamount;
	}

	public void setIncomeamount(float incomeamount) {
		this.incomeamount = incomeamount;
	}

	public String getIncomelabel() {
		return incomelabel;
	}

	public void setIncomelabel(String incomelabel) {
		this.incomelabel = incomelabel;
	}

	public InvoiceIncomeVo getInvoiceincomeid() {
		return invoiceincomeid;
	}

	public void setInvoiceincomeid(InvoiceIncomeVo invoiceincomeid) {
		this.invoiceincomeid = invoiceincomeid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
}
