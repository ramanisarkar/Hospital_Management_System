package Com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DoctorDao;
import DAO.MedicineDao;
import DAO.PatientRegistreationDao;
import DAO.TreatmentDao;
import VO.AdminVo;
import VO.DoctorVo;
import VO.MedicineVo;
import VO.PatientRegistretionVo;
import VO.TreatmentVo;

/**
 * Servlet implementation class Prescription
 */
@WebServlet("/Prescription")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		System.out.println(doctorlist.size());
		session.setAttribute("doctorlist", doctorlist);
		
	}

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
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
		ArrayList<MedicineVo> medicineList= medicineDao.medicineList(medicineVo);
		System.out.println(medicineList.size());
		session.setAttribute("medicineList", medicineList);
	}

}
