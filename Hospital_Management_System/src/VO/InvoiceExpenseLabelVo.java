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
@Table(name = "InvoiceExpanseLabel")
public class InvoiceExpenseLabelVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	@Column(name = "ExpenseAmount")
	private float expenseamount;

	@Column(name = "expenseLabel")
	private String expenselabel;
	
	@ManyToOne
	@JoinColumn(name = "InvocieExpenseId")
	private InvoiceExpenseVo invocieexpenseid;
	
	@ManyToOne
	@JoinColumn(name = "AdminId")
	private AdminVo adminid ;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getExpenseamount() {
		return expenseamount;
	}

	public void setExpenseamount(float expenseamount) {
		this.expenseamount = expenseamount;
	}

	public String getExpenselabel() {
		return expenselabel;
	}

	public void setExpenselabel(String expenselabel) {
		this.expenselabel = expenselabel;
	}

	public InvoiceExpenseVo getInvocieexpenseid() {
		return invocieexpenseid;
	}

	public void setInvocieexpenseid(InvoiceExpenseVo invocieexpenseid) {
		this.invocieexpenseid = invocieexpenseid;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}
	
}
