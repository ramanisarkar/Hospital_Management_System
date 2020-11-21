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

import DAO.AllDataCountDao;
import DAO.DepartmentDao;
import DAO.DoctorDao;
import DAO.LoginDAO;
import DAO.SpecializationDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.DepartmentVo;
import VO.DoctorList;
import VO.DoctorVo;
import VO.LoginVO;
import VO.SpecializationList;
import VO.SpecializationVo;
import VO.Support_StaffList;

/**
 * Servlet implementation class Doctor
 */
@WebServlet("/Doctor")
@MultipartConfig
public class Doctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final String SAVE_DIR_Images = "Doctor_Image";
	private static final String SAVE_DIR_Document = "Doctor_Document";
	
	private	String doctorupdate = null;
	private	String doctoremailid = null;
	private	String doctorusername = null;
	private	String doctoremailidinvalid = null;
	
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

	private void DoctorImageOrDocumentUpload(boolean s, boolean s2, boolean s3, boolean s4, String profileImagepath,
			String curriculumvitaepath, String educationCertificatepath, String experienceCertificatepath,
			Part profileImage, Part curriculumvitae, Part educationCertificate, Part experienceCertificate) {
		try {
			if (s == true) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImagepath);
				profileImage.write(Path);
			}
			if (s2 == true) {
				String Path2 = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Document + File.separator + curriculumvitaepath);
				curriculumvitae.write(Path2);
			}
			if (s3 == true) {
				String Path3 = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Document + File.separator + educationCertificatepath);
				educationCertificate.write(Path3);
			}
			if (s4 == true) {
				String Path4 = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Document + File.separator + experienceCertificatepath);
				experienceCertificate.write(Path4);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
			session.setAttribute("doctoradminid", adminid);
			System.out.println("dsahdjgsadhlsagicasdouffabsdpf"+adminid);
			departmentListForDoctor(request, response);
			response.sendRedirect("Admin_Doctor_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("searchdepartment")) {
			searchDepartment(request, response);
		}
		if (flag.equalsIgnoreCase("doctorlist")) {
			doctorList(request, response);
		}
		if (flag.equalsIgnoreCase("editDoctor")) {
			doctorEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteDoctor")) {
			doctorDelete(request, response);
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
			doctorInsert(request, response);
			doctorList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			doctorUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			doctorUserNameChack(request, response);
		}
	}

	private void doctorUserNameChack(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String doctorusername = request.getParameter("doctorusername1");
		System.out.println(doctorusername);
		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(doctorusername);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
		System.out.println(usernamechack.size());
		List<DoctorList> list = new ArrayList<DoctorList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			DoctorList common = new DoctorList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO supportStaff : usernamechack) {
				String username = supportStaff.getUsername();
				String user = "false";
				DoctorList common = new DoctorList();
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

	private void departmentListForDoctor(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("doctoradminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setDepartmentadminid(adminVo);

		DepartmentDao departmentDao = new DepartmentDao();

		ArrayList<DepartmentVo> departmentlist = departmentDao.departmentList(departmentvo);
		System.out.println(departmentlist.size());
		session.setAttribute("departmentlist", departmentlist);
	}

	private void doctorList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("doctoradminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setAdminid(adminVo);

		DoctorDao doctorDao = new DoctorDao();
		ArrayList<DoctorVo> doctorlist = doctorDao.doctorList(doctorVo);
		List<DoctorList> list = new ArrayList<DoctorList>();
		for (DoctorVo doctor : doctorlist) {
			int id = doctor.getId();
			String name = doctor.getFirstname();
			String department = doctor.getDepartmentid().getDepartment();
			String specialization = doctor.getSpecializationid().getSpecialization();
			String photo = doctor.getProfileimage();
			String degree = doctor.getDegree();
			String email = doctor.getEmail();
			String mobile = doctor.getMobileno();
			DoctorList common = new DoctorList();
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

	private void searchDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int departmentid = Integer.parseInt(request.getParameter("department"));
		System.out.println(departmentid);
		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setId(departmentid);

		SpecializationVo specializationVo = new SpecializationVo();
		specializationVo.setDepartmentid(departmentvo);

		SpecializationDao specializationDao = new SpecializationDao();
		ArrayList<SpecializationVo> specializationlist = specializationDao.searchSpecailization(specializationVo);
		List<SpecializationList> list = new ArrayList<SpecializationList>();

		for (SpecializationVo specialization : specializationlist) {
			int id = specialization.getId();
			String special = specialization.getSpecialization();
			SpecializationList common = new SpecializationList();
			common.setId(id);
			common.setSpecialization(special);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void doctorInsert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		try {
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = (int) session.getAttribute("doctoradminid");
				int departmentId = Integer.parseInt(request.getParameter("departmentid"));
				int specializationId = Integer.parseInt(request.getParameter("specialization"));
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
				String gender = request.getParameter("gender");
				String officeAddress = request.getParameter("officeaddress");
				String officeCity = request.getParameter("officecity");
				String officeState = request.getParameter("officestate");
				String officeCountry = request.getParameter("officecountry");
				String officeZipcode = request.getParameter("officezipcode");
				String homeAddress = request.getParameter("hometownaddress");
				String homeCity = request.getParameter("homecity");
				String homeState = request.getParameter("homestate");
				String homeCountry = request.getParameter("homecountry");
				String homeZipcode = request.getParameter("homezipcode");
				String degree = request.getParameter("degree");
				String standardCode = request.getParameter("standardcode");
				String mobileNumber = request.getParameter("mobilenumber");
				String phoneNumber = request.getParameter("phonenumber");
				String userName = request.getParameter("username");
				String password = request.getParameter("password");
				float visitingcharge = Float.parseFloat(request.getParameter("visitingcharge"));
				float consultingcharge = Float.parseFloat(request.getParameter("consultingcharge"));

				Part profileImage = request.getPart("profileimage");
				Part curriculumvitae = request.getPart("curriculumvitae");
				Part educationCertificate = request.getPart("educationcertificate");
				Part experienceCertificate = request.getPart("experiencecertificate");

				String profileImageName = getSubmittedFileName(profileImage);
				String curriculumvitaeName = getSubmittedFileName(curriculumvitae);
				String educationCertificateName = getSubmittedFileName(educationCertificate);
				String experienceCertificateName = getSubmittedFileName(experienceCertificate);

				String profileImagepath = null;
				String curriculumvitaepath = null;
				String educationCertificatepath = null;
				String experienceCertificatepath = null;

				boolean s;
				boolean s2;
				boolean s3;
				boolean s4;
				int i = 1;
				if ((profileImageName.isEmpty()) == false) {
					String uniq = String.valueOf(i);
					profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
					s = true;
				} else {
					s = false;
				}
				if ((curriculumvitaeName.isEmpty()) == false) {
					i++;
					String uniq = String.valueOf(i);
					curriculumvitaepath = userName.concat(uniq).concat("@").concat(curriculumvitaeName);
					s2 = true;
				} else {
					s2 = false;
				}
				if ((educationCertificateName.isEmpty()) == false) {
					i++;
					String uniq = String.valueOf(i);
					educationCertificatepath = userName.concat(uniq).concat("@").concat(educationCertificateName);
					s3 = true;
				} else {
					s3 = false;
				}
				if ((experienceCertificateName.isEmpty()) == false) {
					i++;
					String uniq = String.valueOf(i);
					experienceCertificatepath = userName.concat(uniq).concat("@").concat(experienceCertificateName);
					s4 = true;
				} else {
					s4 = false;
				}

				Timestamp t1 = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String joiningdate = sdf.format(t1);

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);

				DepartmentVo departmentVo = new DepartmentVo();
				departmentVo.setId(departmentId);

				SpecializationVo specializationVo = new SpecializationVo();
				specializationVo.setId(specializationId);

				DoctorVo doctorVo = new DoctorVo();
				doctorVo.setFirstname(firstName);
				doctorVo.setMidalname(middleName);
				doctorVo.setLastname(lastName);
				doctorVo.setBirthdate(dateofbirth);
				doctorVo.setGender(gender);
				doctorVo.setOfficeaddrss(officeAddress);
				doctorVo.setOfficecity(officeCity);
				doctorVo.setOfficestate(officeState);
				doctorVo.setOfficecountry(officeCountry);
				doctorVo.setOfficezipcode(officeZipcode);
				doctorVo.setHomeeaddrss(homeAddress);
				doctorVo.setHomecity(homeCity);
				doctorVo.setHomestate(homeState);
				doctorVo.setHomecountry(homeCountry);
				doctorVo.setHomezipcode(homeZipcode);
				doctorVo.setDegree(degree);
				doctorVo.setMobilecountrycode(standardCode);
				doctorVo.setMobileno(mobileNumber);
				doctorVo.setPhoneno(phoneNumber);
				doctorVo.setEmail(email);
				doctorVo.setUsername(userName);
				doctorVo.setPassword(password);
				doctorVo.setVisitingcharge(visitingcharge);
				doctorVo.setConsultingcharge(consultingcharge);
				doctorVo.setProfileimage(profileImagepath);
				doctorVo.setCurriculumvitae(curriculumvitaepath);
				doctorVo.setEducationcertificate(educationCertificatepath);
				doctorVo.setExperiencecertificate(experienceCertificatepath);
				doctorVo.setJoiningdate(joiningdate);
				doctorVo.setAdminid(adminVo);
				doctorVo.setDepartmentid(departmentVo);
				doctorVo.setSpecializationid(specializationVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setDoctorid(doctorVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Doctor");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				System.out.println(emailchack.size());
				if (emailchack.isEmpty() == true) {
					doctoremailid = "true";
					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
					System.out.println(usernamechack.size());
					if (usernamechack.isEmpty() == true) {
						DoctorDao doctorDao = new DoctorDao();
						String chackdoctor = doctorDao.doctorInsert(doctorVo, loginvo);
						if (chackdoctor == "true") {
							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
							File imageDir = new File(uploadImagePath);
							if (!imageDir.exists()) {
								imageDir.mkdirs();
							}
							String uploadDocumentPath = getServletContext()
									.getRealPath(File.separator + SAVE_DIR_Document);
							File documentdir = new File(uploadDocumentPath);
							if (!documentdir.exists()) {
								documentdir.mkdirs();
							}
							DoctorImageOrDocumentUpload(s, s2, s3, s4, profileImagepath, curriculumvitaepath,
									educationCertificatepath, experienceCertificatepath, profileImage, curriculumvitae,
									educationCertificate, experienceCertificate);
							AllDataCountVo allDataCountVo = new AllDataCountVo();
							allDataCountVo.setAdminid(adminVo);
							AllDataCountDao allDataCountDao = new AllDataCountDao();
							allDataCountDao.increaseData(allDataCountVo, "doctor");
							doctorupdate = "true";
						} else {
							doctorupdate = "false";
						}
					} else {
						doctorusername = "false";
						doctorupdate = "false";
					}
				} else {
					doctorusername = "false";
					doctoremailid = "false";
				}
			} else {
				doctorusername = "false";
				doctoremailidinvalid = "false";
			}
			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	private void doctorEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int doctorid = Integer.parseInt(request.getParameter("doctorid"));
		System.out.println(doctorid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setId(doctorid);

		DoctorDao doctorDao = new DoctorDao();
		ArrayList<DoctorVo> doctorlist = doctorDao.doctorEdit(doctorVo);
		List<DoctorList> list = new ArrayList<DoctorList>();
		for (DoctorVo doctor : doctorlist) {
			int adminid = doctor.getAdminid().getId();
			int departmentId = doctor.getDepartmentid().getId();
			int specializationId = doctor.getSpecializationid().getId();
			String department = doctor.getDepartmentid().getDepartment();
			String specialization = doctor.getSpecializationid().getSpecialization();
			String firstName = doctor.getFirstname();
			String middleName = doctor.getMidalname();
			String lastName = doctor.getLastname();
			String date= doctor.getBirthdate();
			String gender = doctor.getGender();
			String officeAddress = doctor.getOfficeaddrss();
			String officeCity = doctor.getOfficecity();
			String officeState = doctor.getOfficestate();
			String officeCountry = doctor.getOfficecountry();
			String officeZipcode = doctor.getOfficezipcode();
			String homeAddress = doctor.getHomeeaddrss();
			String homeCity = doctor.getHomecity();
			String homeState = doctor.getHomestate();
			String homeCountry = doctor.getHomecountry();
			String homeZipcode = doctor.getHomezipcode();
			String degree = doctor.getDegree();
			String standardCode = doctor.getMobilecountrycode();
			String mobileNumber = doctor.getMobileno();
			String phoneNumber = doctor.getPhoneno();
			String email = doctor.getEmail();
			String password = doctor.getPassword();
			String userName = doctor.getUsername();
			float visitingcharge = doctor.getVisitingcharge();
			float consultingcharge = doctor.getConsultingcharge();
			String profileimage = doctor.getProfileimage();
			String profileimagename = "";
			String educationcertificatename = "";
			String experiencecertificatename = "";
			String curriculumvitaename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String curriculumvitae = doctor.getCurriculumvitae();
			System.out.println(curriculumvitae);
			if (curriculumvitae != null) {
				int b = curriculumvitae.indexOf("@");
				b++;
				curriculumvitaename = curriculumvitae.substring(b);
			}
			String educationcertificate = doctor.getEducationcertificate();
			if (educationcertificate != null) {
				int c = educationcertificate.indexOf("@");
				c++;
				educationcertificatename = educationcertificate.substring(c);
			}
			String experiencecertificate = doctor.getExperiencecertificate();
			if (experiencecertificate != null) {
				int d = experiencecertificate.indexOf("@");
				d++;
				experiencecertificatename = experiencecertificate.substring(d);
			}
			String joiningdate = doctor.getJoiningdate();
			DoctorList common = new DoctorList();
			common.setId(doctorid);
			common.setAdminid(adminid);
			common.setDepartmentid(departmentId);
			common.setDepartmentname(department);
			common.setSpecializationid(specializationId);
			common.setSpecailizationname(specialization);
			common.setFirstname(firstName);
			common.setMidalname(middleName);
			common.setLastname(lastName);
			common.setDate(date);
			common.setGender(gender);
			common.setOfficeaddrss(officeAddress);
			common.setOfficecity(officeCity);
			common.setOfficestate(officeState);
			common.setOfficecountry(officeCountry);
			common.setOfficezipcode(officeZipcode);
			common.setHomeeaddrss(homeAddress);
			common.setHomecity(homeCity);
			common.setHomestate(homeState);
			common.setHomecountry(homeCountry);
			common.setHomezipcode(homeZipcode);
			common.setDegree(degree);
			common.setMobilecountrycode(standardCode);
			common.setMobileno(mobileNumber);
			common.setPhoneno(phoneNumber);
			common.setEmail(email);
			common.setUsername(userName);
			common.setPassword(password);
			common.setVisitingcharge(visitingcharge);
			common.setConsultingcharge(consultingcharge);
			common.setProfileimage(profileimage);
			common.setProfileimagename(profileimagename);
			common.setCurriculumvitae(curriculumvitae);
			common.setCurriculumvitaename(curriculumvitaename);
			common.setEducationcertificate(educationcertificate);
			common.setEducationcertificatename(educationcertificatename);
			common.setExperiencecertificate(experiencecertificate);
			common.setExperiencecertificatename(experiencecertificatename);
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

	private void doctorUpdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = Integer.parseInt(request.getParameter("adminid"));
				int id = Integer.parseInt(request.getParameter("doctorid"));
				int departmentId = Integer.parseInt(request.getParameter("departmentupdateid"));
				int specializationId = Integer.parseInt(request.getParameter("specialization"));
				String joiningdate = request.getParameter("joinig");
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
				String gender = request.getParameter("gender");
				String officeAddress = request.getParameter("officeaddress");
				String officeCity = request.getParameter("officecity");
				String officeState = request.getParameter("officestate");
				String officeCountry = request.getParameter("officecountry");
				String officeZipcode = request.getParameter("officezipcode");
				String homeAddress = request.getParameter("hometownaddress");
				String homeCity = request.getParameter("homecity");
				String homeState = request.getParameter("homestate");
				String homeCountry = request.getParameter("homecountry");
				String homeZipcode = request.getParameter("homezipcode");
				String degree = request.getParameter("degree");
				String standardCode = request.getParameter("standardcode");
				String mobileNumber = request.getParameter("mobilenumber");
				String phoneNumber = request.getParameter("phonenumber");
				String userName = request.getParameter("username");
				String password = request.getParameter("password");
				float visitingcharge = Float.parseFloat(request.getParameter("visitingcharge"));
				float consultingcharge = Float.parseFloat(request.getParameter("consultingcharge"));
				String editprofileImage = request.getParameter("editprofileImage");
				String editcurriculumvitae = request.getParameter("editcurriculumvitae");
				String editeducationCertificate = request.getParameter("editeducationCertificate");
				String editexperienceCertificate = request.getParameter("editexperienceCertificate");

				Part profileImage = request.getPart("profileimage");
				Part curriculumvitae = request.getPart("curriculumvitae");
				Part educationCertificate = request.getPart("educationcertificate");
				Part experienceCertificate = request.getPart("experiencecertificate");

				String profileImageName = getSubmittedFileName(profileImage);
				String curriculumvitaeName = getSubmittedFileName(curriculumvitae);
				String educationCertificateName = getSubmittedFileName(educationCertificate);
				String experienceCertificateName = getSubmittedFileName(experienceCertificate);

				String profileImagepath = null;
				String curriculumvitaepath = null;
				String educationCertificatepath = null;
				String experienceCertificatepath = null;

				boolean s;
				boolean s2;
				boolean s3;
				boolean s4;
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
				if ((curriculumvitaeName.isEmpty()) == false) {
					String Path = getServletContext()
							.getRealPath(File.separator + SAVE_DIR_Document + File.separator + editcurriculumvitae);
					File dir = new File(Path);
					dir.delete();
					i++;
					String uniq = String.valueOf(i);
					curriculumvitaepath = userName.concat(uniq).concat("@").concat(curriculumvitaeName);
					s2 = true;
				} else {
					s2 = false;
					curriculumvitaepath = editcurriculumvitae;
				}
				if ((educationCertificateName.isEmpty()) == false) {
					String Path = getServletContext().getRealPath(
							File.separator + SAVE_DIR_Document + File.separator + editeducationCertificate);
					File dir = new File(Path);
					dir.delete();
					i++;
					String uniq = String.valueOf(i);
					educationCertificatepath = userName.concat(uniq).concat("@").concat(educationCertificateName);
					s3 = true;
				} else {
					s3 = false;
					educationCertificatepath = editeducationCertificate;
				}
				if ((experienceCertificateName.isEmpty()) == false) {
					String Path = getServletContext().getRealPath(
							File.separator + SAVE_DIR_Document + File.separator + editexperienceCertificate);
					File dir = new File(Path);
					dir.delete();
					i++;
					String uniq = String.valueOf(i);
					experienceCertificatepath = userName.concat(uniq).concat("@").concat(experienceCertificateName);
					s4 = true;
				} else {
					s4 = false;
					experienceCertificatepath = editexperienceCertificate;
				}

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);

				DepartmentVo departmentVo = new DepartmentVo();
				departmentVo.setId(departmentId);

				SpecializationVo specializationVo = new SpecializationVo();
				specializationVo.setId(specializationId);

				DoctorVo doctorVo = new DoctorVo();
				doctorVo.setId(id);
				doctorVo.setFirstname(firstName);
				doctorVo.setMidalname(middleName);
				doctorVo.setLastname(lastName);
				doctorVo.setBirthdate(dateofbirth);
				doctorVo.setGender(gender);
				doctorVo.setOfficeaddrss(officeAddress);
				doctorVo.setOfficecity(officeCity);
				doctorVo.setOfficestate(officeState);
				doctorVo.setOfficecountry(officeCountry);
				doctorVo.setOfficezipcode(officeZipcode);
				doctorVo.setHomeeaddrss(homeAddress);
				doctorVo.setHomecity(homeCity);
				doctorVo.setHomestate(homeState);
				doctorVo.setHomecountry(homeCountry);
				doctorVo.setHomezipcode(homeZipcode);
				doctorVo.setDegree(degree);
				doctorVo.setMobilecountrycode(standardCode);
				doctorVo.setMobileno(mobileNumber);
				doctorVo.setPhoneno(phoneNumber);
				doctorVo.setEmail(email);
				doctorVo.setUsername(userName);
				doctorVo.setPassword(password);
				doctorVo.setVisitingcharge(visitingcharge);
				doctorVo.setConsultingcharge(consultingcharge);
				doctorVo.setProfileimage(profileImagepath);
				doctorVo.setCurriculumvitae(curriculumvitaepath);
				doctorVo.setEducationcertificate(educationCertificatepath);
				doctorVo.setExperiencecertificate(experienceCertificatepath);
				doctorVo.setJoiningdate(joiningdate);
				doctorVo.setAdminid(adminVo);
				doctorVo.setDepartmentid(departmentVo);
				doctorVo.setSpecializationid(specializationVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setDoctorid(doctorVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Doctor");

				LoginDAO logdao = new LoginDAO();
				DoctorDao doctorDao = new DoctorDao();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
				if (emailchack.isEmpty() == false) {
					String chackpassword = logdao.loginupdatePassword(loginvo);
					if (chackpassword.equals("add")) {
						if (usernamechack.isEmpty() == false) {
							String adddoctor = doctorDao.doctorUpdateProfile(doctorVo);
							if (adddoctor == "Add") {
								doctorupdate = "true";
								DoctorImageOrDocumentUpload(s, s2, s3, s4, profileImagepath, curriculumvitaepath,
										educationCertificatepath, experienceCertificatepath, profileImage,
										curriculumvitae, educationCertificate, experienceCertificate);
							} else {
								System.out.println("doctor profile was not update");
								doctorupdate = "false";
								session.setAttribute("doctoremailexist", "true");
							}
						} else if (usernamechack.isEmpty() == true) {
							String chackusername = logdao.loginupdateUsername(loginvo);
							if (chackusername.equals("add")) {
								String adddoctor = doctorDao.doctorUpdateProfile(doctorVo);
								if (adddoctor == "Add") {
									doctorupdate = "true";
									DoctorImageOrDocumentUpload(s, s2, s3, s4, profileImagepath, curriculumvitaepath,
											educationCertificatepath, experienceCertificatepath, profileImage,
											curriculumvitae, educationCertificate, experienceCertificate);
								} else {
									doctorupdate = "false";
									System.out.println("doctor profile was not update");
								}
							} else {
								doctorusername = "false";
								System.out.println("User name was not update");
							}
						}
					}
				} else if (emailchack.isEmpty() == true) {
					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
					String chack = logdao.doctorLoginUpdate(loginvo);
					if (chack.equals("add")) {
						doctoremailid = "true";
						if (usernamechack.isEmpty() == false) {
							String adddoctor = doctorDao.doctorUpdateProfile(doctorVo);
							if (adddoctor == "Add") {
								DoctorImageOrDocumentUpload(s, s2, s3, s4, profileImagepath, curriculumvitaepath,
										educationCertificatepath, experienceCertificatepath, profileImage,
										curriculumvitae, educationCertificate, experienceCertificate);
								doctorupdate = "true";
							} else {
								System.out.println("doctor profile was not update");
								doctorupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							System.out.println(email);
							System.out.println("---------------------------------------------");
							String chackusername = logdao.loginupdateUsername(loginvo);
							System.out.println(chackusername);
							if (chackusername.equals("add")) {
								String adddoctor = doctorDao.doctorUpdateProfile(doctorVo);
								if (adddoctor == "Add") {
									DoctorImageOrDocumentUpload(s, s2, s3, s4, profileImagepath, curriculumvitaepath,
											educationCertificatepath, experienceCertificatepath, profileImage,
											curriculumvitae, educationCertificate, experienceCertificate);
									doctorupdate = "true";
								} else {
									doctorupdate = "false";
									System.out.println("doctor profile was not update");
								}
							} else {
								doctorusername = "false";
								session.setAttribute("doctorusernameexist", "true");
							}
						}
					} else {
						doctoremailid = "false";
						System.out.println("Email id was not update");
					}
				}
			} else {
				doctoremailidinvalid = "false";
				System.out.println("Email id not valid");
			}
			List<DoctorList> list = new ArrayList<DoctorList>();
			DoctorList common = new DoctorList();
			common.setDoctorupdate(doctorupdate);
			common.setDoctoremail(doctoremailid);
			common.setDoctoremailinvalid(doctoremailidinvalid);
			common.setDoctoruser(doctorusername);
			list.add(common);
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			System.out.println("ioexapation");
		}
	}

	private void doctorDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int doctorid = Integer.parseInt(request.getParameter("doctorid"));
			System.out.println(doctorid);

			DoctorVo doctorVo = new DoctorVo();
			doctorVo.setId(doctorid);

			LoginVO loginVO = new LoginVO();
			loginVO.setDoctorid(doctorVo);
			DoctorDao doctorDao = new DoctorDao();
			ArrayList<DoctorVo> doctorlist = doctorDao.doctorEdit(doctorVo);
			String profileImageName = doctorlist.get(0).getProfileimage();
			String curriculumvitaeName = doctorlist.get(0).getCurriculumvitae();
			String educationCertificateName = doctorlist.get(0).getEducationcertificate();
			String experienceCertificateName = doctorlist.get(0).getExperiencecertificate();

			
			String loginmessage = doctorDao.deleteLogin(loginVO);

			if (loginmessage == "true") {
				String message = doctorDao.deleteDoctor(doctorVo);
				if (message == "true") {
					if ((profileImageName.isEmpty()) == false) {
						String Path = getServletContext()
								.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImageName);
						File dir = new File(Path);
						dir.delete();
					}
					if ((curriculumvitaeName.isEmpty()) == false) {
						String Path = getServletContext()
								.getRealPath(File.separator + SAVE_DIR_Document + File.separator + curriculumvitaeName);
						File dir = new File(Path);
						dir.delete();
					}
					if ((educationCertificateName.isEmpty()) == false) {
						String Path = getServletContext().getRealPath(
								File.separator + SAVE_DIR_Document + File.separator + educationCertificateName);
						File dir = new File(Path);
						dir.delete();
					}
					if ((experienceCertificateName.isEmpty()) == false) {
						String Path = getServletContext().getRealPath(
								File.separator + SAVE_DIR_Document + File.separator + experienceCertificateName);
						File dir = new File(Path);
						dir.delete();
					}
					System.out.println(message);
					String respose = "seccess";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				} else {
					String respose = "error";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				}

			} else {
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
