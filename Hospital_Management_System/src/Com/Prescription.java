package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.AllDataCountDao;
import DAO.DoctorDao;
import DAO.MedicineDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientDao;
import DAO.PatientRegistreationDao;
import DAO.PrescriptionDao;
import DAO.ReportDao;
import DAO.TreatmentDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.CommonFiledVo;
import VO.DoctorVo;
import VO.MedicineVo;
import VO.PatientChargesHistoryVo;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;
import VO.PrescriptionMedicationVo;
import VO.PrescriptionNoteVo;
import VO.PrescriptionReportVo;
import VO.PrescriptionVo;
import VO.ReportVo;
import VO.TreatmentVo;

/**
 * Servlet implementation class Prescription
 */
@WebServlet("/Prescription")
@MultipartConfig
public class Prescription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Prescription() {
		super();
		// TODO Auto-generated constructor stub
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
			session.setAttribute("prescriptionAdminId", adminid);
			medicineList(request, response);
			patientRegistrationList(request, response);
			DoctorList(request, response);
			treatmentList(request, response);
			response.sendRedirect("Admin_Prescription_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("listPrescription")) {
			prescriptionList(request, response);
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
		if (flag.equalsIgnoreCase("prescriptionInsert")) {
			prescriptionInsert(request, response);
		}
		if (flag.equalsIgnoreCase("insertReport")) {
			prescriptionReportInsert(request, response);
		}
	}

	private void treatmentList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("prescriptionAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		TreatmentVo treatmentVo = new TreatmentVo();
		treatmentVo.setAdminid(adminVo);

		TreatmentDao treatmentDao = new TreatmentDao();
		ArrayList<TreatmentVo> treatmentlist = treatmentDao.treatmentList(treatmentVo);
		System.out.println(treatmentlist.size());
		session.setAttribute("treatmentList", treatmentlist);

	}

	private void DoctorList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("prescriptionAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setAdminid(adminVo);

		DoctorDao doctorDao = new DoctorDao();
		ArrayList<DoctorVo> doctorlist = doctorDao.doctorList(doctorVo);

		session.setAttribute("doctorlist", doctorlist);

	}

	protected void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("prescriptionAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		System.out.println(patientRegistration.size());
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void medicineList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("prescriptionAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		MedicineVo medicineVo = new MedicineVo();
		medicineVo.setAdminid(adminVo);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<MedicineVo> medicineList = medicineDao.medicineList(medicineVo);
		System.out.println(medicineList.size());
		session.setAttribute("medicineList", medicineList);
	}

	private void prescriptionInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("prescriptionAdminId");

			int patientid = Integer.parseInt(request.getParameter("patient_id"));
			int doctorid = Integer.parseInt(request.getParameter("doctor_id"));
			String type = request.getParameter("prescription_type");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
			String date = sdf1.format(t1);

			java.sql.Date date1 = java.sql.Date.valueOf(LocalDate.now());
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientid);

			DoctorVo doctorVo = new DoctorVo();
			doctorVo.setId(doctorid);

			if (type.equalsIgnoreCase("treatment")) {
				int tratmentid = Integer.parseInt(request.getParameter("treatment_id"));
				String[] medcineid = request.getParameterValues("medication[]");
				System.out.println(medcineid.length);
				String[] frequency = request.getParameterValues("times1[]");
				String[] noof = request.getParameterValues("days[]");
				String[] day = request.getParameterValues("time_period[]");
				String[] whentotake = request.getParameterValues("takes_time[]");
				String[] note = request.getParameterValues("note[]");
				String casehistory = request.getParameter("case_history");

				TreatmentVo treatmentVo = new TreatmentVo();
				treatmentVo.setId(tratmentid);

				PrescriptionVo prescriptionVo = new PrescriptionVo();
				prescriptionVo.setAdminid(adminVo);
				prescriptionVo.setCasehistory(casehistory);
				prescriptionVo.setDoctorid(doctorVo);
				prescriptionVo.setPatientid(patientRegistretionVo);
				prescriptionVo.setType(type);
				prescriptionVo.setDate(date);
				prescriptionVo.setJoiningdate(joiningdate);
				prescriptionVo.setTreatmentid(treatmentVo);

				PrescriptionDao prescriptionDao = new PrescriptionDao();
				String prescriptionCheck = prescriptionDao.insertPriscription(prescriptionVo);
				if (prescriptionCheck.equalsIgnoreCase("true")) {
					for (int i = 0; i < medcineid.length; i++) {
						int medicine = Integer.valueOf(medcineid[i]);
						int frequencyid = Integer.valueOf(frequency[i]);
						int noofday = Integer.valueOf(noof[i]);
						String timeperiod = day[i];
						String take = whentotake[i];

						MedicineVo medicineVo = new MedicineVo();
						medicineVo.setId(medicine);

						PrescriptionMedicationVo prescriptionMedicationVo = new PrescriptionMedicationVo();
						prescriptionMedicationVo.setMedicineid(medicineVo);
						prescriptionMedicationVo.setFrequency(frequencyid);
						prescriptionMedicationVo.setAdminid(adminVo);
						prescriptionMedicationVo.setNoof(noofday);
						prescriptionMedicationVo.setTimeperiod(timeperiod);
						prescriptionMedicationVo.setWhentotake(take);
						prescriptionMedicationVo.setPrescriptionid(prescriptionVo);
						prescriptionDao.insertPriscriptionMedicine(prescriptionMedicationVo);
					}
					for (int i = 0; i < note.length; i++) {
						String note1 = note[i];

						PrescriptionNoteVo prescriptionNoteVo = new PrescriptionNoteVo();
						prescriptionNoteVo.setAdminid(adminVo);
						prescriptionNoteVo.setNote(note1);
						prescriptionNoteVo.setPrescriptionid(prescriptionVo);
						prescriptionDao.insertPriscriptionCustomFileds(prescriptionNoteVo);
					}
					AllDataCountVo allDataCountVo = new AllDataCountVo();
					allDataCountVo.setAdminid(adminVo);
					AllDataCountDao allDataCountDao = new AllDataCountDao();
					allDataCountDao.increaseData(allDataCountVo, "prescription");
				}

			} else if (type.equalsIgnoreCase("report")) {
				String[] reportid = request.getParameterValues("report_type[]");
				System.out.println(reportid.length);
				String reportDescription = request.getParameter("report_description");
				String doctorConsultingCharge =request.getParameter("doctor_consulting_charge");
				String doctorVisitingCharge = request.getParameter("doctor_visiting_charge");
				
				PrescriptionVo prescriptionVo = new PrescriptionVo();
				prescriptionVo.setAdminid(adminVo);
				prescriptionVo.setPatientid(patientRegistretionVo);
				prescriptionVo.setDoctorid(doctorVo);
				prescriptionVo.setDoctorconsultingcharge(doctorConsultingCharge);
				prescriptionVo.setDoctorvisitingcharge(doctorVisitingCharge);
				prescriptionVo.setDate(date);
				prescriptionVo.setJoiningdate(joiningdate);
				prescriptionVo.setType(type);
				prescriptionVo.setReportdescription(reportDescription);

				PrescriptionDao prescriptionDao = new PrescriptionDao();
				String prescriptionCheck = prescriptionDao.insertPriscription(prescriptionVo);
				if (prescriptionCheck.equalsIgnoreCase("true")) {
					for (int i = 0; i < reportid.length; i++) {
						int report = Integer.valueOf(reportid[i]);

						ReportVo reportVo = new ReportVo();
						reportVo.setId(report);

						PrescriptionReportVo prescriptionReportVo = new PrescriptionReportVo();
						prescriptionReportVo.setAdminid(adminVo);
						prescriptionReportVo.setPrescriptionid(prescriptionVo);
						prescriptionReportVo.setReportid(reportVo);
						prescriptionDao.insertPriscriptionReport(prescriptionReportVo);
					}
					
					if(doctorConsultingCharge!=null || doctorVisitingCharge!=null ) {
						DoctorDao dao = new DoctorDao();
						ArrayList<DoctorVo> doctorlist = dao.doctorEdit(doctorVo);
						float doctorcharg = 0;
						if (doctorConsultingCharge!=null) {
							doctorcharg += doctorlist.get(0).getConsultingcharge();
						}
						if (doctorVisitingCharge!=null) {
							doctorcharg += doctorlist.get(0).getVisitingcharge();
						}

						PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
						chargesHistoryVo.setAdminid(adminVo);
						chargesHistoryVo.setPatientid(patientRegistretionVo);
						chargesHistoryVo.setChargetype("Doctor Fees");
						chargesHistoryVo.setDate(date1);
						chargesHistoryVo.setTitle(doctorlist.get(0).getFirstname());
						chargesHistoryVo.setAmount(doctorcharg);
						chargesHistoryVo.setTotalamount(doctorcharg);
						PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
						chargesHistoryDao.insertCharges(chargesHistoryVo);
						
						AllDataCountVo allDataCountVo = new AllDataCountVo();
						allDataCountVo.setAdminid(adminVo);
						AllDataCountDao allDataCountDao = new AllDataCountDao();
						allDataCountDao.increaseData(allDataCountVo, "prescription");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void prescriptionList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("prescriptionAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PrescriptionVo prescriptionVo = new PrescriptionVo();
			prescriptionVo.setAdminid(adminVo);

			PrescriptionDao prescriptionDao = new PrescriptionDao();

			ArrayList<PrescriptionVo> prescriptionList = prescriptionDao.listPrescription(prescriptionVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (PrescriptionVo prescription : prescriptionList) {
				int id = prescription.getId();
				String date = prescription.getDate();
				String patientid = prescription.getPatientid().getPatientid();
				String patientname = prescription.getPatientid().getFirstname();
				String type = prescription.getType();
				String treatment = "";
				if (type.equalsIgnoreCase("treatment")) {
					treatment = prescription.getTreatmentid().getTreatmentname();
				}
				CommonFiledVo common = new CommonFiledVo();
				common.setDate(date);
				common.setPatientId(patientid);
				common.setPatientName(patientname);
				common.setPrescriptionId(id);
				common.setTreatmentName(treatment);
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

	private void prescriptionReportInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("prescriptionAdminId");
		int patientid = Integer.parseInt(request.getParameter("patient_id"));
		int doctorid = Integer.parseInt(request.getParameter("doctor_id"));
		String[] reportid = request.getParameterValues("");
		String type = request.getParameter("");
		String reportDescription = request.getParameter("");
		String doctorConsultingCharge = request.getParameter("");
		String doctorVisitingCharge = request.getParameter("");

		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
		String joiningdate = sdf.format(t1);

		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		String date = sdf1.format(t1);
		
		java.sql.Date date1 = java.sql.Date.valueOf(LocalDate.now());
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setId(patientid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setId(doctorid);

		PrescriptionVo prescriptionVo = new PrescriptionVo();
		prescriptionVo.setAdminid(adminVo);
		prescriptionVo.setPatientid(patientRegistretionVo);
		prescriptionVo.setDoctorid(doctorVo);
		prescriptionVo.setDoctorconsultingcharge(doctorConsultingCharge);
		prescriptionVo.setDoctorvisitingcharge(doctorVisitingCharge);
		prescriptionVo.setDate(date);
		prescriptionVo.setJoiningdate(joiningdate);
		prescriptionVo.setType(type);
		prescriptionVo.setReportdescription(reportDescription);

		PrescriptionDao prescriptionDao = new PrescriptionDao();
		String prescriptionCheck = prescriptionDao.insertPriscription(prescriptionVo);
		if (prescriptionCheck.equalsIgnoreCase("true")) {
			for (int i = 0; i < reportid.length; i++) {
				int report = Integer.valueOf(reportid[i]);

				ReportVo reportVo = new ReportVo();
				reportVo.setId(report);

				PrescriptionReportVo prescriptionReportVo = new PrescriptionReportVo();
				prescriptionReportVo.setAdminid(adminVo);
				prescriptionReportVo.setPrescriptionid(prescriptionVo);
				prescriptionReportVo.setReportid(reportVo);
				prescriptionDao.insertPriscriptionReport(prescriptionReportVo);
			}
			String s1 = doctorConsultingCharge;
			String s2 = doctorVisitingCharge;
			if (s1.equalsIgnoreCase("True") || s2.equalsIgnoreCase("True")) {
				DoctorDao dao = new DoctorDao();
				ArrayList<DoctorVo> doctorlist = dao.doctorEdit(doctorVo);
				float doctorcharg = 0;
				if (doctorConsultingCharge.equalsIgnoreCase("True")) {
					doctorcharg += doctorlist.get(0).getConsultingcharge();
				}
				if (doctorVisitingCharge.equalsIgnoreCase("True")) {
					doctorcharg += doctorlist.get(0).getVisitingcharge();
				}
				PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
				chargesHistoryVo.setAdminid(adminVo);
				chargesHistoryVo.setPatientid(patientRegistretionVo);
				chargesHistoryVo.setChargetype("Doctor Fees");
				chargesHistoryVo.setDate(date1);
				chargesHistoryVo.setTotalamount(doctorcharg);
			}
		}
	}
}