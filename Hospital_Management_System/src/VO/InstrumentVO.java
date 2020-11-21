package VO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Instrument",uniqueConstraints = @UniqueConstraint(name = "unique", columnNames =  "InstrumentCode"))
public class InstrumentVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;
	
	@Column(name = "InstrumentCode")
	private int instrumentcode;
	
	@Column(name = "InstrumentName")
	private String instrumentname;
	
	@Column(name = "InstrumentChargesType")
	private String instrumentchargestype;

	@Column(name = "InstrumentCharge")
	private float instrumentcharge;

	@Column(name = "InstrumentDescription")
	private String instrumentdescription;

	@Column(name = "FirmCode")
	private int firmcode;

	@Column(name = "FirmName")
	private String firmname;

	@Column(name = "FirmAddress")
	private String firmaddress;

	@Column(name = "FirmContact")
	private String firmcontact;

	@Column(name = "AssetDescription")
	private String assetdescription;

	@Column(name = "AssetQuantity")
	private int AssetQuantity;
	
	@Column(name = "AssetPrice")
	private float assetprice;

	@Column(name = "AssetClass")
	private String assetclass;
	
	@Column(name = "InvoiceSerial")
	private int invoiceserial;
	
	@Column(name = "InvoiceAcquire")
	private int InvoiceAcquire;
	
	@Column(name = "AssetID")
	private int AssetID;
	
	@Column(name = "Stock")
	private int Stock;
	
	@Column(name = "JoiningDate")
	private String joiningdate;
	
	@ManyToOne
	@JoinColumn(name="Adminid")
	private AdminVo adminid;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInstrumentcode() {
		return instrumentcode;
	}

	public void setInstrumentcode(int instrumentcode) {
		this.instrumentcode = instrumentcode;
	}

	public String getInstrumentname() {
		return instrumentname;
	}

	public void setInstrumentname(String instrumentname) {
		this.instrumentname = instrumentname;
	}

	public String getInstrumentchargestype() {
		return instrumentchargestype;
	}

	public int getStock() {
		return Stock;
	}

	public void setStock(int stock) {
		Stock = stock;
	}

	public void setInstrumentchargestype(String instrumentchargestype) {
		this.instrumentchargestype = instrumentchargestype;
	}

	public float getInstrumentcharge() {
		return instrumentcharge;
	}

	public void setInstrumentcharge(float instrumentcharge) {
		this.instrumentcharge = instrumentcharge;
	}

	public String getInstrumentdescription() {
		return instrumentdescription;
	}

	public void setInstrumentdescription(String instrumentdescription) {
		this.instrumentdescription = instrumentdescription;
	}

	public int getFirmcode() {
		return firmcode;
	}

	public void setFirmcode(int firmcode) {
		this.firmcode = firmcode;
	}

	public String getFirmname() {
		return firmname;
	}

	public void setFirmname(String firmname) {
		this.firmname = firmname;
	}

	public String getFirmaddress() {
		return firmaddress;
	}

	public void setFirmaddress(String firmaddress) {
		this.firmaddress = firmaddress;
	}

	public String getFirmcontact() {
		return firmcontact;
	}

	public void setFirmcontact(String firmcontact) {
		this.firmcontact = firmcontact;
	}

	public String getAssetdescription() {
		return assetdescription;
	}

	public void setAssetdescription(String assetdescription) {
		this.assetdescription = assetdescription;
	}

	public int getAssetQuantity() {
		return AssetQuantity;
	}

	public void setAssetQuantity(int assetQuantity) {
		AssetQuantity = assetQuantity;
	}

	public float getAssetprice() {
		return assetprice;
	}

	public void setAssetprice(float assetprice) {
		this.assetprice = assetprice;
	}

	public String getAssetclass() {
		return assetclass;
	}

	public void setAssetclass(String assetclass) {
		this.assetclass = assetclass;
	}

	public int getInvoiceserial() {
		return invoiceserial;
	}

	public void setInvoiceserial(int invoiceserial) {
		this.invoiceserial = invoiceserial;
	}

	public int getInvoiceAcquire() {
		return InvoiceAcquire;
	}

	public void setInvoiceAcquire(int invoiceAcquire) {
		InvoiceAcquire = invoiceAcquire;
	}

	public int getAssetID() {
		return AssetID;
	}

	public void setAssetID(int assetID) {
		AssetID = assetID;
	}

	public AdminVo getAdminid() {
		return adminid;
	}

	public void setAdminid(AdminVo adminid) {
		this.adminid = adminid;
	}

	public String getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
}
