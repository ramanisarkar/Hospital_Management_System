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
import DAO.PatientDao;
import DAO.PatientRegistreationDao;
import VO.AdminVo;
import VO.CommonDataVo;
import VO.DoctorVo;
import VO.LoginVO;
import VO.PatientChargesHistoryVo;
import VO.PatientDoctorVo;
import VO.PatientGuardianInfo;
import VO.PatientList;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;
import VO.SymptomsVo;

/**
 * Servlet implementation class Patient
 */
@WebServlet("/Patient")
@MultipartConfig
public class Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String patientupdate = null;
	private String patientemail = null;
	private String patientuser = null;

	private static final String SAVE_DIR_Guardian_Images = "Patient_Gurdian_Image";

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

	private void PatientImage(boolean s, String profileImagepath, Part profileImage) {
		try {
			if (s == true) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Guardian_Images + File.separator + profileImagepath);
				profileImage.write(Path);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
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
			session.setAttribute("patientadminid", adminid);
			DoctorList(request, response);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Patient_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("insertPatientId")) {
			patientRagistrationInfo(request, response);
		}
		if (flag.equalsIgnoreCase("patientList")) {
			patientList(request, response);
		}
		if (flag.equalsIgnoreCase("editPatient")) {
			patientEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deletePatient")) {
			patientDelete(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			patientInsert(request, response);
			patientList(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			patientUserNameChack(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			patientUpdate(request, response);
		}

	}

	private void DoctorList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("patientadminid");

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
		int adminid = (int) session.getAttribute("patientadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);
		
		System.out.println(patientRegistretionVo.getAdminid());
		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		System.out.println(patientRegistration);
		System.out.println(patientRegistration.size());
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void patientRagistrationInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		System.out.println(patientId);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setId(patientId);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientList = patientRegistreationDao.getPatient(patientRegistretionVo);
		System.out.println(patientList);
		List<PatientList> list = new ArrayList<PatientList>();
		for (PatientRegistretionVo patient : patientList) {
			String patientid = patient.getPatientid();
			String gardian = ("G").concat(patientid);
			String symptoms = patient.getSymptoms();
			String firstName = patient.getFirstname();
			String middleName = patient.getMidalname();
			String lastName = patient.getLastname();
			String date = patient.getBirthdate();
			String gender = patient.getGender();
			String homeAddress = patient.getHomeeaddrss();
			String homeCity = patient.getHomecity();
			String homeState = patient.getHomestate();
			String homeCountry = patient.getHomecountry();
			String homeZipcode = patient.getHomezipcode();
			String standardCode = patient.getMobilecountrycode();
			String mobileNumber = patient.getMobileno();
			String phoneNumber = patient.getPhoneno();
			String email = patient.getEmail();
			String password = patient.getPassword();
			String userName = patient.getUsername();
			String profileimage = patient.getProfileimage();
			String bloodgroup = patient.getBloodgroup();
			PatientList common = new PatientList();
			common.setGuardianid(gardian);
			common.setPatientid(patientid.concat("-").concat(firstName));
			common.setSymptoms(symptoms);
			common.setFirstname(firstName);
			common.setBloodgroup(bloodgroup);
			common.setMidalname(middleName);
			common.setLastname(lastName);
			common.setDate(date);
			common.setGender(gender);
			common.setHomeeaddrss(homeAddress);
			common.setHomecity(homeCity);
			common.setHomestate(homeState);
			common.setHomecountry(homeCountry);
			common.setHomezipcode(homeZipcode);
			common.setMobilecountrycode(standardCode);
			common.setMobileno(mobileNumber);
			common.setPhoneno(phoneNumber);
			common.setEmail(email);
			common.setUsername(userName);
			common.setPassword(password);
			common.setProfileimage(profileimage);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void patientList(HttpServletRequest request, HttpServletResponse response) throws IOException {

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

	private void patientUserNameChack(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String patientusername = request.getParameter("patientusername");
		System.out.println(patientusername);
		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(patientusername);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
		System.out.println(usernamechack.size());
		List<PatientList> list = new ArrayList<PatientList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			PatientList common = new PatientList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO pharmacist : usernamechack) {
				String username = pharmacist.getUsername();
				String user = "false";
				PatientList common = new PatientList();
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

	private void patientInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("patientadminid");
			int patientid = Integer.parseInt(request.getParameter("patientId"));
			String guardianid = request.getParameter("guardianid");
			String guardfirstName = request.getParameter("guardfirstname");
			String guardMiddleName = request.getParameter("guardmiddlename");
			String guardLastName = request.getParameter("guardlastname");
			String guardgender = request.getParameter("guardgender");
			String raletionwithpatient = request.getParameter("raletionwithpatient");
			String guardhomeAddress = request.getParameter("guardhometownaddress");
			String guardhomeCity = request.getParameter("guardhomecity");
			String guardhomeState = request.getParameter("guardhomestate");
			String guardhomeCountry = request.getParameter("guardhomecountry");
			String guardhomeZipcode = request.getParameter("guardhomezipcode");
			String guardcode = request.getParameter("guardhomezipcode");
			String guardmobileNumber = request.getParameter("guardmobilenumber");
			String guardphoneNumber = request.getParameter("guardphonenumber");

			String admitdate = request.getParameter("admitdate");
			String admittime = request.getParameter("admittime");
			LocalTime localTime = LocalTime.parse(admittime);
			java.sql.Time admitTime = java.sql.Time.valueOf(localTime);
			System.out.println(admitTime);

			String patientstatus = request.getParameter("patientstatus");
			int doctor = Integer.parseInt(request.getParameter("doctor"));

			String[] symptoms = request.getParameterValues("symptoms[]");

			Part gurdianImage = request.getPart("guardianimage");
			String gurdianimageName = getSubmittedFileName(gurdianImage);
			String guardianimagepath = null;

			boolean s2;
			int i = 1;
			if ((gurdianimageName.isEmpty()) == false) {
				String uniq = String.valueOf(i);
				guardianimagepath = guardianid.concat(uniq).concat("@").concat(gurdianimageName);
				s2 = true;
			} else {
				s2 = false;
			}

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf1.format(t1);
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String date = sdf.format(t1);
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientid);

			DoctorVo doctorVo = new DoctorVo();
			doctorVo.setId(doctor);

			PatientOtherInfo patientOtherInfo = new PatientOtherInfo();
			patientOtherInfo.setPatientregistrationid(patientRegistretionVo);
			patientOtherInfo.setAdminid(adminVo);
			patientOtherInfo.setAdminttime(admitTime);
			patientOtherInfo.setAdmintdate(admitdate);
			patientOtherInfo.setDoctorid(doctorVo);
			patientOtherInfo.setJoiningdate(joiningdate);
			patientOtherInfo.setPatienttype("IN");
			patientOtherInfo.setStatus(patientstatus);
			
			PatientGuardianInfo patientGuardianInfo = new PatientGuardianInfo();
			patientGuardianInfo.setAdminid(adminVo);
			patientGuardianInfo.setGuardianfirstname(guardfirstName);
			patientGuardianInfo.setGuardiangender(guardgender);
			patientGuardianInfo.setGuardianhomecity(guardhomeCity);
			patientGuardianInfo.setGuardianhomecountry(guardhomeCountry);
			patientGuardianInfo.setGuardianhomeeaddrss(guardhomeAddress);
			patientGuardianInfo.setGuardianhomestate(guardhomeState);
			patientGuardianInfo.setGuardianhomezipcode(guardhomeZipcode);
			patientGuardianInfo.setGuardianid(guardianid);
			patientGuardianInfo.setGuardianimage(guardianimagepath);
			patientGuardianInfo.setGuardianlastname(guardLastName);
			patientGuardianInfo.setGuardianmidalname(guardMiddleName);
			patientGuardianInfo.setGuardianmobilecountrycode(guardcode);
			patientGuardianInfo.setGuardianmobileno(guardmobileNumber);
			patientGuardianInfo.setGuardianphoneno(guardphoneNumber);
			patientGuardianInfo.setPatientotherinfoid(patientOtherInfo);
			patientGuardianInfo.setRelationwithpatient(raletionwithpatient);
			
			PatientDao patientDao = new PatientDao();
			ArrayList<PatientOtherInfo> patentcheck = patientDao.patientCheck(patientOtherInfo);
			if (patentcheck.isEmpty() == true) {
				String chackdoctor = patientDao.patientInsert(patientOtherInfo , patientGuardianInfo);
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

						patientDao.insertSymptoms(commonDataVo1);
					}
					PatientImage(s2, guardianimagepath, gurdianImage);
					PatientDoctorVo patientVo = new PatientDoctorVo();
					patientVo.setAdminid(adminVo);
					patientVo.setDoctorid(doctorVo);
					patientVo.setPatientotherinfoid(patientOtherInfo);
					patientVo.setPatienttype("IN");
					
					ArrayList<PatientDoctorVo> patentchak = patientDao.checkPatientDoctor(patientVo);
					patientupdate = "true";
					if (patentchak.isEmpty() == true) {
						patientDao.patientDoctorInsert(patientVo);
					}
				}
			}
			else if (patentcheck.isEmpty() == false) {
				patientOtherInfo.setId(patentcheck.get(0).getId()); 
				patientGuardianInfo.setPatientotherinfoid(patientOtherInfo);
				ArrayList<PatientOtherInfo> gurdianlist = patientDao.guardianCheck(patientGuardianInfo);
				patientGuardianInfo.setId(gurdianlist.get(0).getId());
				String chackdoctor = patientDao.patientUpdate(patientOtherInfo , patientGuardianInfo);
				if (chackdoctor == "true") {
					PatientDoctorVo patientVo = new PatientDoctorVo();
					patientVo.setAdminid(adminVo);
					patientVo.setDoctorid(doctorVo);
					patientVo.setPatientotherinfoid(patientOtherInfo);
					patientVo.setPatienttype("IN");
					
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

	private void patientEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		System.out.println(patientId);

		PatientVo patientVo = new PatientVo();
		patientVo.setId(patientId);

		PatientDao patientDao = new PatientDao();
		ArrayList<PatientVo> patientList = patientDao.editPatient(patientVo);
		List<PatientList> list = new ArrayList<PatientList>();
		for (PatientVo patient : patientList) {
			int adminid = patient.getAdminid().getId();
			int patientid = patient.getPatientregistreationid().getId();
			String patinet = patient.getPatientregistreationid().getPatientid();
			String firstName = patient.getFirstname();
			String middleName = patient.getMidalname();
			String lastName = patient.getLastname();
			String date = patient.getBirthdate();
			String bloodgroup = patient.getBloodgroup();
			String gender = patient.getGender();
			String homeAddress = patient.getHomeeaddrss();
			String homeCity = patient.getHomecity();
			String homeState = patient.getHomestate();
			String homeCountry = patient.getHomecountry();
			String homeZipcode = patient.getHomezipcode();
			String standardCode = patient.getMobilecountrycode();
			String mobileNumber = patient.getMobileno();
			String phoneNumber = patient.getPhoneno();
			String email = patient.getEmail();
			String password = patient.getPassword();
			String userName = patient.getUsername();
			String profileimage = patient.getProfileimage();
			String profileimagename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String gurdianId = patient.getGuardianid();
			String gurdianFirstName = patient.getGuardianfirstname();
			String guardianmidalname = patient.getGuardianmidalname();
			String gurdianlastname = patient.getGuardianlastname();
			String guardiangander = patient.getGuardiangender();
			String guradianreletion = patient.getRelationwithpatient();
			String gurdianhomeaddress = patient.getGuardianhomeeaddrss();
			String gurdiancity = patient.getGuardianhomecity();
			String gurdiancountry = patient.getGuardianhomecountry();
			String gurdianstats = patient.getGuardianhomestate();
			String gurdianzipcode = patient.getGuardianhomezipcode();
			String gurdianmobile = patient.getGuardianmobileno();
			String gurdianphone = patient.getGuardianphoneno();
			String gurdianprofileimage = patient.getGuardianimage();
			String gurdianimagename = "";
			if (gurdianprofileimage != null) {
				int a = gurdianprofileimage.indexOf("@");
				a++;
				gurdianimagename = gurdianprofileimage.substring(a);
			}
			String admint = patient.getAdmintdate();
			String admintdate = admint.toString();
			java.sql.Time time = patient.getAdminttime();
			String adminttime = time.toString();
			String patientstatus = patient.getPatientstatus();
			int doctorid = patient.getDoctorid().getId();
			String joiningdate = patient.getJoiningdate();
			PatientList common = new PatientList();
			common.setPatientid(patinet.concat("-").concat(firstName));
			common.setId(patientId);
			common.setAdminid(adminid);
			common.setPatientintid(patientid);
			common.setFirstname(firstName);
			common.setMidalname(middleName);
			common.setLastname(lastName);
			common.setDate(date);
			common.setGender(gender);
			common.setBloodgroup(bloodgroup);
			common.setHomeeaddrss(homeAddress);
			common.setHomecity(homeCity);
			common.setHomestate(homeState);
			common.setHomecountry(homeCountry);
			common.setHomezipcode(homeZipcode);
			common.setMobilecountrycode(standardCode);
			common.setMobileno(mobileNumber);
			common.setPhoneno(phoneNumber);
			common.setEmail(email);
			common.setUsername(userName);
			common.setPassword(password);
			common.setProfileimage(profileimage);
			common.setProfileimagename(profileimagename);
			common.setGuardianid(gurdianId);
			common.setGuardianfirstname(gurdianFirstName);
			common.setGuardianmidalname(guardianmidalname);
			common.setGuardianlastname(gurdianlastname);
			common.setRelationwithpatient(guradianreletion);
			common.setGuardiangender(guardiangander);
			common.setGuardianhomeeaddrss(gurdianhomeaddress);
			common.setGuardianhomecity(gurdiancity);
			common.setGuardianhomecountry(gurdiancountry);
			common.setGuardianhomestate(gurdianstats);
			common.setGuardianhomezipcode(gurdianzipcode);
			common.setGuardianmobileno(gurdianmobile);
			common.setGuardianphoneno(gurdianphone);
			common.setGuardianimage(gurdianprofileimage);
			common.setGuardianimagename(gurdianimagename);
			common.setAdmintdate(admintdate);
			common.setAdminttime(adminttime);
			common.setDoctorid(doctorid);
			common.setPatientstatus(patientstatus);
			common.setJoiningdate(joiningdate);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void patientUpdate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int adminid = Integer.parseInt(request.getParameter("adminId"));
		int id = Integer.parseInt(request.getParameter("id"));
		int patientid = Integer.parseInt(request.getParameter("patientId"));
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstname");
		String middleName = request.getParameter("middlename");
		String lastName = request.getParameter("lastname");
		String dateofbirth = request.getParameter("dob");
		String bloodgroup = request.getParameter("blood_group");
		String gender = request.getParameter("gender");
		String homeAddress = request.getParameter("hometownaddress");
		String homeCity = request.getParameter("homecity");
		String homeState = request.getParameter("homestate");
		String homeCountry = request.getParameter("homecountry");
		String homeZipcode = request.getParameter("homezipcode");
		String standardCode = request.getParameter("standardcode");
		String mobileNumber = request.getParameter("mobilenumber");
		String phoneNumber = request.getParameter("phonenumber");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String guardianid = request.getParameter("guardianid");
		String guardfirstName = request.getParameter("guardfirstname");
		String guardMiddleName = request.getParameter("guardmiddlename");
		String guardLastName = request.getParameter("guardlastname");
		String guardgender = request.getParameter("guardgender");
		String raletionwithpatient = request.getParameter("raletionwithpatient");
		String guardhomeAddress = request.getParameter("guardhometownaddress");
		String guardhomeCity = request.getParameter("guardhomecity");
		String guardhomeState = request.getParameter("guardhomestate");
		String guardhomeCountry = request.getParameter("guardhomecountry");
		String guardhomeZipcode = request.getParameter("guardhomezipcode");
		String guardmobileNumber = request.getParameter("guardmobilenumber");
		String guardphoneNumber = request.getParameter("guardphonenumber");
		String editprofileImage = request.getParameter("editprofileImage");
		String editgurdianImage = request.getParameter("editgurdianImage");
		String admitdate = request.getParameter("admitdate");
		String joiningdate = request.getParameter("joiningdate");
		String admittime = request.getParameter("admittime");
		LocalTime localTime = LocalTime.parse(admittime);
		java.sql.Time admitTime = java.sql.Time.valueOf(localTime);
		System.out.println(admitTime);

		String patientstatus = request.getParameter("patientstatus");
		int doctor = Integer.parseInt(request.getParameter("doctor"));
		String[] symptoms = request.getParameterValues("symptoms[]");

		Part profileImage = request.getPart("profileimage");
		Part gurdianImage = request.getPart("gurdianimage");

		String profileImageName = getSubmittedFileName(profileImage);
		String gurdianimageName = getSubmittedFileName(gurdianImage);
		String profileImagepath = null;
		String guardianimagepath = null;

		boolean s, s2;
		int i = 1;
		if ((profileImageName.isEmpty()) == false) {
			String Path = getServletContext()
					.getRealPath(File.separator + SAVE_DIR_Images + File.separator + editprofileImage);
			File dir = new File(Path);
			dir.delete();
			String uniq = String.valueOf(i);
			profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
			s = true;
		} else {
			s = false;
			profileImagepath = editprofileImage;
		}
		if ((gurdianimageName.isEmpty()) == false) {
			String Path = getServletContext()
					.getRealPath(File.separator + SAVE_DIR_Guardian_Images + File.separator + editgurdianImage);
			File dir = new File(Path);
			dir.delete();
			String uniq = String.valueOf(i);
			guardianimagepath = userName.concat(uniq).concat("@").concat(gurdianimageName);
			s2 = true;
		} else {
			s2 = false;
			guardianimagepath = editgurdianImage;
		}

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setId(patientid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setId(doctor);

		PatientVo patientVo = new PatientVo();
		patientVo.setId(id);
		patientVo.setPatientregistreationid(patientRegistretionVo);
		patientVo.setFirstname(firstName);
		patientVo.setMidalname(middleName);
		patientVo.setLastname(lastName);
		patientVo.setBirthdate(dateofbirth);
		patientVo.setBloodgroup(bloodgroup);
		patientVo.setGender(gender);
		patientVo.setHomeeaddrss(homeAddress);
		patientVo.setHomecity(homeCity);
		patientVo.setHomestate(homeState);
		patientVo.setHomecountry(homeCountry);
		patientVo.setHomezipcode(homeZipcode);
		patientVo.setMobilecountrycode(standardCode);
		patientVo.setMobileno(mobileNumber);
		patientVo.setPhoneno(phoneNumber);
		patientVo.setEmail(email);
		patientVo.setUsername(userName);
		patientVo.setPassword(password);
		patientVo.setProfileimage(profileImagepath);
		patientVo.setGuardianfirstname(guardfirstName);
		patientVo.setGuardianmidalname(guardMiddleName);
		patientVo.setGuardianlastname(guardLastName);
		patientVo.setGuardianid(guardianid);
		patientVo.setGuardiangender(guardgender);
		patientVo.setRelationwithpatient(raletionwithpatient);
		patientVo.setGuardianhomeeaddrss(guardhomeAddress);
		patientVo.setGuardianhomecity(guardhomeCity);
		patientVo.setGuardianhomestate(guardhomeState);
		patientVo.setGuardianhomecountry(guardhomeCountry);
		patientVo.setGuardianhomezipcode(guardhomeZipcode);
		patientVo.setGuardianmobileno(guardmobileNumber);
		patientVo.setGuardianphoneno(guardphoneNumber);
		patientVo.setGuardianimage(guardianimagepath);
		patientVo.setAdmintdate(admitdate);
		patientVo.setAdminttime(admitTime);
		patientVo.setPatientstatus(patientstatus);
		patientVo.setJoiningdate(joiningdate);
		patientVo.setDoctorid(doctorVo);
		patientVo.setAdminid(adminVo);

		LoginVO loginvo = new LoginVO();
		loginvo.setPatientloginid(patientVo);
		loginvo.setEmail(email);
		loginvo.setPassword(password);
		loginvo.setUsername(userName);

		LoginDAO logdao = new LoginDAO();
		PatientDao patientDao = new PatientDao();
		ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
		if (emailchack.isEmpty() == false) {
			String chackpassword = logdao.loginupdatePassword(loginvo);
			if (chackpassword.equals("add")) {
				String checkpatient = patientDao.patientUpdateProfile(patientVo);
				if (checkpatient == "Add") {

					CommonDataVo commonDataVo = new CommonDataVo();
					commonDataVo.setSymptomspatientid(patientVo);
					patientDao.deletePatientSymptomes(commonDataVo);
					for (int j = 0; j < symptoms.length; j++) {

						int symptom = Integer.valueOf(symptoms[j]);
						SymptomsVo symptomsVo = new SymptomsVo();
						symptomsVo.setId(symptom);
						CommonDataVo commonDataVo1 = new CommonDataVo();
						commonDataVo1.setAdminid(adminVo);
						commonDataVo1.setSymptomspatientid(patientVo);
						commonDataVo1.setSymptomsid(symptomsVo);

						patientDao.insertSymptoms(commonDataVo);
					}
					patientupdate = "true";
					PatientImage(s, s2, profileImagepath, guardianimagepath, profileImage, gurdianImage);
				} else {
					System.out.println("patient profile was not update");
					patientupdate = "false";
				}
			}
		} else if (emailchack.isEmpty() == true) {
			String chack = logdao.accountantStaffLoginUpdate(loginvo);
			if (chack.equals("add")) {
				patientemail = "true";
				String checkpatient = patientDao.patientUpdateProfile(patientVo);
				if (checkpatient == "Add") {
					CommonDataVo commonDataVo = new CommonDataVo();
					commonDataVo.setSymptomspatientid(patientVo);
					patientDao.deletePatientSymptomes(commonDataVo);
					for (int j = 0; j < symptoms.length; j++) {

						int symptom = Integer.valueOf(symptoms[j]);
						SymptomsVo symptomsVo = new SymptomsVo();
						symptomsVo.setId(symptom);
						CommonDataVo commonDataVo1 = new CommonDataVo();
						commonDataVo1.setAdminid(adminVo);
						commonDataVo1.setSymptomspatientid(patientVo);
						commonDataVo1.setSymptomsid(symptomsVo);

						patientDao.insertSymptoms(commonDataVo);
					}
					patientupdate = "true";
					PatientImage(s, s2, profileImagepath, guardianimagepath, profileImage, gurdianImage);
				} else {
					System.out.println("patient profile was not update");
					patientupdate = "false";
				}
			}
		}
	}

	private void patientDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int patientId = Integer.parseInt(request.getParameter("patientId"));
			System.out.println(patientId);

			PatientVo patientVo = new PatientVo();
			patientVo.setId(patientId);

			LoginVO loginVO = new LoginVO();
			loginVO.setPatientloginid(patientVo);

			PatientDao patientDao = new PatientDao();
			ArrayList<PatientVo> patientList = patientDao.editPatient(patientVo);
			String profileimage = patientList.get(0).getProfileimage();
			String gurdianimage = patientList.get(0).getGuardianimage();

			String loginmessage = patientDao.deleteLogin(loginVO);

			if (loginmessage == "true") {
				String message = patientDao.deletePatient(patientVo);
				if (message == "true") {
					if ((profileimage.isEmpty()) == false) {
						String Path = getServletContext()
								.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileimage);
						File dir = new File(Path);
						dir.delete();
						String Path1 = getServletContext()
								.getRealPath(File.separator + SAVE_DIR_Guardian_Images + File.separator + gurdianimage);
						File dir1 = new File(Path1);
						dir1.delete();
					}
					System.out.println(message);
					String respose = "success";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				} else {
					System.out.println("delete not patient");
					String respose = "error";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				}
			} else {
				System.out.println("delete not patient");
				String respose = "error";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(respose);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}