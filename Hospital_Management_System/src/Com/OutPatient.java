package Com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import DAO.DoctorDao;
import DAO.LoginDAO;
import DAO.OutPatientDao;
import DAO.PatientDao;
import DAO.PatientRegistreationDao;
import DAO.SymptomsDao;
import VO.AdminVo;
import VO.CommonDataVo;
import VO.DoctorVo;
import VO.LoginVO;
import VO.NurseList;
import VO.OperationVo;
import VO.PatientDoctorVo;
import VO.PatientList;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;
import VO.SymptomsVo;

/**
 * Servlet implementation class OutPatient
 */
@WebServlet("/OutPatient")
@MultipartConfig
public class OutPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OutPatient() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String patientupdate = null;

	private static final String SAVE_DIR_Dignosis_Report = "Out_Patient_Didnosis_Report";

	private static String getSubmittedFileName(Part part) {
		String filename = "null";
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
			}
		}
		return filename;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("outpatientadminid", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Out_Patient_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("outpatientList")) {
			outPatientList(request, response);
		}
	}

	private void outPatientList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("patientadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientOtherInfo patientVo = new PatientOtherInfo();
		patientVo.setAdminid(adminVo);
		patientVo.setPatienttype("IN");

		PatientDao patientDao = new PatientDao();
		ArrayList<PatientOtherInfo> patientlist = patientDao.patientList(patientVo);
		List<PatientList> list = new ArrayList<PatientList>();
		DoctorVo doctorVo = new DoctorVo();
		DoctorDao doctorDao = new DoctorDao();
		for (PatientOtherInfo patient : patientlist) {
			int id = patient.getId();
			String photo = patient.getPatientregistrationid().getProfileimage();
			String name = patient.getPatientregistrationid().getFirstname();
			String psientid = patient.getPatientregistrationid().getPatientid();
			System.out.println(psientid);
			String mobile = patient.getPatientregistrationid().getMobileno();
			String bloodgroup = patient.getPatientregistrationid().getBloodgroup();
			String admitedate = patient.getAdmintdate();
			String date = admitedate.toString();
			String patientstatus = patient.getStatus();
			int doctorid = patient.getDoctorid().getId();
			doctorVo.setId(doctorid);
			ArrayList<DoctorVo> listofdocotr = doctorDao.doctorEdit(doctorVo);
			String doctorassigned = listofdocotr.get(0).getFirstname();

			PatientList common = new PatientList();
			common.setPatientstatus(patientstatus);
			common.setId(id);
			common.setProfileimage(photo);
			common.setFirstname(name);
			common.setPatientid(psientid);
			common.setMobileno(mobile);
			common.setBloodgroup(bloodgroup);
			common.setAdmintdate(date);
			common.setDoctorname(doctorassigned);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
		
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
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("outpatientadminid", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Patient_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("precriptionOutPatientInsert")) {
			int adminid = Integer.parseInt(request.getParameter("adminid"));
			session.setAttribute("outpatientadminid", adminid);
			outPatientInsert(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			outPatentChackUsername(request, response);
		}
		if (flag.equalsIgnoreCase("chackemail")) {
			outPatentChackEmail(request, response);
		}
	}

	private void outPatentChackUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outusername = request.getParameter("outpatentusername");

		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(outusername);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
		System.out.println(usernamechack.size());
		List<NurseList> list = new ArrayList<NurseList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			NurseList common = new NurseList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO supportStaff : usernamechack) {
				String username = supportStaff.getUsername();
				String user = "false";
				NurseList common = new NurseList();
				common.setUsername(username);
				common.setChackusername(user);
				list.add(common);
			}
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void outPatentChackEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outpatentemail = request.getParameter("outpatentemail");

		LoginVO loginvo = new LoginVO();
		loginvo.setEmail(outpatentemail);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.emailverify(loginvo);
		System.out.println(usernamechack.size());
		List<NurseList> list = new ArrayList<NurseList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			NurseList common = new NurseList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO supportStaff : usernamechack) {
				String username = supportStaff.getUsername();
				String user = "false";
				NurseList common = new NurseList();
				common.setUsername(username);
				common.setChackusername(user);
				list.add(common);
			}
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void outPatientInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("outpatientadminid");
			int patientid = Integer.parseInt(request.getParameter("patient_id"));

			int doctor = Integer.parseInt(request.getParameter("doctor"));
			String[] symptoms = request.getParameterValues("symptoms[]");
			String dignosisReportPath = getServletContext().getRealPath(File.separator + SAVE_DIR_Dignosis_Report);

			File dignosisDir = new File(dignosisReportPath);
			if (!dignosisDir.exists()) {
				dignosisDir.mkdirs();
			}

			int count = Integer.parseInt(request.getParameter("count"));
			int a = 1;
			String dignosisReport = "";
			for (int i = 1; i <= count; i++) {
				Part guardianimage = request.getPart("dignosis" + i + "");
				String guardianimageName = getSubmittedFileName(guardianimage);
				String guardianimagepath = null;
				if ((guardianimageName.isEmpty()) == false) {
					String uniq = String.valueOf(a);
					guardianimagepath = uniq.concat("@").concat(guardianimageName);
					String Path2 = getServletContext().getRealPath(
							File.separator + SAVE_DIR_Dignosis_Report + File.separator + guardianimagepath);
					guardianimage.write(Path2);
					dignosisReport = dignosisReport.concat(guardianimagepath).concat("/");
				}
			}

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf1.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			DoctorVo doctorVo = new DoctorVo();
			doctorVo.setId(doctor);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientid);
			
			PatientOtherInfo patientOtherInfo = new PatientOtherInfo();
			patientOtherInfo.setPatientregistrationid(patientRegistretionVo);
			patientOtherInfo.setAdminid(adminVo);
			patientOtherInfo.setDoctorid(doctorVo);
			patientOtherInfo.setJoiningdate(joiningdate);
			patientOtherInfo.setPatienttype("OUT");
			patientOtherInfo.setStatus("OutPatient");

			PatientDao patientDao = new PatientDao();
			ArrayList<PatientOtherInfo> patentcheck = patientDao.patientCheck(patientOtherInfo);
			if (patentcheck.isEmpty() == true) {
				String chackdoctor = patientDao.outPatientInsert(patientOtherInfo);
				if (chackdoctor == "true") {
					CommonDataVo commonDataVo = new CommonDataVo();
					commonDataVo.setSymptomspatientid(patientRegistretionVo);
					patientDao.deletePatientSymptomes(commonDataVo);
					for (int j = 0; j < symptoms.length; j++) {

						int symptom = Integer.valueOf(symptoms[j]);
						SymptomsVo symptomsVo = new SymptomsVo();
						symptomsVo.setId(symptom);
						CommonDataVo commonDataVo1 = new CommonDataVo();
						commonDataVo1.setAdminid(adminVo);
						commonDataVo1.setSymptomspatientid(patientRegistretionVo);
						commonDataVo1.setSymptomsid(symptomsVo);

						patientDao.insertSymptoms(commonDataVo);
					}
					PatientDoctorVo patientVo = new PatientDoctorVo();
					patientVo.setAdminid(adminVo);
					patientVo.setDoctorid(doctorVo);
					patientVo.setPatientotherinfoid(patientOtherInfo);
					patientVo.setPatienttype("OUT");

					ArrayList<PatientDoctorVo> patentchak = patientDao.checkPatientDoctor(patientVo);
					patientupdate = "true";
					if (patentchak.isEmpty() == true) {
						patientDao.patientDoctorInsert(patientVo);
					}
				}
			} else if (patentcheck.isEmpty() == false) {
				patientOtherInfo.setId(patentcheck.get(0).getId());
				String chackdoctor = patientDao.outPatientUpdate(patientOtherInfo);
				if (chackdoctor == "true") {
					PatientDoctorVo patientVo = new PatientDoctorVo();
					patientVo.setAdminid(adminVo);
					patientVo.setDoctorid(doctorVo);
					patientVo.setPatientotherinfoid(patientOtherInfo);
					patientVo.setPatienttype("OUT");

					ArrayList<PatientDoctorVo> patentchak = patientDao.checkPatientDoctor(patientVo);
					patientupdate = "true";
					if (patentchak.isEmpty() == true) {
						patientDao.patientDoctorInsert(patientVo);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("outpatientadminid");

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

}
