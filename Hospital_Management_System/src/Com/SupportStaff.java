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
import DAO.LoginDAO;
import DAO.NurseDao;
import DAO.SupportStaffDao;
import VO.AdminVo;
import VO.DepartmentVo;
import VO.LoginVO;
import VO.NurseList;
import VO.NurseVo;
import VO.Support_StaffList;
import VO.Support_StaffVo;

/**
 * Servlet implementation class SupportStaff
 */
@WebServlet("/SupportStaff")
@MultipartConfig
public class SupportStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SupportStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String supportstaffeupdate = null;
	private String supportstaffemail = null;
	private String supportstaffuser = null;
	private String supportstaffemailinvalid = null;

	private static final String SAVE_DIR_Images = "Support_Staff_Image";

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

	private void supportstaffImage(boolean s, String profileImagepath, Part profileImage) {
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
			session.setAttribute("supportstaffadminid", adminid);
			departmentListForSupportStaff(request, response);
			response.sendRedirect("Admin_Support_Staff_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("supporatStaffList")) {
			supportStaffList(request, response);
		}
		if (flag.equalsIgnoreCase("editSupportStaff")) {
			supportStaffEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteSupportStaff")) {
			supportStaffDelete(request, response);
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
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			supportStaffInsert(request, response);
			supportStaffList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			supportStaffUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			supportStaffUserNameChack(request, response);
		}
	}

	private void supportStaffUserNameChack(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String supportstaffusername = request.getParameter("supportstaffusername1");
		System.out.println(supportstaffusername);
		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(supportstaffusername);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
		System.out.println(usernamechack.size());
		List<Support_StaffList> list = new ArrayList<Support_StaffList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			Support_StaffList common = new Support_StaffList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO supportStaff : usernamechack) {
				String username = supportStaff.getUsername();
				String user = "false";
				Support_StaffList common = new Support_StaffList();
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

	private void departmentListForSupportStaff(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("supportstaffadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setDepartmentadminid(adminVo);

		DepartmentDao departmentDao = new DepartmentDao();

		ArrayList<DepartmentVo> departmentlist = departmentDao.departmentList(departmentvo);
		System.out.println(departmentlist.size());
		session.setAttribute("departmentlist", departmentlist);
	}

	private void supportStaffList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("supportstaffadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		Support_StaffVo support_StaffVo = new Support_StaffVo();
		support_StaffVo.setAdminid(adminVo);

		SupportStaffDao supportStaffDao = new SupportStaffDao();
		ArrayList<Support_StaffVo> supportStafflist = supportStaffDao.supportStaffList(support_StaffVo);
		List<Support_StaffList> list = new ArrayList<Support_StaffList>();
		for (Support_StaffVo supportStaff : supportStafflist) {
			int id = supportStaff.getId();
			String name = supportStaff.getFirstname();
			String department = supportStaff.getDepartmentid().getDepartment();
			String photo = supportStaff.getProfileimage();
			String email = supportStaff.getEmail();
			String mobile = supportStaff.getMobileno();
			Support_StaffList common = new Support_StaffList();
			common.setId(id);
			common.setFirstname(name);
			common.setDepartmentname(department);
			common.setProfileimage(photo);
			common.setEmail(email);
			common.setMobileno(mobile);
			common.setSupportstaffeupdate(supportstaffeupdate);
			common.setSupportstaffeemail(supportstaffemail);
			common.setSupportstaffemailinvalid(supportstaffemailinvalid);
			common.setSupportstaffuser(supportstaffuser);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void supportStaffInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = (int) session.getAttribute("supportstaffadminid");
				int departmentId = Integer.parseInt(request.getParameter("departmentid"));
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
				java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
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
				String charge = request.getParameter("charge");

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

				Support_StaffVo support_StaffVo = new Support_StaffVo();
				support_StaffVo.setFirstname(firstName);
				support_StaffVo.setMidalname(middleName);
				support_StaffVo.setLastname(lastName);
				support_StaffVo.setBirthdate(dateOfBirth);
				support_StaffVo.setGender(gender);
				support_StaffVo.setHomeeaddrss(homeAddress);
				support_StaffVo.setHomecity(homeCity);
				support_StaffVo.setHomestate(homeState);
				support_StaffVo.setHomecountry(homeCountry);
				support_StaffVo.setHomezipcode(homeZipcode);
				support_StaffVo.setMobilecountrycode(standardCode);
				support_StaffVo.setMobileno(mobileNumber);
				support_StaffVo.setPhoneno(phoneNumber);
				support_StaffVo.setEmail(email);
				support_StaffVo.setUsername(userName);
				support_StaffVo.setPassword(password);
				support_StaffVo.setCharge(charge);
				support_StaffVo.setProfileimage(profileImagepath);
				support_StaffVo.setJoiningdate(joiningdate);
				support_StaffVo.setAdminid(adminVo);
				support_StaffVo.setDepartmentid(departmentVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setSupportstaffloginid(support_StaffVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("SupportStaff");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				System.out.println(emailchack.size());
				if (emailchack.isEmpty() == true) {
					supportstaffemail = "true";
					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
					System.out.println(usernamechack.size());
					if (usernamechack.isEmpty() == true) {
						SupportStaffDao supportStaffDao = new SupportStaffDao();
						String chackdoctor = supportStaffDao.supportStaffInsert(support_StaffVo, loginvo);
						if (chackdoctor == "true") {
							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
							File imageDir = new File(uploadImagePath);
							if (!imageDir.exists()) {
								imageDir.mkdirs();
							}
							supportstaffImage(s, profileImagepath, profileImage);
							supportstaffeupdate = "true";
						} else {
							supportstaffeupdate = "false";
						}
					} else {
						supportstaffuser = "false";
						supportstaffeupdate = "false";
					}
				} else {
					supportstaffeupdate = "false";
					supportstaffuser = "false";
					supportstaffemail = "false";
				}
			} else {
				supportstaffeupdate = "false";
				supportstaffuser = "false";
				supportstaffemailinvalid = "false";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void supportStaffEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int supportStaffId = Integer.parseInt(request.getParameter("supportStaffId"));
		System.out.println(supportStaffId);

		Support_StaffVo support_StaffVo = new Support_StaffVo();
		support_StaffVo.setId(supportStaffId);

		SupportStaffDao supportStaffDao = new SupportStaffDao();
		ArrayList<Support_StaffVo> supportStafflist = supportStaffDao.supportStaffEdit(support_StaffVo);
		List<Support_StaffList> list = new ArrayList<Support_StaffList>();
		for (Support_StaffVo supportStaff : supportStafflist) {
			int adminid = supportStaff.getAdminid().getId();
			int departmentId = supportStaff.getDepartmentid().getId();
			String department = supportStaff.getDepartmentid().getDepartment();
			String firstName = supportStaff.getFirstname();
			String middleName = supportStaff.getMidalname();
			String lastName = supportStaff.getLastname();
			java.sql.Date dateofbirth = supportStaff.getBirthdate();
			String date = dateofbirth.toString();
			String gender = supportStaff.getGender();
			String homeAddress = supportStaff.getHomeeaddrss();
			String homeCity = supportStaff.getHomecity();
			String homeState = supportStaff.getHomestate();
			String homeCountry = supportStaff.getHomecountry();
			String homeZipcode = supportStaff.getHomezipcode();
			String standardCode = supportStaff.getMobilecountrycode();
			String mobileNumber = supportStaff.getMobileno();
			String phoneNumber = supportStaff.getPhoneno();
			String email = supportStaff.getEmail();
			String password = supportStaff.getPassword();
			String userName = supportStaff.getUsername();
			String charge = supportStaff.getCharge();
			String profileimage = supportStaff.getProfileimage();
			String profileimagename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String joiningdate = supportStaff.getJoiningdate();
			Support_StaffList common = new Support_StaffList();
			common.setId(supportStaffId);
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

	private void supportStaffUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = Integer.parseInt(request.getParameter("adminid"));
				int id = Integer.parseInt(request.getParameter("supportstaffid"));
				int departmentId = Integer.parseInt(request.getParameter("departmentupdateid"));
				String joiningdate = request.getParameter("joinig");
				String firstName = request.getParameter("firstname");
				String middleName = request.getParameter("middlename");
				String lastName = request.getParameter("lastname");
				String dateofbirth = request.getParameter("dob");
				java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
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
				String charge = request.getParameter("charge");
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

				Support_StaffVo support_StaffVo = new Support_StaffVo();
				support_StaffVo.setId(id);
				support_StaffVo.setFirstname(firstName);
				support_StaffVo.setMidalname(middleName);
				support_StaffVo.setLastname(lastName);
				support_StaffVo.setBirthdate(dateOfBirth);
				support_StaffVo.setGender(gender);
				support_StaffVo.setHomeeaddrss(homeAddress);
				support_StaffVo.setHomecity(homeCity);
				support_StaffVo.setHomestate(homeState);
				support_StaffVo.setHomecountry(homeCountry);
				support_StaffVo.setHomezipcode(homeZipcode);
				support_StaffVo.setMobilecountrycode(standardCode);
				support_StaffVo.setMobileno(mobileNumber);
				support_StaffVo.setPhoneno(phoneNumber);
				support_StaffVo.setEmail(email);
				support_StaffVo.setUsername(userName);
				support_StaffVo.setPassword(password);
				support_StaffVo.setCharge(charge);
				support_StaffVo.setProfileimage(profileImagepath);
				support_StaffVo.setJoiningdate(joiningdate);
				support_StaffVo.setAdminid(adminVo);
				support_StaffVo.setDepartmentid(departmentVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setSupportstaffloginid(support_StaffVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);

				LoginDAO logdao = new LoginDAO();
				SupportStaffDao supportStaffDao = new SupportStaffDao();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
				if (emailchack.isEmpty() == false) {
					String chackpassword = logdao.loginupdatePassword(loginvo);
					if (chackpassword.equals("add")) {
						if (usernamechack.isEmpty() == false) {
							String addsupportstaff = supportStaffDao.supportStaffUpdateProfile(support_StaffVo);
							if (addsupportstaff == "Add") {
								supportstaffeupdate = "true";
								supportstaffImage(s, profileImagepath, profileImage);
							} else {
								System.out.println("supportStaff profile was not update");
								supportstaffeupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							String chackusername = logdao.loginupdateUsername(loginvo);
							if (chackusername.equals("add")) {
								String addsupportstaff = supportStaffDao.supportStaffUpdateProfile(support_StaffVo);
								if (addsupportstaff == "Add") {
									supportstaffeupdate = "true";
									supportstaffImage(s, profileImagepath, profileImage);
								} else {
									supportstaffeupdate = "false";
									System.out.println("supportStaff profile was not update");
								}
							} else {
								supportstaffeupdate = "false";
								System.out.println("User name was not update");
							}
						}
					}
				} else if (emailchack.isEmpty() == true) {
					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
					String chack = logdao.supportStaffLoginUpdate(loginvo);
					if (chack.equals("add")) {
						supportstaffemail = "true";
						if (usernamechack.isEmpty() == false) {
							String addsupportstaff = supportStaffDao.supportStaffUpdateProfile(support_StaffVo);
							if (addsupportstaff == "Add") {
								supportstaffImage(s, profileImagepath, profileImage);
								supportstaffeupdate = "true";
							} else {
								System.out.println("doctor profile was not update");
								supportstaffeupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							System.out.println(email);
							System.out.println("---------------------------------------------");
							String chackusername = logdao.loginupdateUsername(loginvo);
							System.out.println(chackusername);
							if (chackusername.equals("add")) {

								String addsupportstaff = supportStaffDao.supportStaffUpdateProfile(support_StaffVo);
								if (addsupportstaff == "Add") {
									supportstaffImage(s, profileImagepath, profileImage);
									supportstaffeupdate = "true";
								} else {
									supportstaffeupdate = "false";
								}
							} else {
								supportstaffuser = "false";
							}
						}
					} else {
						supportstaffemail = "false";
						System.out.println("Email id was not update");
					}
				}
			} else {
				supportstaffemailinvalid = "false";
				System.out.println("Email id not valid");
			}
			List<Support_StaffList> list = new ArrayList<Support_StaffList>();
			Support_StaffList common = new Support_StaffList();
			common.setSupportstaffeemail(supportstaffemail);
			common.setSupportstaffemailinvalid(supportstaffemailinvalid);
			common.setSupportstaffeupdate(supportstaffeupdate);
			common.setSupportstaffuser(supportstaffuser);
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

	private void supportStaffDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int supportstaffid = Integer.parseInt(request.getParameter("supportStaffId"));
			System.out.println(supportstaffid);

			Support_StaffVo support_StaffVo = new Support_StaffVo();
			support_StaffVo.setId(supportstaffid);

			LoginVO loginVO = new LoginVO();
			loginVO.setSupportstaffloginid(support_StaffVo);
			
			SupportStaffDao supportStaffDao = new SupportStaffDao();
			ArrayList<Support_StaffVo> supportStafflist = supportStaffDao.supportStaffEdit(support_StaffVo);
			String profileimage = supportStafflist.get(0).getProfileimage();
			
			String loginmessage = supportStaffDao.deleteLogin(loginVO);
			if (loginmessage == "true") {
				String message = supportStaffDao.deleteSupportstaff(support_StaffVo);
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
