package Com;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

import DAO.AllDataCountDao;
import DAO.InvoiceHospitalDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientRegistreationDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.CommonFiledVo;
import VO.InvoiceCollectVo;
import VO.InvoiceExpenseLabelVo;
import VO.InvoiceExpenseVo;
import VO.InvoiceHospitalVo;
import VO.InvoiceIncomeLabelVo;
import VO.InvoiceIncomeVo;
import VO.PatientChargesHistoryVo;
import VO.PatientRegistretionVo;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.j2ee.servlets.JExcelApiServlet;
import net.sf.jasperreports.view.JasperViewer;

import java.io.*;
import java.util.*;

/**
 * Servlet implementation class InvoiceManagement
 */
@WebServlet("/InvoiceManagement")
@MultipartConfig
public class InvoiceManagement extends HttpServlet implements DateConvator {
	private static final long serialVersionUID = 1L;
	private static String invoiceUpdate = "";
	private static String invoice = "invoiceAdminId";
	private String DOWNLOAD_FILE_NAME = "REPORT.pdf";
	private String FILE_TYPE = "application/pdf";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceManagement() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insert")) {
			HttpSession session = request.getSession();
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute(invoice, adminid);
			patientRegistrationList(request);
			response.sendRedirect("Admin_Invoice_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("invoiceId")) {
			invoiceIdGenerate(response);
		}
		if (flag.equalsIgnoreCase("patientChageHistory")) {
			patientChageHistory(request, response);
		}
		if (flag.equalsIgnoreCase("invoiceList")) {
			invoiceList(request, response);
		}
		if (flag.equalsIgnoreCase("invoiceEdit")) {
			invoiceEdit(request, response);
		}
		if (flag.equalsIgnoreCase("incomeList")) {
			incomeList(request, response);
		}
		if (flag.equalsIgnoreCase("expenseList")) {
			expenseList(request, response);
		}
		if (flag.equalsIgnoreCase("invoicePdf")) {
			jasperPdf(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("invoiceInsert")) {
			invoiceInsert(request);
			invoiceIdGenerate(response);
		}
		if (flag.equalsIgnoreCase("insertIncome")) {
			incomeInsert(request, response);
		}
		if (flag.equalsIgnoreCase("expenseInsert")) {
			expenseInsert(request, response);
		}
	}

	private void patientRegistrationList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("invoiceAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void invoiceIdGenerate(HttpServletResponse response) {
		try {
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceHospitalVo> getlastrecord = invoiceHospitalDao.getlastrecord();

			SimpleDateFormat yl2d = new SimpleDateFormat("yyMM");
			String yearoflastdigital = yl2d.format(t1);
			String invoicId = null;
			if (getlastrecord.isEmpty()) {
				invoicId = yearoflastdigital.concat("0001");
			} else if (!getlastrecord.isEmpty()) {
				String id = String.valueOf(getlastrecord.get(0).getInvoiceid());
				String removeFirst = id.substring(4);
				int a1 = Integer.parseInt(removeFirst);
				a1++;
				int c = a1;
				String s23 = String.valueOf(c);
				if (c >= 1 && c < 10) {
					invoicId = yearoflastdigital.concat("000").concat(s23);
				} else if (c >= 10 && c < 100) {
					invoicId = yearoflastdigital.concat("00").concat(s23);
				} else if (c >= 100) {
					invoicId = yearoflastdigital.concat("0").concat(s23);
				} else if (c >= 1000) {
					invoicId = yearoflastdigital.concat(s23);
				}
			}
			ArrayList<CommonFiledVo> list = new ArrayList<>();
			CommonFiledVo common = new CommonFiledVo();
			common.setField1(invoicId);
			common.setField2(invoiceUpdate);
			list.add(common);

			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void patientChageHistory(HttpServletRequest request, HttpServletResponse response) {
		try {
			int patientId = Integer.parseInt(request.getParameter("patientId"));

			PatientRegistretionVo registretionVo = new PatientRegistretionVo();
			registretionVo.setId(patientId);

			PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
			chargesHistoryVo.setPatientid(registretionVo);
			chargesHistoryVo.setPramenttype(true);

			PatientChargesHistoryDao patientChargesHistoryDao = new PatientChargesHistoryDao();
			ArrayList<PatientChargesHistoryVo> patientChargesHistory = patientChargesHistoryDao
					.editPatientHistory(chargesHistoryVo);

			ArrayList<CommonFiledVo> list = new ArrayList<>();
			for (PatientChargesHistoryVo charges : patientChargesHistory) {
				int id = charges.getId();
				String type = charges.getChargetype();
				String title = charges.getTitle();
				String patientname = charges.getPatientid().getFirstname();
				Date date = charges.getDate();
				String date1 = date.toString();
				String unit = charges.getUnit();
				float amount = charges.getAmount();
				float fund = charges.getPatientid().getFund();
				CommonFiledVo common = new CommonFiledVo();
				common.setName(patientname);
				common.setDate(date1);
				common.setId(id);
				common.setPatientID(patientId);
				common.setPrice(amount);
				common.setTitle(title);
				common.setDiscription(unit);
				common.setSubtotal(fund);
				common.setType(type);
				list.add(common);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceInsert(HttpServletRequest request) {
		try {

			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");

			int patientId = Integer.parseInt(request.getParameter("invoice_patientId"));
			String invoiceTitle = request.getParameter("invice_title");
			float subtotalAmount = Float.parseFloat(request.getParameter("invoice_amount"));
			float adjustmentAmount = Float.parseFloat(request.getParameter("adjustment_amount"));
			float totalAmount = Float.parseFloat(request.getParameter("invoice_total_amount"));
			String date = request.getParameter("invoice_date");
			String startdate = sdfdateconvert.format(sdfdate.parse(date));
			java.sql.Date allocation = java.sql.Date.valueOf(startdate);
			String comment = request.getParameter("comments");
			int invoiceId = Integer.parseInt(request.getParameter("invoice_number"));
			String[] chargesId = request.getParameterValues("patientchargid[]");

			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientId);

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setStatus("Unpaid");
			invoiceHospitalVo.setPaidamount(0.00f);
			invoiceHospitalVo.setTotalamount(totalAmount);
			invoiceHospitalVo.setAdjustmentamount(adjustmentAmount);
			invoiceHospitalVo.setAdminid(adminVo);
			invoiceHospitalVo.setComments(comment);
			invoiceHospitalVo.setDate(allocation);
			invoiceHospitalVo.setInvoiceid(invoiceId);
			invoiceHospitalVo.setInvoicetitle(invoiceTitle);
			invoiceHospitalVo.setPatientid(patientRegistretionVo);
			invoiceHospitalVo.setJoiningdate(timestamp);
			invoiceHospitalVo.setSubtotalamount(subtotalAmount);

			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			String check = invoiceHospitalDao.insertInvoice(invoiceHospitalVo);

			if (check.equalsIgnoreCase("true")) {
				for (int i = 0; i < chargesId.length; i++) {
					int id = Integer.parseInt(chargesId[i]);

					PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
					chargesHistoryVo.setId(id);

					PatientChargesHistoryDao patientChargesHistoryDao = new PatientChargesHistoryDao();
					patientChargesHistoryDao.updateCharges(chargesHistoryVo);

					InvoiceCollectVo collectVo = new InvoiceCollectVo();
					collectVo.setChargeid(chargesHistoryVo);
					collectVo.setInvoiceid(invoiceHospitalVo);

					invoiceHospitalDao.insertInvoiceChages(collectVo);
				}
				AllDataCountVo allDataCountVo = new AllDataCountVo();
				allDataCountVo.setAdminid(adminVo);
				AllDataCountDao allDataCountDao = new AllDataCountDao();
				allDataCountDao.increaseData(allDataCountVo, "invoice");
				invoiceUpdate = "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setAdminid(adminVo);

			InvoiceHospitalDao hospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceHospitalVo> invoiceList = hospitalDao.listOfInvoice(invoiceHospitalVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (InvoiceHospitalVo invoice : invoiceList) {
				CommonFiledVo common = new CommonFiledVo();
				common.setId(invoice.getId());
				common.setId2(invoice.getInvoiceid());
				common.setField1(invoice.getPatientid().getPatientid());
				common.setField2(invoice.getInvoicetitle());
				common.setSubtotal(invoice.getSubtotalamount());
				common.setDiscount(invoice.getAdjustmentamount());
				common.setPrice(invoice.getTotalamount());
				common.setFloatfield1(invoice.getPaidamount());
				common.setType(invoice.getStatus());
				common.setField3(invoiceUpdate);
				list.add(common);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int inpvoiceId = Integer.parseInt(request.getParameter("invoiceId"));

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setId(inpvoiceId);

			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceHospitalVo> invoiceList = invoiceHospitalDao.editInvoice(invoiceHospitalVo);

			ArrayList<CommonFiledVo> list = new ArrayList<>();
			for (InvoiceHospitalVo invoice : invoiceList) {
				commonFiledVo(list, invoice);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void commonFiledVo(ArrayList<CommonFiledVo> list, InvoiceHospitalVo invoice) {
		CommonFiledVo common = new CommonFiledVo();
		common.setId(invoice.getId());
		common.setId2(invoice.getInvoiceid());
		common.setField1(invoice.getPatientid().getPatientid());
		common.setField2(invoice.getInvoicetitle());
		common.setSubtotal(invoice.getSubtotalamount());
		common.setDiscount(invoice.getAdjustmentamount());
		common.setPrice(invoice.getTotalamount());
		common.setFloatfield1(invoice.getPaidamount());
		common.setType(invoice.getStatus());
		common.setPatientID(invoice.getPatientid().getId());
		list.add(common);
	}

	private void incomeInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");
			int patinetId = Integer.parseInt(request.getParameter("add_income_patientId"));
			String status = request.getParameter("add_income_payment_status");
			String paymentMethod = request.getParameter("payment_method");
			String paymentDetails = request.getParameter("payment_description");
			String date = request.getParameter("invoice_income_date");
			String startdate = sdfdateconvert.format(sdfdate.parse(date));
			java.sql.Date allocation = java.sql.Date.valueOf(startdate);
			String check = request.getParameter("status");

			String[] incomeAmount = request.getParameterValues("income_amount[]");
			String[] incomeLable = request.getParameterValues("income_entry[]");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patinetId);

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();

			InvoiceIncomeVo invoiceIncomeVo = new InvoiceIncomeVo();
			invoiceIncomeVo.setAdminid(adminVo);
			invoiceIncomeVo.setDate(allocation);
			invoiceIncomeVo.setJoiningdate(timestamp);
			invoiceIncomeVo.setPatientid(patientRegistretionVo);
			invoiceIncomeVo.setPaymentdetails(paymentDetails);
			invoiceIncomeVo.setPaymentmethod(paymentMethod);
			invoiceIncomeVo.setStatus(status);
			int invoiceId = 0;
			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			boolean verify = false;
			if (check.equalsIgnoreCase("invoiceIncome")) {
				invoiceId = Integer.parseInt(request.getParameter("invoiceid"));
				invoiceHospitalVo.setId(invoiceId);
				invoiceIncomeVo.setInvoiceid(invoiceHospitalVo);
				verify = true;
			}
			String income = invoiceHospitalDao.insertInvoiceIncome(invoiceIncomeVo);
			if (income.equalsIgnoreCase("true")) {
				if (verify) {
					ArrayList<InvoiceHospitalVo> invoiceList = invoiceHospitalDao.editInvoice(invoiceHospitalVo);
					float invoiceAmount = invoiceList.get(0).getTotalamount();
					float paidamount = invoiceList.get(0).getPaidamount();
					float amount1 = Float.parseFloat(incomeAmount[0]);
					if (invoiceAmount <= amount1) {
						paidamount += amount1;
						invoiceHospitalVo.setStatus("Paid");
						invoiceHospitalVo.setId(invoiceId);
						invoiceHospitalVo.setTotalamount(0);
						invoiceHospitalVo.setPaidamount(paidamount);
						invoiceHospitalDao.UpdateInvoice(invoiceHospitalVo);
					} else {
						invoiceAmount = invoiceAmount - amount1;
						paidamount += amount1;
						invoiceHospitalVo.setStatus("Unpaid");
						invoiceHospitalVo.setId(invoiceId);
						invoiceHospitalVo.setPaidamount(paidamount);
						invoiceHospitalVo.setTotalamount(invoiceAmount);
						invoiceHospitalDao.UpdateInvoice(invoiceHospitalVo);
					}
				}

				for (int i = 0; i < incomeLable.length; i++) {
					float amount = Float.parseFloat(incomeAmount[i]);
					String lable = incomeLable[i];
					InvoiceIncomeLabelVo invoiceIncomeLabelVo = new InvoiceIncomeLabelVo();
					invoiceIncomeLabelVo.setIncomeamount(amount);
					invoiceIncomeLabelVo.setIncomelabel(lable);
					invoiceIncomeLabelVo.setAdminid(adminVo);
					invoiceIncomeLabelVo.setInvoiceincomeid(invoiceIncomeVo);

					invoiceHospitalDao.insertInvoiceIncomeLabel(invoiceIncomeLabelVo);

				}
				invoiceUpdate = "true";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(invoiceUpdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void incomeList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InvoiceIncomeLabelVo invoiceIncomeLabelVo = new InvoiceIncomeLabelVo();
			invoiceIncomeLabelVo.setAdminid(adminVo);

			InvoiceHospitalDao hospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceIncomeLabelVo> incomeList = hospitalDao.listOfInvoiceIncome(invoiceIncomeLabelVo);
			ArrayList<CommonFiledVo> list = new ArrayList<>();
			for (InvoiceIncomeLabelVo invoice : incomeList) {
				Date date = invoice.getInvoiceincomeid().getDate();
				String assigndate = date.toString();
				String date1 = sdfdate.format(sdfdateconvert.parse(assigndate));
				CommonFiledVo common = new CommonFiledVo();
				common.setId(invoice.getId());
				common.setField1(invoice.getInvoiceincomeid().getPatientid().getFirstname().concat(" ")
						.concat(invoice.getInvoiceincomeid().getPatientid().getLastname()));
				common.setField2(invoice.getInvoiceincomeid().getPatientid().getPatientid());
				common.setPrice(invoice.getIncomeamount());
				common.setType(invoice.getInvoiceincomeid().getPaymentmethod());
				try {
					common.setId2(invoice.getInvoiceincomeid().getInvoiceid().getInvoiceid());
				} catch (Exception e) {
					common.setId2(0);
				}
				common.setField3(date1);

				list.add(common);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void expenseInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");
			String supplierName = request.getParameter("party_name");
			String status = request.getParameter("payment_status");
			String date = request.getParameter("invoice_expense_date");
			String startdate = sdfdateconvert.format(sdfdate.parse(date));
			java.sql.Date allocation = java.sql.Date.valueOf(startdate);
			String[] expenseAmount = request.getParameterValues("expense_amount[]");
			String[] expenseLable = request.getParameterValues("expense_entry[]");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			float total = 0;
			for (int i = 0; i < expenseAmount.length; i++) {
				total += Float.parseFloat(expenseAmount[i]);
			}
			InvoiceExpenseVo invoiceExpenseVo = new InvoiceExpenseVo();
			invoiceExpenseVo.setAdminid(adminVo);
			invoiceExpenseVo.setDate(allocation);
			invoiceExpenseVo.setJoiningdate(timestamp);
			invoiceExpenseVo.setStatus(status);
			invoiceExpenseVo.setTotal(total);
			invoiceExpenseVo.setSuppliername(supplierName);

			InvoiceHospitalDao hospitalDao = new InvoiceHospitalDao();

			String expense = hospitalDao.insertExpense(invoiceExpenseVo);
			if (expense.equalsIgnoreCase("true")) {
				for (int i = 0; i < expenseAmount.length; i++) {
					float amount = Float.parseFloat(expenseAmount[i]);
					String lable = expenseLable[i];
					invoiceExpenseLabel(adminVo, invoiceExpenseVo, hospitalDao, amount, lable);

				}
				invoiceUpdate = "true";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(invoiceUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceExpenseLabel(AdminVo adminVo, InvoiceExpenseVo invoiceExpenseVo, InvoiceHospitalDao hospitalDao,
			float amount, String lable) {
		InvoiceExpenseLabelVo invoiceExpenseLabelVo = new InvoiceExpenseLabelVo();
		invoiceExpenseLabelVo.setAdminid(adminVo);
		invoiceExpenseLabelVo.setExpenseamount(amount);
		invoiceExpenseLabelVo.setExpenselabel(lable);
		invoiceExpenseLabelVo.setInvocieexpenseid(invoiceExpenseVo);

		hospitalDao.insertExpenseLabel(invoiceExpenseLabelVo);
	}

	private void expenseList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InvoiceExpenseVo invoiceExpenseVo = new InvoiceExpenseVo();
			invoiceExpenseVo.setAdminid(adminVo);

			InvoiceHospitalDao hospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceExpenseVo> incomeList = hospitalDao.listOfInvoiceExpense(invoiceExpenseVo);
			ArrayList<CommonFiledVo> list = new ArrayList<>();
			for (InvoiceExpenseVo invoice : incomeList) {
				Date date = invoice.getDate();
				String assigndate = date.toString();
				String date1 = sdfdate.format(sdfdateconvert.parse(assigndate));
				CommonFiledVo common = new CommonFiledVo();
				common.setId(invoice.getId());
				common.setField1(invoice.getSuppliername());
				common.setPrice(invoice.getTotal());
				common.setField3(date1);

				list.add(common);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();

//		    try {
//
//		    	reportPath = request.getServletContext().getRealPath
//
//		    	logoFilePath = request.getServletContext().getRealPath("reports") + "\\leaf_banner_gray.png";
//		    	
//		    	reportParameters = new HashMap<String, Object>();
//		        reportParameters.put("paramLogFilePath", logoFilePath);
//		        reportParameters.put("ReportTitle", "List of Contacts");
//		        reportParameters.put("Author", "Prepared By Manisha");
//		        
//		        jasperDesign = JRXmlLoader.load(reportPath);
//		        jasperReport = JasperCompileManager.compileReport(jasperDesign);
//		        
//		        /**
//		         * Passing ReportTitle and Author as parameters
//		         */
//		       
//		        
//		        JasperFillManager.fillReportToFile(
//		        		reportPath, reportParameters);
//    	      
//			} catch (Exception e) {
//				
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void jasperPdf(HttpServletRequest request, HttpServletResponse response) {
		try {

			int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setId(invoiceId);

			InvoiceCollectVo invoiceCollectVo = new InvoiceCollectVo();
			invoiceCollectVo.setInvoiceid(invoiceHospitalVo);

			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceCollectVo> invoiceChagesList = invoiceHospitalDao.listOfInvoiceCharges(invoiceCollectVo);

			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();

			int i = 1;
			for (InvoiceCollectVo invoice : invoiceChagesList) {
				CommonFiledVo common = new CommonFiledVo();
				common.setId(i);
				common.setType(invoice.getChargeid().getChargetype());
				common.setTitle(invoice.getChargeid().getTitle());
				common.setChargedate(invoice.getChargeid().getDate());
				common.setField1(invoice.getChargeid().getUnit());
				common.setSubtotal(invoice.getChargeid().getAmount());
				common.setDiscount(invoice.getChargeid().getDiscountamount());
				common.setPrice(invoice.getChargeid().getAmount());
				list.add(common);
				i++;
			}
			float grandTotal = (invoiceChagesList.get(0).getInvoiceid().getSubtotalamount())
					- (invoiceChagesList.get(0).getInvoiceid().getAdjustmentamount()
							+ invoiceChagesList.get(0).getInvoiceid().getPaidamount());
			String staticmassege = "";
			if(grandTotal>=50000f) {
				staticmassege="Bank Transfer Ac.no: 80121154486488";
			}
			else {
				staticmassege="UPI Transfer: pno@jbkjjklUPI";
			}

			String reportPath = request.getServletContext().getRealPath("JasperReport") + "\\Blank_A4_2.jrxml";
			InputStream input = new FileInputStream(new File(reportPath));

			JasperDesign jasperDesign = JRXmlLoader.load(input);
			JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

			JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(list);
			Map<String, Object> reportParameters = new HashMap<>();
			reportParameters.put("patientName", invoiceChagesList.get(0).getChargeid().getPatientid().getFirstname());
			reportParameters.put("patientAddress",
					invoiceChagesList.get(0).getChargeid().getPatientid().getHomeeaddrss());
			reportParameters.put("Adminaddress", invoiceChagesList.get(0).getInvoiceid().getAdminid().getAddress());
			reportParameters.put("adminEmail", invoiceChagesList.get(0).getInvoiceid().getAdminid().getEmail());
			reportParameters.put("adminphone", invoiceChagesList.get(0).getInvoiceid().getAdminid().getCon_no());
			reportParameters.put("Invoiceidate", invoiceChagesList.get(0).getInvoiceid().getDate());
			reportParameters.put("invoicestatus", invoiceChagesList.get(0).getInvoiceid().getStatus());
			reportParameters.put("Invoicenumber", invoiceChagesList.get(0).getInvoiceid().getInvoiceid());

			reportParameters.put("subtotalamount", invoiceChagesList.get(0).getInvoiceid().getSubtotalamount());
			reportParameters.put("adjustmentamount", invoiceChagesList.get(0).getInvoiceid().getAdjustmentamount());
			reportParameters.put("grandtotal", grandTotal);
			reportParameters.put("paidamount", invoiceChagesList.get(0).getInvoiceid().getPaidamount());
			reportParameters.put("mannytransfer",staticmassege);
			reportParameters.put("CollectionBeenParamitar", itemsJRBean);

			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParameters,
					new JREmptyDataSource());
			
			OutputStream out = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, out);

			String outputFile = getServletContext().getRealPath("\\JasperReport\\" + "report.pdf");

			OutputStream outputStream = new FileOutputStream(new File(outputFile));
			JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);


		} catch (JRException ex) {
			Logger.getLogger(JExcelApiServlet.class.getName()).log(Level.TRACE, null, ex);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
