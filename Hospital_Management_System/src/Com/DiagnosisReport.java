package Com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import DAO.AllDataCountDao;
import DAO.DiagnosisReportDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientRegistreationDao;
import DAO.ReportDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.DiagnosisReportAddList;
import VO.DiagnosisReportAddVo;
import VO.DiagnosisReportApplyVo;
import VO.PatientChargesHistoryVo;
import VO.PatientRegistretionVo;
import VO.ReportVo;

/**
 * Servlet implementation class DiagnosisReport
 */
@WebServlet("/DiagnosisReport")
@MultipartConfig
public class DiagnosisReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String diagnosisReportUpdate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public DiagnosisReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final String SAVE_DIR_Images = "Diagnosis_Report";

	private void PatientImage(boolean s, String profileImagepath, Part profileImage) {
		try {
			if (s == true) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImagepath);
				profileImage.write(Path);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static String getSubmittedFileName(Part part) {
		String filename = "null";
		System.out.println(part);
		if (part != null) {
			for (String cd : part.getHeader("content-disposition").split(";")) {
				if (cd.trim().startsWith("filename")) {
					String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
					return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
				}
			}
			return filename;
		}
		return filename;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("diagnosisReportAdminid", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Diagnosis_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("instrumentList")) {
			diagnosisReportList(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentEdit")) {
			diagnosisReportEdit(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentDelete")) {
			diagnosisReportDelete(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			diagnosisReportInsert(request, response);
			diagnosisReportList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			diagnosisReportUpdate(request, response);
		}
	}
	
	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("diagnosisReportAdminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);
		
		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		session.setAttribute("patientRagistrationList", patientRegistration);
	}
	
	private void diagnosisReportInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int Adminid = (int) session.getAttribute("diagnosisReportAdminid");
			int patientId = Integer.parseInt(request.getParameter("patientId"));
			String[] reportId = request.getParameterValues("report_type[]");
			String description = request.getParameter("diagno_description");
			String sendEmailPatient = request.getParameter("hmgt_send_mail_to_patient");
			String sendEmailDoctor = request.getParameter("hmgt_send_mail_to_doctor");
			float reportTotalCost = Float.parseFloat(request.getParameter("report_cost"));
			
			Timestamp t1 = new Timestamp(System.currentTimeMillis());

			java.sql.Date date = java.sql.Date.valueOf(LocalDate.now());
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(Adminid);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientId);

			DiagnosisReportDao diagnosisReportDao = new DiagnosisReportDao();
			
			

			DiagnosisReportAddVo diagnosisReportAddVo = new DiagnosisReportAddVo();
			diagnosisReportAddVo.setPatientid(patientVo);
			diagnosisReportAddVo.setAdminid(adminVo);
			diagnosisReportAddVo.setDescription(description);
			diagnosisReportAddVo.setJoiningdate(t1);
			diagnosisReportAddVo.setSendemaildoctor(sendEmailDoctor);
			diagnosisReportAddVo.setSendemailpatient(sendEmailPatient);
			diagnosisReportAddVo.setTotal(reportTotalCost);
			diagnosisReportAddVo.setDate(date);
			String message = diagnosisReportDao.insretDiagnosisReport(diagnosisReportAddVo);
			String titleforcharge = "";
			float charge =0;
			if (message.equalsIgnoreCase("true")) {
				for (int i = 0; i < reportId.length; i++) {
					int report = Integer.valueOf(reportId[i]);

					ReportVo reportVo = new ReportVo();
					reportVo.setId(report);
					
					ReportDao reportDao = new ReportDao();
					ArrayList<ReportVo> reportlist = reportDao.reportEdit(reportVo);

					String name = reportlist.get(0).getReportname();
					titleforcharge = name;
					if(i>=1) {
						titleforcharge=titleforcharge.concat(",").concat(name);
					}
					charge+=reportlist.get(0).getAmount();
					System.out.println(i);
					Part profileImage = request.getPart("document" + i + "");

					String profileImageName = getSubmittedFileName(profileImage);
					
					Map<String,Object> profileMap = new HashMap<>();
					boolean s = (boolean) profileMap.get("s");
					String profileImagepath = (String) profileMap.get("profileImagepath");
					DiagnosisReportApplyVo diagnosisReportApplyVo = new DiagnosisReportApplyVo();
					diagnosisReportApplyVo.setAdminid(adminVo);
					diagnosisReportApplyVo.setDiagnosisreportid(diagnosisReportAddVo);
					diagnosisReportApplyVo.setReport(profileImagepath);
					diagnosisReportApplyVo.setReportid(reportVo);
					String message1 = diagnosisReportDao.insretDiagnosisReportApply(diagnosisReportApplyVo);
					if (message1.equalsIgnoreCase("true")) {
						
						String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
						File imageDir = new File(uploadImagePath);
						if (!imageDir.exists()) {
							imageDir.mkdirs();
						}
						PatientImage(s, profileImagepath, profileImage);
						diagnosisReportUpdate = "true";
					}
				}
				
				insertChargeSheetDetails(date, adminVo, patientVo, diagnosisReportAddVo, titleforcharge, charge);

				AllDataCountVo allDataCountVo = new AllDataCountVo();
				allDataCountVo.setAdminid(adminVo);
				AllDataCountDao allDataCountDao = new AllDataCountDao();
				allDataCountDao.increaseData(allDataCountVo, "diagnosisreport");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Map<String,Object> getProfileImage(String profileImageName, String name, int i){
		String profileImagepath = null;
		boolean s = false;
		if (profileImageName != "null") {
			if (!profileImageName.isEmpty()) {
				profileImagepath = name.concat(String.valueOf(i)).concat("@").concat(profileImageName);
				s = true;
			} else {
				s = false;
			}
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("s",s);
		returnMap.put("profileImagepath",profileImagepath);
		return returnMap;
	}
	private void insertChargeSheetDetails(java.sql.Date date, AdminVo adminVo, PatientRegistretionVo patientVo,
			DiagnosisReportAddVo diagnosisReportAddVo, String titleforcharge, float charge) {
		PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
		chargesHistoryVo.setAdminid(adminVo);
		chargesHistoryVo.setDiagnosisid(diagnosisReportAddVo);
		chargesHistoryVo.setAmount(charge);
		chargesHistoryVo.setChargetype("Dignosis Report Charges");
		chargesHistoryVo.setDate(date);
		chargesHistoryVo.setPatientid(patientVo);
		chargesHistoryVo.setTitle(titleforcharge);

		PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
		chargesHistoryDao.insertCharges(chargesHistoryVo);
	}

	private void diagnosisReportList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("diagnosisReportAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			DiagnosisReportAddVo diagnosisReportAddVo = new DiagnosisReportAddVo();
			diagnosisReportAddVo.setAdminid(adminVo);

			DiagnosisReportDao diagnosisReportDao = new DiagnosisReportDao();
			ArrayList<DiagnosisReportAddVo> reportList = diagnosisReportDao
					.listDiagnosisReportAdd(diagnosisReportAddVo);
			
			List<DiagnosisReportAddList> list = new ArrayList<DiagnosisReportAddList>();
			for (DiagnosisReportAddVo report : reportList) {
				int id = report.getId();
				String patientid = report.getPatientid().getPatientid();
				String patname = report.getPatientid().getFirstname();
				String description = report.getDescription();
				java.sql.Date date = report.getDate();
				String reportdate = date.toString();
				float total = report.getTotal();
				
				diagnosisReportAddVo.setId(id);
				
				DiagnosisReportApplyVo diagnosisReportApplyVo = new DiagnosisReportApplyVo();
				diagnosisReportApplyVo.setDiagnosisreportid(diagnosisReportAddVo);
				
				ArrayList<DiagnosisReportApplyVo> apply = diagnosisReportDao.editDiagnosisReportApply(diagnosisReportApplyVo); 
				String reporttype = apply.get(0).getReportid().getReportname();
				float charges = apply.get(0).getReportid().getAmount();
				String diagnosis = apply.get(0).getReport();
				String diagnosisname = "";
				if (diagnosis != null) {
					int a = diagnosis.indexOf("@");
					a++;
					diagnosisname = diagnosis.substring(a);
				}

				DiagnosisReportAddList common = new DiagnosisReportAddList();
				common.setId(id);
				common.setPatientuniqid(patientid);
				common.setPatientname(patname);
				common.setDate(reportdate);
				common.setReportname(reporttype);
				common.setReportcost(charges);
				common.setTotal(total);
				common.setDiscription(description);
				common.setReportpath(diagnosis);
				common.setReportname(diagnosisname);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void diagnosisReportEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int diagnosisReportId = Integer.parseInt(request.getParameter("diagnosisReportId"));
			System.out.println(diagnosisReportId);

			DiagnosisReportAddVo diagnosisReportAddVo = new DiagnosisReportAddVo();
			diagnosisReportAddVo.setId(diagnosisReportId);

			DiagnosisReportApplyVo diagnosisReportApplyVo = new DiagnosisReportApplyVo();
			diagnosisReportApplyVo.setDiagnosisreportid(diagnosisReportAddVo);

			DiagnosisReportDao diagnosisReportDao = new DiagnosisReportDao();
			ArrayList<DiagnosisReportApplyVo> reportList = diagnosisReportDao
					.editDiagnosisReportApply(diagnosisReportApplyVo);
			List<DiagnosisReportAddList> list = new ArrayList<DiagnosisReportAddList>();
			for (DiagnosisReportApplyVo report : reportList) {
				int id = report.getDiagnosisreportid().getId();
				int adminid = report.getAdminid().getId();
				int patientId = report.getDiagnosisreportid().getPatientid().getId();
				int reportid = report.getReportid().getId();
				java.sql.Date date = report.getDiagnosisreportid().getDate();
				String diagnosis = report.getReport();
				String description = report.getDiagnosisreportid().getDescription();
				String sendemailpatient = report.getDiagnosisreportid().getSendemailpatient();
				String sendemaildoctor = report.getDiagnosisreportid().getSendemaildoctor();
				java.sql.Timestamp joiningdate = report.getDiagnosisreportid().getJoiningdate();
				float total = report.getDiagnosisreportid().getTotal();
				
				String reportdate = date.toString();
				String joidate  = joiningdate.toString();
				DiagnosisReportAddList common = new DiagnosisReportAddList();
				common.setId(id);
				common.setAdminid(adminid);
				common.setPatientid(patientId);
				common.setReportid(reportid);
				common.setReportpath(diagnosis);
				common.setDiscription(description);
				common.setTotal(total);
				common.setEmailtopatient(sendemailpatient);
				common.setEmailtodoctor(sendemaildoctor);
				common.setJoiningdate(joidate);
				common.setDate(reportdate);
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

	private void diagnosisReportUpdate(HttpServletRequest request, HttpServletResponse response) {

	}

	private void diagnosisReportDelete(HttpServletRequest request, HttpServletResponse response) {

	}

}
