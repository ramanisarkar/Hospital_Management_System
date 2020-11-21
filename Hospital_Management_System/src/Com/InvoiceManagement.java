package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.InvoiceHospitalDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientRegistreationDao;
import VO.AdminVo;
import VO.CommonFiledVo;
import VO.InvoiceHospitalVo;
import VO.PatientChargesHistoryVo;
import VO.PatientRegistretionVo;
import VO.PrescriptionVo;

/**
 * Servlet implementation class InvoiceManagement
 */
@WebServlet("/InvoiceManagement")
@MultipartConfig
public class InvoiceManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String invoiceUpdate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------------");
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insert")) {
			HttpSession session = request.getSession();
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("invoiceAdminid", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Invoice_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("invoiceId")) {
			invoiceIdGenerate(request, response);
		}
		if (flag.equalsIgnoreCase("patientChageHistory")) {
			patientChageHistory(request, response);
		}
		if (flag.equalsIgnoreCase("invoiceList")) {
			invoiceList(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------sasasa--------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("invoiceInsert")) {
			invoiceInsert(request, response);
		}
	}

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("invoiceAdminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		System.out.println(patientRegistration.size());
		System.out.println(patientRegistration.get(0).getFirstname());
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void invoiceIdGenerate(HttpServletRequest request, HttpServletResponse response) {
		try {
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceHospitalVo> getlastrecord = invoiceHospitalDao.getlastrecord();
			SimpleDateFormat yl2d = new SimpleDateFormat("yyMM");
			String yearoflastdigital = yl2d.format(t1);
			String invoicId = null;
			if (getlastrecord.isEmpty() == true) {
				invoicId = yearoflastdigital.concat("0001");
			} else if (getlastrecord.isEmpty() == false) {
				String id = String.valueOf(getlastrecord.get(0).getInvoiceID());
				String removeFirst = id.substring(3);

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
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(invoicId);
			}

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
			chargesHistoryVo.setPramenttype("UnPaid");

			PatientChargesHistoryDao patientChargesHistoryDao = new PatientChargesHistoryDao();
			ArrayList<PatientChargesHistoryVo> patientChargesHistory = patientChargesHistoryDao
					.editPatientHistory(chargesHistoryVo);

			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (PatientChargesHistoryVo charges : patientChargesHistory) {
				int id = charges.getId();
				String type = charges.getChargetype();
				String title = charges.getTitle();
				Date date = charges.getDate();
				String date1 = date.toString();
				String unit = charges.getUnit();
				float amount = charges.getAmount();
				float fund = charges.getPatientid().getFund();
				CommonFiledVo common = new CommonFiledVo();
				common.setDate(date1);
				common.setId(id);
				common.setPatientID(patientId);
				common.setPrice(amount);
				common.setTitle(title);
				common.setDiscription(unit);
				common.setPrescriptionId(id);
				common.setSubtotal(fund);
				common.setType(type);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			SimpleDateFormat sdfdate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfdateconvert = new SimpleDateFormat("yyyy-MM-dd");

			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminid");

			int patientId = Integer.parseInt(request.getParameter(""));
			String invoiceTitle = request.getParameter("");
			float subtotalAmount = Float.parseFloat(request.getParameter(""));
			float adjustmentAmount = Float.parseFloat(request.getParameter(""));
			String date = request.getParameter("");
			String comment = request.getParameter("");
			int invoiceId = Integer.parseInt(request.getParameter(""));
			String[] chargesId = request.getParameterValues("");
			int[] numbers = Arrays.asList(date.split(",")).stream().map(String::trim).mapToInt(Integer::parseInt)
					.toArray();
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientId);

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setAdjustmentamount(adjustmentAmount);
			invoiceHospitalVo.setAdminid(adminVo);
			invoiceHospitalVo.setComments(comment);
			invoiceHospitalVo.setDate(date);
			invoiceHospitalVo.setInvoiceID(invoiceId);
			invoiceHospitalVo.setInvoicetitle(invoiceTitle);
			invoiceHospitalVo.setPatientid(patientRegistretionVo);
			invoiceHospitalVo.setSubtotalamount(subtotalAmount);

			InvoiceHospitalDao invoiceHospitalDao = new InvoiceHospitalDao();
			String check = invoiceHospitalDao.insertInvoice(invoiceHospitalVo);

			if (check.equalsIgnoreCase("true")) {
				invoiceUpdate = "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void invoiceList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("invoiceAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InvoiceHospitalVo invoiceHospitalVo = new InvoiceHospitalVo();
			invoiceHospitalVo.setAdminid(adminVo);

			InvoiceHospitalDao hospitalDao = new InvoiceHospitalDao();
			ArrayList<InvoiceHospitalVo> invoiceList = hospitalDao.listOfInvoice(invoiceHospitalVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (InvoiceHospitalVo invoice : invoiceList) {
				int invoiceid = invoice.getInvoiceID();
				int id = invoice.getId();
				String title = invoice.getInvoicetitle();
				String patientid = invoice.getPatientid().getPatientid();
				float amount = invoice.getSubtotalamount();
				float discount = invoice.getAdjustmentamount();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
