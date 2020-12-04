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
import DAO.NurseDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.CommonDataVo;
import VO.DepartmentVo;
import VO.DoctorList;
import VO.DoctorVo;
import VO.LoginVO;
import VO.NurseList;
import VO.NurseVo;
import VO.SpecializationVo;
import VO.Support_StaffList;
import VO.SymptomsVo;

/**
 * Servlet implementation class Nurse
 */
@WebServlet("/Nurse")
@MultipartConfig
public class Nurse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Nurse() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String nurseupdate = null;
	private String nurseemail = null;
	private String nurseuser = null;
	private String nurseemailinvalid = null;

	private static final String SAVE_DIR_Images = "User_Image";

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

	private void nurseImage(boolean s, String profileImagepath, Part profileImage) {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("nurseadminid", adminid);
			departmentListForNurse(request, response);
			response.sendRedirect("Admin_Nurse_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("nurselist")) {
			nurseList(request, response);
		}
		if (flag.equalsIgnoreCase("editNurse")) {
			nurseEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteNurse")) {
			nurseDelete(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		String flag1 = request.getParameter("firstname");
		System.out.println(flag1);
		if (flag.equalsIgnoreCase("insert")) {
			nurseInsert(request, response);
			nurseList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			nurseUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			nurseUserNameChack(request, response);
		}
	}

	private void nurseUserNameChack(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String nurseusername = request.getParameter("nurseusername1");
		System.out.println(nurseusername);
		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(nurseusername);

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

	private void departmentListForNurse(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("nurseadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setDepartmentadminid(adminVo);

		DepartmentDao departmentDao = new DepartmentDao();

		ArrayList<DepartmentVo> departmentlist = departmentDao.departmentList(departmentvo);
		System.out.println(departmentlist.size());
		session.setAttribute("departmentlist", departmentlist);
	}

	private void nurseList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("nurseadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		NurseVo nurseVo = new NurseVo();
		nurseVo.setAdminid(adminVo);

		NurseDao nurseDao = new NurseDao();
		ArrayList<NurseVo> nurselist = nurseDao.nurseList(nurseVo);
		List<NurseList> list = new ArrayList<NurseList>();
		for (NurseVo doctor : nurselist) {
			int id = doctor.getId();
			String name = doctor.getFirstname();
			String department = doctor.getDepartmentid().getDepartment();
			String photo = doctor.getProfileimage();
			String email = doctor.getEmail();
			String mobile = doctor.getMobileno();
			NurseList common = new NurseList();
			common.setId(id);
			common.setFirstname(name);
			common.setDepartmentname(department);
			common.setProfileimage(photo);
			common.setEmail(email);
			common.setMobileno(mobile);
			common.setNurseupdate(nurseupdate);
			common.setNurseemail(nurseemail);
			common.setNurseemailinvalid(nurseemailinvalid);
			common.setNurseuser(nurseuser);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void nurseInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = (int) session.getAttribute("nurseadminid");
				int departmentId = Integer.parseInt(request.getParameter("departmentid"));
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
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
				float charge = Float.parseFloat(request.getParameter("charge"));

				Part profileImage = request.getPart("profileimage");
				String profileImageName = getSubmittedFileName(profileImage);
				String profileImagepath = null;

				boolean s;
				int i = 1;
				if ((profileImageName.isEmpty()) == false) {
					String uniq = String.valueOf(i);
					profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
					s = true;
				} else {
					s = false;
				}

				Timestamp t1 = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String joiningdate = sdf.format(t1);

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);

				DepartmentVo departmentVo = new DepartmentVo();
				departmentVo.setId(departmentId);

				NurseVo nurseVo = new NurseVo();
				nurseVo.setFirstname(firstName);
				nurseVo.setMidalname(middleName);
				nurseVo.setLastname(lastName);
				nurseVo.setBirthdate(dateofbirth);
				nurseVo.setGender(gender);
				nurseVo.setHomeeaddrss(homeAddress);
				nurseVo.setHomecity(homeCity);
				nurseVo.setHomestate(homeState);
				nurseVo.setHomecountry(homeCountry);
				nurseVo.setHomezipcode(homeZipcode);
				nurseVo.setMobilecountrycode(standardCode);
				nurseVo.setMobileno(mobileNumber);
				nurseVo.setPhoneno(phoneNumber);
				nurseVo.setEmail(email);
				nurseVo.setUsername(userName);
				nurseVo.setPassword(password);
				nurseVo.setCharge(charge);
				nurseVo.setProfileimage(profileImagepath);
				nurseVo.setJoiningdate(joiningdate);
				nurseVo.setAdminid(adminVo);
				nurseVo.setDepartmentid(departmentVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setNurseloginid(nurseVo);
				loginvo.setEmail(email);
				loginvo.setAdminid(adminVo);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Nurse");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				System.out.println(emailchack.size());
				if (emailchack.isEmpty() == true) {
					nurseemail = "true";
					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
					System.out.println(usernamechack.size());
					if (usernamechack.isEmpty() == true) {
						NurseDao nurseDao = new NurseDao();
						String chackdoctor = nurseDao.nurseInsert(nurseVo, loginvo);
						if (chackdoctor == "true") {
							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
							File imageDir = new File(uploadImagePath);
							if (!imageDir.exists()) {
								imageDir.mkdirs();
							}
							nurseImage(s, profileImagepath, profileImage);
							AllDataCountVo allDataCountVo = new AllDataCountVo();
							allDataCountVo.setAdminid(adminVo);
							AllDataCountDao allDataCountDao = new AllDataCountDao();
							allDataCountDao.increaseData(allDataCountVo, "nurse");
							
							nurseupdate = "true";
						} else {
							nurseupdate = "false";
						}
					} else {
						nurseuser = "false";
						nurseupdate = "false";
					}
				} else {
					nurseupdate = "false";
					nurseuser = "false";
					nurseemail = "false";
				}
			} else {
				nurseupdate = "false";
				nurseuser = "false";
				nurseemailinvalid = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void nurseEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int nurseid = Integer.parseInt(request.getParameter("nurseid"));
		System.out.println(nurseid);

		NurseVo nurseVo = new NurseVo();
		nurseVo.setId(nurseid);

		NurseDao nurseDao = new NurseDao();
		ArrayList<NurseVo> nurselist = nurseDao.nurseEdit(nurseVo);
		List<NurseList> list = new ArrayList<NurseList>();
		for (NurseVo doctor : nurselist) {
			int adminid = doctor.getAdminid().getId();
			int departmentId = doctor.getDepartmentid().getId();
			String department = doctor.getDepartmentid().getDepartment();
			String firstName = doctor.getFirstname();
			String middleName = doctor.getMidalname();
			String lastName = doctor.getLastname();
			String date = doctor.getBirthdate();
			String gender = doctor.getGender();
			String homeAddress = doctor.getHomeeaddrss();
			String homeCity = doctor.getHomecity();
			String homeState = doctor.getHomestate();
			String homeCountry = doctor.getHomecountry();
			String homeZipcode = doctor.getHomezipcode();
			String standardCode = doctor.getMobilecountrycode();
			String mobileNumber = doctor.getMobileno();
			String phoneNumber = doctor.getPhoneno();
			String email = doctor.getEmail();
			String password = doctor.getPassword();
			String userName = doctor.getUsername();
			float charge = doctor.getCharge();
			String profileimage = doctor.getProfileimage();
			String profileimagename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String joiningdate = doctor.getJoiningdate();
			NurseList common = new NurseList();
			common.setId(nurseid);
			common.setAdminid(adminid);
			common.setDepartmentid(departmentId);
			common.setDepartmentname(department);
			common.setFirstname(firstName);
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
			common.setCharge(charge);
			common.setProfileimage(profileimage);
			common.setProfileimagename(profileimagename);
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

	private void nurseUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = Integer.parseInt(request.getParameter("adminid"));
				int id = Integer.parseInt(request.getParameter("nurseid"));
				int departmentId = Integer.parseInt(request.getParameter("departmentupdateid"));
				String joiningdate = request.getParameter("joinig");
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
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
				float charge = Float.parseFloat(request.getParameter("charge"));
				String editprofileImage = request.getParameter("editprofileImage");
				System.out.println(editprofileImage);

				Part profileImage = request.getPart("profileimage");
				String profileImageName = getSubmittedFileName(profileImage);
				System.out.println(profileImage);
				String profileImagepath = null;

				boolean s;
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

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);

				DepartmentVo departmentVo = new DepartmentVo();
				departmentVo.setId(departmentId);

				NurseVo nurseVo = new NurseVo();
				nurseVo.setId(id);
				nurseVo.setFirstname(firstName);
				nurseVo.setMidalname(middleName);
				nurseVo.setLastname(lastName);
				nurseVo.setBirthdate(dateofbirth);
				nurseVo.setGender(gender);
				nurseVo.setHomeeaddrss(homeAddress);
				nurseVo.setHomecity(homeCity);
				nurseVo.setHomestate(homeState);
				nurseVo.setHomecountry(homeCountry);
				nurseVo.setHomezipcode(homeZipcode);
				nurseVo.setMobilecountrycode(standardCode);
				nurseVo.setMobileno(mobileNumber);
				nurseVo.setPhoneno(phoneNumber);
				nurseVo.setEmail(email);
				nurseVo.setUsername(userName);
				nurseVo.setPassword(password);
				nurseVo.setCharge(charge);
				nurseVo.setProfileimage(profileImagepath);
				nurseVo.setJoiningdate(joiningdate);
				nurseVo.setAdminid(adminVo);
				nurseVo.setDepartmentid(departmentVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setNurseloginid(nurseVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);

				LoginDAO logdao = new LoginDAO();
				NurseDao nurseDao = new NurseDao();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
				if (emailchack.isEmpty() == false) {
					String chackpassword = logdao.loginupdatePassword(loginvo);
					if (chackpassword.equals("add")) {
						if (usernamechack.isEmpty() == false) {
							String adddoctor = nurseDao.nurseUpdateProfile(nurseVo);
							if (adddoctor == "Add") {
								nurseupdate = "true";
								nurseImage(s, profileImagepath, profileImage);
							} else {
								System.out.println("doctor profile was not update");
								nurseupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							String chackusername = logdao.loginupdateUsername(loginvo);
							if (chackusername.equals("add")) {
								String adddoctor = nurseDao.nurseUpdateProfile(nurseVo);
								if (adddoctor == "Add") {
									nurseupdate = "true";
									nurseImage(s, profileImagepath, profileImage);
								} else {
									nurseupdate = "false";
									System.out.println("doctor profile was not update");
								}
							} else {
								nurseuser = "false";
								System.out.println("User name was not update");
							}
						}
					}
				} else if (emailchack.isEmpty() == true) {
					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
					String chack = logdao.nurseLoginUpdate(loginvo);
					if (chack.equals("add")) {
						nurseemail = "true";
						if (usernamechack.isEmpty() == false) {
							String adddoctor = nurseDao.nurseUpdateProfile(nurseVo);
							if (adddoctor == "Add") {
								nurseImage(s, profileImagepath, profileImage);
								nurseupdate = "true";
							} else {
								System.out.println("doctor profile was not update");
								nurseupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							System.out.println(email);
							System.out.println("---------------------------------------------");
							String chackusername = logdao.loginupdateUsername(loginvo);
							System.out.println(chackusername);
							if (chackusername.equals("add")) {
								String adddoctor = nurseDao.nurseUpdateProfile(nurseVo);
								if (adddoctor == "Add") {
									nurseImage(s, profileImagepath, profileImage);
									nurseupdate = "true";
								} else {
									nurseupdate = "false";
									System.out.println("doctor profile was not update");
								}
							} else {
								nurseuser = "false";
							}
						}
					} else {
						nurseemail = "false";
						System.out.println("Email id was not update");
					}
				}
			} else {
				nurseemailinvalid = "false";
				System.out.println("Email id not valid");
			}
			List<NurseList> list = new ArrayList<NurseList>();
			NurseList common = new NurseList();
			common.setNurseupdate(nurseupdate);
			common.setNurseemail(nurseemail);
			common.setNurseemailinvalid(nurseemailinvalid);
			common.setNurseuser(nurseuser);
			list.add(common);
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

	private void nurseDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int nurseid = Integer.parseInt(request.getParameter("nurseid"));
			System.out.println(nurseid);

			NurseVo nurseVo = new NurseVo();
			nurseVo.setId(nurseid);

			LoginVO loginVO = new LoginVO();
			loginVO.setNurseloginid(nurseVo);

			NurseDao nurseDao = new NurseDao();
			ArrayList<NurseVo> nurselist = nurseDao.nurseEdit(nurseVo);
			String profileimage = nurselist.get(0).getProfileimage();
			
			String loginmessage = nurseDao.deleteLogin(loginVO);
			if (loginmessage == "true") {
				String message = nurseDao.deleteNurse(nurseVo);
				if (message == "true") {
					if ((profileimage.isEmpty()) == false) {
						String Path = getServletContext()
								.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileimage);
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
