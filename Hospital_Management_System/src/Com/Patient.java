package Com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

import DAO.DepartmentDao;
import DAO.DoctorDao;
import DAO.LoginDAO;
import DAO.PatientDoctorDao;
import VO.AdminVo;
import VO.DepartmentVo;
import VO.DoctorList;
import VO.DoctorVo;
import VO.LoginVO;
import VO.PatientDoctorVo;
import VO.PatientList;
import VO.PatientVo;
import VO.SpecializationVo;

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

	private static final String SAVE_DIR_Images = "Patient_Image";

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

	private void PatientImage(boolean s, boolean s2, String profileImagepath, String guarsianpath, Part profileImage,
			Part guardian) {
		try {
			if (s == true) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImagepath);
				profileImage.write(Path);
			}
			if (s2 == true) {
				String Path2 = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + guarsianpath);
				guardian.write(Path2);
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
			response.sendRedirect("NewFile.jsp");
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

	private void patientList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String patientupdate, patientemailidinvalid, patientemailid, patientusername;
		
		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy");
		String yearoflastdigital = sdf2.format(t1);
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("patientadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientVo patientVo = new PatientVo();
		patientVo.setAdminid(adminVo);

		PatientDao patientDao = new PatientDao();
		ArrayList<PatientVo> patientlist = patientDao.patientList(patientVo);
		ArrayList<PatientVo> getlastrecord = patientDao.getlastrecord();
		String newpsientid =getlastrecord.get(0).getPatientid();
		if (newpsientid != null) {
			String lastThreeDigits;
			if (newpsientid.length() > 3) {
				lastThreeDigits = newpsientid.substring(newpsientid.length() - 3);
			} else {
				lastThreeDigits = newpsientid;
			}
			int n = Integer.valueOf(lastThreeDigits);
			n++;
			int c = n;
			String s2 = String.valueOf(c);
			if (c >= 1 && c < 10) {
				System.out.println("-5-5-5-5--5-5-5-5--5-5-");
				newpsientid = "p".concat(yearoflastdigital).concat("00").concat(s2);
			} else if (c >= 10 && c < 100) {
				System.out.println("16416846sasadasdsadsadas9-9-9-9-9-9");
				newpsientid = "p".concat(yearoflastdigital).concat("0").concat(s2);
			} else if (c >= 100) {
				System.out.println("16416846sasadasdsadsadas9-9-9-9-9-9");
				newpsientid = "p".concat(yearoflastdigital).concat(s2);
			}
		} else {
			newpsientid = "p".concat(yearoflastdigital).concat("001");
		}
		PatientDoctorDao patientDoctorDao = new PatientDoctorDao();
		List<PatientList> list = new ArrayList<PatientList>();
		for (PatientVo patient : patientlist) {
			int id = patient.getId();
			String name = patient.getFirstname();
			String psientid = patient.getPatientid();
			String photo = patient.getProfileimage();
			String mobile = patient.getMobileno();
			String bloodgroup = patient.getBloodgroup();			
 			String email = patient.getEmail();
 			
 			patientVo.setId(id);
 			PatientDoctorVo patientDoctorVo = new PatientDoctorVo();
 			ArrayList<PatientDoctorVo> doctorlist = patientDoctorDao.patientDoctorList(patientDoctorVo);
 			for(PatientDoctorVo patientdoctor : doctorlist ) {
 				String doctorName = patientdoctor.getDoctorid().getFirstname();
 				int doctorid = patientdoctor.getDoctorid().getId();
 				
 				PatientList common = new PatientList();
 				common.setDoctorname(doctorName);
 				common.setDoctorid(doctorid);
 				list.add(common);
 			}
			PatientList common = new PatientList();
			common.setId(id);
			common.setFirstname(name);
			common.setDepartmentname(department);
			common.setSpecailizationname(specialization);
			common.setProfileimage(photo);
			common.setDegree(degree);
			common.setEmail(email);
			common.setMobileno(mobile);
			common.setDoctorupdate(doctorupdate);
			common.setDoctoremail(doctoremailid);
			common.setDoctoremailinvalid(doctoremailidinvalid);
			common.setDoctoruser(doctorusername);
			list.add(common);
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
			String patientupdate, patientemailidinvalid, patientemailid, patientusername;
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = (int) session.getAttribute("doctoradminid");
				String patientid = request.getParameter("pationtid");
				String middleName = request.getParameter("middlename");
				String firstName = request.getParameter("firstname");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
				java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
				String bloodgroup = request.getParameter("blood_group");
				String gender = request.getParameter("gender");
				String homeCity = request.getParameter("homecity");
				String homeAddress = request.getParameter("hometownaddress");
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
				String guardhomeAddress = request.getParameter("hometownaddress");
				String guardhomeCity = request.getParameter("guardhomecity");
				String guardhomeState = request.getParameter("guardhomestate");
				String guardhomeCountry = request.getParameter("guardhomecountry");
				String guardhomeZipcode = request.getParameter("guardhomezipcode");
				String guardstandardCode = request.getParameter("guardstandardcode");
				String guardmobileNumber = request.getParameter("guardmobilenumber");
				String guardphoneNumber = request.getParameter("guardphonenumber");

				String admitdate = request.getParameter("admitdate");
				java.sql.Date admitDate = java.sql.Date.valueOf(admitdate);
				String admittime = request.getParameter("admittime");
				java.sql.Time admitTime = java.sql.Time.valueOf(admittime);
				String patientstatus = request.getParameter("patientstatus");
				String symptoms = request.getParameter("symptoms");
				String[] doctorlist = request.getParameterValues("doctorlist[]");

				Part profileImage = request.getPart("profileimage");
				Part guardianimage = request.getPart("guardianimage");

				String profileImageName = getSubmittedFileName(profileImage);
				String guardianimageName = getSubmittedFileName(guardianimage);

				String profileImagepath = null;
				String guardianimagepath = null;

				boolean s;
				boolean s2;

				int i = 1;
				if ((profileImageName.isEmpty()) == false) {
					String uniq = String.valueOf(i);
					profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
					s = true;
				} else {
					s = false;
				}
				if ((guardianimageName.isEmpty()) == false) {
					i++;
					String uniq = String.valueOf(i);
					guardianimagepath = userName.concat(uniq).concat("@").concat(guardianimageName);
					s2 = true;
				} else {
					s2 = false;
				}

				Timestamp t1 = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String joiningdate = sdf.format(t1);

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);
				PatientVo patientVo = new PatientVo();
				patientVo.setPatientid(patientid);
				patientVo.setFirstname(firstName);
				patientVo.setMidalname(middleName);
				patientVo.setLastname(lastName);
				patientVo.setBirthdate(dateOfBirth);
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
				patientVo.setGuardianmobilecountrycode(guardstandardCode);
				patientVo.setGuardianmobileno(guardmobileNumber);
				patientVo.setGuardianphoneno(guardphoneNumber);
				patientVo.setGuardianimage(guardianimagepath);
				patientVo.setAdmintdate(admitDate);
				patientVo.setAdminttime(admitTime);
				patientVo.setPatientstatus(patientstatus);
				patientVo.setSymptoms(symptoms);
				patientVo.setJoiningdate(joiningdate);
				patientVo.setAdminid(adminVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setPatientid(patientVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Patient");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				System.out.println(emailchack.size());
				if (emailchack.isEmpty() == true) {
					patientemailid = "true";
					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
					System.out.println(usernamechack.size());
					if (usernamechack.isEmpty() == true) {
						PatientDao patientDao = new PatientDao();
						String chackdoctor = patientDao.patientInsert(patientVo, loginvo);
						if (chackdoctor == "true") {
							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
							File imageDir = new File(uploadImagePath);
							if (!imageDir.exists()) {
								imageDir.mkdirs();
							}
							String uploadDocumentPath = getServletContext()
									.getRealPath(File.separator + SAVE_DIR_Images);
							File documentdir = new File(uploadDocumentPath);
							if (!documentdir.exists()) {
								documentdir.mkdirs();
							}
							PatientImage(s, s2, profileImagepath, guardianimagepath, profileImage, guardianimage);
							patientupdate = "true";
							if ((doctorlist == null) == false) {
								for (int a = 0; a < doctorlist.length; a++) {
									int doctorid = Integer.parseInt(doctorlist[a]);

									DoctorVo doctorVo = new DoctorVo();
									doctorVo.setId(doctorid);

									PatientDoctorVo patientDoctorVo = new PatientDoctorVo();
									patientDoctorVo.setDoctorid(doctorVo);
									patientDoctorVo.setAdminid(adminVo);
									patientDoctorVo.setPatientid(patientVo);
									PatientDoctorDao patientDoctorDao = new PatientDoctorDao();
									patientDoctorDao.insert(patientDoctorVo);
								}
							} else {
								patientupdate = "false";
							}
						} else {
							patientusername = "false";
							patientupdate = "false";
						}
					} else {
						patientusername = "false";
						patientemailid = "false";
					}
				} else {
					patientusername = "false";
					patientemailidinvalid = "false";
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}