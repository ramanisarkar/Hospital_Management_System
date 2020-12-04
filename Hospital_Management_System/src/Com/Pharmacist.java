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
import DAO.LoginDAO;
import DAO.PharmacistDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.LoginVO;
import VO.PharmacistList;
import VO.PharmacistVo;

/**
 * Servlet implementation class Pharmacist
 */
@WebServlet("/Pharmacist")
@MultipartConfig
public class Pharmacist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pharmacist() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String pharmacistupdate = null;
	private String pharmacistemail = null;
	private String pharmacistuser = null;
	private String pharmacistemailinvalid = null;

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

	private void pharmacistImage(boolean s, String profileImagepath, Part profileImage) {
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
			session.setAttribute("pharmacistadminid", adminid);
			response.sendRedirect("Admin_Pharmacist_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("pharmacistList")) {
			pharmacistList(request, response);
		}
		if (flag.equalsIgnoreCase("editPharmacist")) {
			pharmacistEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deletePharmacist")) {
			pharmacistDelete(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------sasasa--------------------------------------------");
		String flag = request.getParameter("flag");
		String firstName = request.getParameter("firstname");
		
		System.out.println(firstName);
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			pharmacistInsert(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			pharmacistUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			pharmacistUserNameChack(request, response);
		}
	}

	private void pharmacistUserNameChack(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String pharmacistusername = request.getParameter("pharmacistusername1");
		System.out.println(pharmacistusername);
		LoginVO loginvo = new LoginVO();
		loginvo.setUsername(pharmacistusername);

		LoginDAO logdao = new LoginDAO();
		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
		System.out.println(usernamechack.size());
		List<PharmacistList> list = new ArrayList<PharmacistList>();
		if (usernamechack.isEmpty() == true) {
			String respose = "true";
			PharmacistList common = new PharmacistList();
			common.setChackusername(respose);
			list.add(common);
		} else {
			for (LoginVO pharmacist : usernamechack) {
				String username = pharmacist.getUsername();
				String user = "false";
				PharmacistList common = new PharmacistList();
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
	
	private void pharmacistList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("pharmacistadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PharmacistVo pharmacistVo = new PharmacistVo();
		pharmacistVo.setAdminid(adminVo);

		PharmacistDao pharmacistDao = new PharmacistDao();
		ArrayList<PharmacistVo> pharmacistlist = pharmacistDao.pharmacistList(pharmacistVo);
		List<PharmacistList> list = new ArrayList<PharmacistList>();
		for (PharmacistVo pharamacist : pharmacistlist) {
			int id = pharamacist.getId();
			String name = pharamacist.getFirstname();
			String photo = pharamacist.getProfileimage();
			String email = pharamacist.getEmail();
			String mobile = pharamacist.getMobileno();
			PharmacistList common = new PharmacistList();
			common.setId(id);
			common.setFirstname(name);
			common.setProfileimage(photo);
			common.setEmail(email);
			common.setMobileno(mobile);
			common.setPharmacistupdate(pharmacistupdate);
			common.setPharmacisteemail(pharmacistemail);
			common.setPharmacistemailinvalid(pharmacistemailinvalid);
			common.setPharmacistuser(pharmacistuser);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	private void pharmacistInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = (int) session.getAttribute("pharmacistadminid");
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

				PharmacistVo pharmacistVo = new PharmacistVo();
				pharmacistVo.setFirstname(firstName);
				pharmacistVo.setMidalname(middleName);
				pharmacistVo.setLastname(lastName);
				pharmacistVo.setBirthdate(dateofbirth);
				pharmacistVo.setGender(gender);
				pharmacistVo.setHomeeaddrss(homeAddress);
				pharmacistVo.setHomecity(homeCity);
				pharmacistVo.setHomestate(homeState);
				pharmacistVo.setHomecountry(homeCountry);
				pharmacistVo.setHomezipcode(homeZipcode);
				pharmacistVo.setMobilecountrycode(standardCode);
				pharmacistVo.setMobileno(mobileNumber);
				pharmacistVo.setPhoneno(phoneNumber);
				pharmacistVo.setEmail(email);
				pharmacistVo.setUsername(userName);
				pharmacistVo.setPassword(password);
				pharmacistVo.setCharge(charge);
				pharmacistVo.setProfileimage(profileImagepath);
				pharmacistVo.setJoiningdate(joiningdate);
				pharmacistVo.setAdminid(adminVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setPharmacistloginid(pharmacistVo);
				loginvo.setEmail(email);
				loginvo.setAdminid(adminVo);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Pharmacist");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				System.out.println(emailchack.size());
				if (emailchack.isEmpty() == true) {
					pharmacistemail= "true";
					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
					System.out.println(usernamechack.size());
					if (usernamechack.isEmpty() == true) {
						PharmacistDao  pharmacistDao = new  PharmacistDao();
						String chackpharmacist = pharmacistDao.pharmacistInsert(pharmacistVo, loginvo);
						if (chackpharmacist == "true") {
							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
							File imageDir = new File(uploadImagePath);
							if (!imageDir.exists()) {
								imageDir.mkdirs();
							}
							pharmacistImage(s, profileImagepath, profileImage);
							AllDataCountVo allDataCountVo = new AllDataCountVo();
							allDataCountVo.setAdminid(adminVo);
							AllDataCountDao allDataCountDao = new AllDataCountDao();
							allDataCountDao.increaseData(allDataCountVo, "pharmacist");
							pharmacistupdate = "true";
						} else {
							pharmacistupdate = "false";
						}
					} else {
						pharmacistuser = "false";
						pharmacistupdate = "false";
					}
				} else {
					pharmacistupdate = "false";
					pharmacistuser = "false";
					pharmacistemail = "false";
				}
			} else {
				pharmacistupdate = "false";
				pharmacistuser = "false";
				pharmacistemailinvalid = "false";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void pharmacistEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pharmacistId = Integer.parseInt(request.getParameter("pharmacistId"));
		System.out.println(pharmacistId);

		PharmacistVo pharmacistVo = new PharmacistVo();
		pharmacistVo.setId(pharmacistId);

		PharmacistDao  pharmacistDao = new PharmacistDao();
		ArrayList<PharmacistVo> pharmacistList = pharmacistDao.pharmacistEdit(pharmacistVo);
		List<PharmacistList> list = new ArrayList<PharmacistList>();
		for (PharmacistVo pharmacist: pharmacistList) {
			int adminid = pharmacist.getAdminid().getId();
			String firstName = pharmacist.getFirstname();
			String middleName = pharmacist.getMidalname();
			String lastName = pharmacist.getLastname();
			String date = pharmacist.getBirthdate();
			String gender = pharmacist.getGender();
			String homeAddress = pharmacist.getHomeeaddrss();
			String homeCity = pharmacist.getHomecity();
			String homeState = pharmacist.getHomestate();
			String homeCountry = pharmacist.getHomecountry();
			String homeZipcode = pharmacist.getHomezipcode();
			String standardCode = pharmacist.getMobilecountrycode();
			String mobileNumber = pharmacist.getMobileno();
			String phoneNumber = pharmacist.getPhoneno();
			String email = pharmacist.getEmail();
			String password = pharmacist.getPassword();
			String userName = pharmacist.getUsername();
			String charge = pharmacist.getCharge();
			String profileimage = pharmacist.getProfileimage();
			String profileimagename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String joiningdate = pharmacist.getJoiningdate();
			PharmacistList common = new PharmacistList();
			common.setId(pharmacistId);
			common.setAdminid(adminid);
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

	private void pharmacistUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				int adminid = Integer.parseInt(request.getParameter("adminid"));
				int id = Integer.parseInt(request.getParameter("pharmacistid"));
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

				PharmacistVo  pharmacistVo = new PharmacistVo();
				pharmacistVo.setId(id);
				pharmacistVo.setFirstname(firstName);
				pharmacistVo.setMidalname(middleName);
				pharmacistVo.setLastname(lastName);
				pharmacistVo.setBirthdate(dateofbirth);
				pharmacistVo.setGender(gender);
				pharmacistVo.setHomeeaddrss(homeAddress);
				pharmacistVo.setHomecity(homeCity);
				pharmacistVo.setHomestate(homeState);
				pharmacistVo.setHomecountry(homeCountry);
				pharmacistVo.setHomezipcode(homeZipcode);
				pharmacistVo.setMobilecountrycode(standardCode);
				pharmacistVo.setMobileno(mobileNumber);
				pharmacistVo.setPhoneno(phoneNumber);
				pharmacistVo.setEmail(email);
				pharmacistVo.setUsername(userName);
				pharmacistVo.setPassword(password);
				pharmacistVo.setCharge(charge);
				pharmacistVo.setProfileimage(profileImagepath);
				pharmacistVo.setJoiningdate(joiningdate);
				pharmacistVo.setAdminid(adminVo);

				LoginVO loginvo = new LoginVO();
				loginvo.setPharmacistloginid(pharmacistVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);
				loginvo.setUsername(userName);

				LoginDAO logdao = new LoginDAO();
				PharmacistDao pharmacistDao = new PharmacistDao();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
				if (emailchack.isEmpty() == false) {
					String chackpassword = logdao.loginupdatePassword(loginvo);
					if (chackpassword.equals("add")) {
						if (usernamechack.isEmpty() == false) {
							String addpharmacist = pharmacistDao.pharmancistUpdateProfile(pharmacistVo);
							if (addpharmacist == "Add") {
								pharmacistupdate = "true";
								pharmacistImage(s, profileImagepath, profileImage);
							} else {
								System.out.println("supportStaff profile was not update");
								pharmacistupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							String chackusername = logdao.loginupdateUsername(loginvo);
							if (chackusername.equals("add")) {
								String addpharmacist = pharmacistDao.pharmancistUpdateProfile(pharmacistVo);
								if (addpharmacist == "Add") {
									pharmacistupdate = "true";
									pharmacistImage(s, profileImagepath, profileImage);
								} else {
									pharmacistupdate = "false";
									System.out.println("supportStaff profile was not update");
								}
							} else {
								pharmacistuser = "false";
								System.out.println("User name was not update");
							}
						}
					}
				} else if (emailchack.isEmpty() == true) {
					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
					String chack = logdao.pharmacistLoginUpdate(loginvo);
					if (chack.equals("add")) {
						pharmacistemail = "true";
						if (usernamechack.isEmpty() == false) {
							String addpharmacist = pharmacistDao.pharmancistUpdateProfile(pharmacistVo);
							if (addpharmacist == "Add") {
								pharmacistImage(s, profileImagepath, profileImage);
								pharmacistupdate = "true";
							} else {
								System.out.println("doctor profile was not update");
								pharmacistupdate = "false";
							}
						} else if (usernamechack.isEmpty() == true) {
							System.out.println(email);
							System.out.println("---------------------------------------------");
							String chackusername = logdao.loginupdateUsername(loginvo);
							System.out.println(chackusername);
							if (chackusername.equals("add")) {

								String addpharmacist = pharmacistDao.pharmancistUpdateProfile(pharmacistVo);
								if (addpharmacist == "Add") {
									pharmacistImage(s, profileImagepath, profileImage);
									pharmacistupdate= "true";
								} else {
									pharmacistupdate = "false";
								}
							} else {
								pharmacistuser = "false";
							}
						}
					} else {
						pharmacistemail = "false";
						System.out.println("Email id was not update");
					}
				}
			} else {
				pharmacistemailinvalid = "false";
				System.out.println("Email id not valid");
			}
			List<PharmacistList> list = new ArrayList<PharmacistList>();
			PharmacistList common = new PharmacistList();
			common.setPharmacisteemail(pharmacistemail);
			common.setPharmacistemailinvalid(pharmacistemailinvalid);
			common.setPharmacistupdate(pharmacistupdate);
			common.setPharmacistuser(pharmacistuser);
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

	private void pharmacistDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int pharmacistId = Integer.parseInt(request.getParameter("pharmacistId"));
			System.out.println(pharmacistId);

			PharmacistVo pharmacistVo = new PharmacistVo();
			pharmacistVo.setId(pharmacistId);
			
			LoginVO loginVO = new LoginVO();
			loginVO.setPharmacistloginid(pharmacistVo);
			
			PharmacistDao pharmacistDao = new  PharmacistDao();
			ArrayList<PharmacistVo> pharmacistlist = pharmacistDao.pharmacistEdit(pharmacistVo);
			String profileimage = pharmacistlist.get(0).getProfileimage();
			
			String loginmessage = pharmacistDao.deleteLogin(loginVO);
			if (loginmessage == "true") {
				String message = pharmacistDao.deletePharmacist(pharmacistVo);
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
