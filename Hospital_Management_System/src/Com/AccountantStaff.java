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

import DAO.AccountantStaffDao;
import DAO.LoginDAO;
import DAO.PharmacistDao;
import VO.AccountantList;
import VO.AccountantStaffVo;
import VO.AdminVo;
import VO.LoginVO;
import VO.PharmacistList;
import VO.PharmacistVo;

/**
 * Servlet implementation class AccountantStaff
 */
@WebServlet("/AccountantStaff")
@MultipartConfig
public class AccountantStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountantStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String accountantstaffupdate = null;
   	private String accountantstaffemail = null;
   	private String accountantstaffuser = null;
   	private String accountantstaffemailinvalid = null;

   	private static final String SAVE_DIR_Images = "Accountant_Staff_Image";

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

   	private void accountantStaffImage(boolean s, String profileImagepath, Part profileImage) {
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
   			session.setAttribute("accountantStaffAdminid", adminid);
   			response.sendRedirect("Admin_Accountant_Staff_Reg.jsp");
   		}
   		if (flag.equalsIgnoreCase("accountantStaffList")) {
   			accountantStaffList(request, response);
   		}
   		if (flag.equalsIgnoreCase("editAccountantStaff")) {
   			accountantStaffEdit(request, response);
   		}
   		if (flag.equalsIgnoreCase("deleteAccountantStaff")) {
   			accountantStaffDelete(request, response);
   		}
   	}

   	protected void doPost(HttpServletRequest request, HttpServletResponse response)
   			throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		System.out.println("---------------sasasa--------------------------------------------");
   		String flag = request.getParameter("flag");
   		String firstName = request.getParameter("firstname");
   		
   		System.out.println(firstName);
   		System.out.println(flag);
   		if (flag.equalsIgnoreCase("insert")) {
   			accountantStaffInsert(request, response);
   		}
   		if (flag.equalsIgnoreCase("update")) {
   			accountantStaffUpdate(request, response);
   		}
   		if (flag.equalsIgnoreCase("chackusername")) {
   			accountantStaffUserNameChack(request, response);
   		}
   	}

   	private void accountantStaffUserNameChack(HttpServletRequest request, HttpServletResponse response)
   			throws IOException {
   		String accountantStaffUserName = request.getParameter("accountantStaffUserName");
   		System.out.println(accountantStaffUserName);
   		LoginVO loginvo = new LoginVO();
   		loginvo.setUsername(accountantStaffUserName);

   		LoginDAO logdao = new LoginDAO();
   		ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
   		System.out.println(usernamechack.size());
   		List<AccountantList> list = new ArrayList<AccountantList>();
   		if (usernamechack.isEmpty() == true) {
   			String respose = "true";
   			AccountantList common = new AccountantList();
   			common.setChackusername(respose);
   			list.add(common);
   		} else {
   			for (LoginVO pharmacist : usernamechack) {
   				String username = pharmacist.getUsername();
   				String user = "false";
   				AccountantList common = new AccountantList();
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
   	
   	private void accountantStaffList(HttpServletRequest request, HttpServletResponse response) throws IOException {

   		HttpSession session = request.getSession();
   		int adminid = (int) session.getAttribute("accountantStaffAdminid");

   		AdminVo adminVo = new AdminVo();
   		adminVo.setId(adminid);

   		AccountantStaffVo accountantStaffVo = new AccountantStaffVo();
   		accountantStaffVo.setAdminid(adminVo);

   		AccountantStaffDao accountantStaffDao = new AccountantStaffDao();
   		ArrayList<AccountantStaffVo> accountantList = accountantStaffDao.accountantStaffList(accountantStaffVo);
   		List<AccountantList> list = new ArrayList<AccountantList>();
   		for (AccountantStaffVo accountant : accountantList) {
   			int id = accountant.getId();
   			String name = accountant.getFirstname();
   			String photo = accountant.getProfileimage();
   			String email = accountant.getEmail();
   			String mobile = accountant.getMobileno();
   			AccountantList common = new AccountantList();
   			common.setId(id);
   			common.setFirstname(name);
   			common.setProfileimage(photo);
   			common.setEmail(email);
   			common.setMobileno(mobile);
   			common.setAccountantstaffemail(accountantstaffemail);
   			common.setAccountantstaffemailinvalid(accountantstaffemailinvalid);
   			common.setAccountantstaffupdate(accountantstaffupdate);
   			common.setAccountantstaffuser(accountantstaffuser);
   			list.add(common);
   		}
   		Gson gson = new Gson();
   		System.out.println(gson.toJson(list));
   		PrintWriter out = response.getWriter();
   		out.print(gson.toJson(list));
   		out.flush();
   		out.close();

   	}

   	private void accountantStaffInsert(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			System.out.println("----------------------");
   			HttpSession session = request.getSession();
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = (int) session.getAttribute("accountantStaffAdminid");
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

   				AccountantStaffVo accountantStaffVo = new AccountantStaffVo();
   				accountantStaffVo.setFirstname(firstName);
   				accountantStaffVo.setMidalname(middleName);
   				accountantStaffVo.setLastname(lastName);
   				accountantStaffVo.setBirthdate(dateOfBirth);
   				accountantStaffVo.setGender(gender);
   				accountantStaffVo.setHomeeaddrss(homeAddress);
   				accountantStaffVo.setHomecity(homeCity);
   				accountantStaffVo.setHomestate(homeState);
   				accountantStaffVo.setHomecountry(homeCountry);
   				accountantStaffVo.setHomezipcode(homeZipcode);
   				accountantStaffVo.setMobilecountrycode(standardCode);
   				accountantStaffVo.setMobileno(mobileNumber);
   				accountantStaffVo.setPhoneno(phoneNumber);
   				accountantStaffVo.setEmail(email);
   				accountantStaffVo.setUsername(userName);
   				accountantStaffVo.setPassword(password);
   				accountantStaffVo.setCharge(charge);
   				accountantStaffVo.setProfileimage(profileImagepath);
   				accountantStaffVo.setJoiningdate(joiningdate);
   				accountantStaffVo.setAdminid(adminVo);

   				LoginVO loginvo = new LoginVO();
   				loginvo.setAccountantloginid(accountantStaffVo);
   				loginvo.setEmail(email);
   				loginvo.setPassword(password);
   				loginvo.setUsername(userName);
   				loginvo.setLastlogin(joiningdate);
   				loginvo.setRoll("Accountant");

   				LoginDAO logdao = new LoginDAO();
   				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
   				System.out.println(emailchack.size());
   				if (emailchack.isEmpty() == true) {
   					accountantstaffemail= "true";
   					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
   					System.out.println(usernamechack.size());
   					if (usernamechack.isEmpty() == true) {
   						AccountantStaffDao accountantStaffDao = new AccountantStaffDao();
   						String chackaccountantstaff = accountantStaffDao.accountantStaffStaffInsert(accountantStaffVo, loginvo);
   						if (chackaccountantstaff == "true") {
   							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
   							File imageDir = new File(uploadImagePath);
   							if (!imageDir.exists()) {
   								imageDir.mkdirs();
   							}
   							accountantStaffImage(s, profileImagepath, profileImage);
   							accountantstaffupdate = "true";
   						} else {
   							accountantstaffupdate = "false";
   						}
   					} else {
   						accountantstaffuser = "false";
   						accountantstaffupdate = "false";
   					}
   				} else {
   					accountantstaffupdate = "false";
   					accountantstaffuser = "false";
   					accountantstaffemail = "false";
   				}
   			} else {
   				accountantstaffupdate = "false";
   				accountantstaffuser = "false";
   				accountantstaffemailinvalid = "false";
   			}

   		} catch (Exception e) {
   			e.printStackTrace();
   		}
   	}

   	private void accountantStaffEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
   		int accountantStaffId = Integer.parseInt(request.getParameter("accountantStaffId"));
   		System.out.println(accountantStaffId);

   		AccountantStaffVo accountantStaffVo = new AccountantStaffVo();
   		accountantStaffVo.setId(accountantStaffId);

   		AccountantStaffDao accountantStaffDao = new  AccountantStaffDao();
   		ArrayList<AccountantStaffVo> accountantStaffList = accountantStaffDao.accountantStaffStaffEdit(accountantStaffVo);
   		List<AccountantList> list = new ArrayList<AccountantList>();
   		for (AccountantStaffVo accountant: accountantStaffList) {
   			int adminid = accountant.getAdminid().getId();
   			String firstName = accountant.getFirstname();
   			String middleName = accountant.getMidalname();
   			String lastName = accountant.getLastname();
   			java.sql.Date dateofbirth = accountant.getBirthdate();
   			String date = dateofbirth.toString();
   			String gender = accountant.getGender();
   			String homeAddress = accountant.getHomeeaddrss();
   			String homeCity = accountant.getHomecity();
   			String homeState = accountant.getHomestate();
   			String homeCountry = accountant.getHomecountry();
   			String homeZipcode = accountant.getHomezipcode();
   			String standardCode = accountant.getMobilecountrycode();
   			String mobileNumber = accountant.getMobileno();
   			String phoneNumber = accountant.getPhoneno();
   			String email = accountant.getEmail();
   			String password = accountant.getPassword();
   			String userName = accountant.getUsername();
   			String charge = accountant.getCharge();
   			String profileimage = accountant.getProfileimage();
   			String profileimagename = "";
   			if (profileimage != null) {
   				int a = profileimage.indexOf("@");
   				a++;
   				profileimagename = profileimage.substring(a);
   			}
   			String joiningdate = accountant.getJoiningdate();
   			AccountantList common = new AccountantList();
   			common.setId(accountantStaffId);
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

   	private void accountantStaffUpdate(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = Integer.parseInt(request.getParameter("adminid"));
   				int id = Integer.parseInt(request.getParameter("accountantStaffId"));
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

   				AccountantStaffVo accountantStaffVo = new AccountantStaffVo();
   				accountantStaffVo.setId(id);
   				accountantStaffVo.setFirstname(firstName);
   				accountantStaffVo.setMidalname(middleName);
   				accountantStaffVo.setLastname(lastName);
   				accountantStaffVo.setBirthdate(dateOfBirth);
   				accountantStaffVo.setGender(gender);
   				accountantStaffVo.setHomeeaddrss(homeAddress);
   				accountantStaffVo.setHomecity(homeCity);
   				accountantStaffVo.setHomestate(homeState);
   				accountantStaffVo.setHomecountry(homeCountry);
   				accountantStaffVo.setHomezipcode(homeZipcode);
   				accountantStaffVo.setMobilecountrycode(standardCode);
   				accountantStaffVo.setMobileno(mobileNumber);
   				accountantStaffVo.setPhoneno(phoneNumber);
   				accountantStaffVo.setEmail(email);
   				accountantStaffVo.setUsername(userName);
   				accountantStaffVo.setPassword(password);
   				accountantStaffVo.setCharge(charge);
   				accountantStaffVo.setProfileimage(profileImagepath);
   				accountantStaffVo.setJoiningdate(joiningdate);
   				accountantStaffVo.setAdminid(adminVo);

   				LoginVO loginvo = new LoginVO();
   				loginvo.setAccountantloginid(accountantStaffVo);
   				loginvo.setEmail(email);
   				loginvo.setPassword(password);
   				loginvo.setUsername(userName);

   				LoginDAO logdao = new LoginDAO();
   				AccountantStaffDao accountantStaffDao = new AccountantStaffDao();
   				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
   				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
   				if (emailchack.isEmpty() == false) {
   					String chackpassword = logdao.loginupdatePassword(loginvo);
   					if (chackpassword.equals("add")) {
   						if (usernamechack.isEmpty() == false) {
   							String addaccountant = accountantStaffDao.accountantStaffUpdateProfile(accountantStaffVo);
   							if (addaccountant == "Add") {
   								accountantstaffupdate = "true";
   								accountantStaffImage(s, profileImagepath, profileImage);
   							} else {
   								System.out.println("supportStaff profile was not update");
   								accountantstaffupdate = "false";
   							}
   						} else if (usernamechack.isEmpty() == true) {
   							String chackusername = logdao.loginupdateUsername(loginvo);
   							if (chackusername.equals("add")) {
   	   							String addaccountant = accountantStaffDao.accountantStaffUpdateProfile(accountantStaffVo);
   								if (addaccountant == "Add") {
   									accountantstaffupdate = "true";
   									accountantStaffImage(s, profileImagepath, profileImage);
   								} else {
   									accountantstaffupdate = "false";
   									System.out.println("supportStaff profile was not update");
   								}
   							} else {
   								accountantstaffuser = "false";
   								System.out.println("User name was not update");
   							}
   						}
   					}
   				} else if (emailchack.isEmpty() == true) {
   					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
   					String chack = logdao.accountantStaffLoginUpdate(loginvo);
   					if (chack.equals("add")) {
   						accountantstaffemail = "true";
   						if (usernamechack.isEmpty() == false) {
   							String addaccountant = accountantStaffDao.accountantStaffUpdateProfile(accountantStaffVo);
   							if (addaccountant == "Add") {
   								accountantStaffImage(s, profileImagepath, profileImage);
   								accountantstaffupdate = "true";
   							} else {
   								System.out.println("doctor profile was not update");
   								accountantstaffupdate = "false";
   							}
   						} else if (usernamechack.isEmpty() == true) {
   							System.out.println(email);
   							System.out.println("---------------------------------------------");
   							String chackusername = logdao.loginupdateUsername(loginvo);
   							System.out.println(chackusername);
   							if (chackusername.equals("add")) {
   								String addaccountant = accountantStaffDao.accountantStaffUpdateProfile(accountantStaffVo);
   								if (addaccountant == "Add") {
   									accountantStaffImage(s, profileImagepath, profileImage);
   									accountantstaffupdate= "true";
   								} else {
   									accountantstaffupdate = "false";
   								}
   							} else {
   								accountantstaffuser = "false";
   							}
   						}
   					} else {
   						accountantstaffemail = "false";
   						System.out.println("Email id was not update");
   					}
   				}
   			} else {
   				accountantstaffemailinvalid = "false";
   				System.out.println("Email id not valid");
   			}
   			List<AccountantList> list = new ArrayList<AccountantList>();
   			AccountantList common = new AccountantList();
   			common.setAccountantstaffemail(accountantstaffemail);
   			common.setAccountantstaffemailinvalid(accountantstaffemailinvalid);
   			common.setAccountantstaffupdate(accountantstaffupdate);
   			common.setAccountantstaffuser(accountantstaffuser);
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

   	private void accountantStaffDelete(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			int accountantStaffId = Integer.parseInt(request.getParameter("accountantStaffId"));
   			System.out.println(accountantStaffId);

   			AccountantStaffVo accountantStaffVo = new AccountantStaffVo();
   			accountantStaffVo.setId(accountantStaffId);
   			
   			LoginVO loginVO = new LoginVO();
   			loginVO.setAccountantloginid(accountantStaffVo);
   			
   			AccountantStaffDao accountantStaffDao = new AccountantStaffDao();
   			ArrayList<AccountantStaffVo> accountantStaffList = accountantStaffDao.accountantStaffStaffEdit(accountantStaffVo);
   			String profileimage = accountantStaffList.get(0).getProfileimage();
   			
   			String loginmessage = accountantStaffDao.deleteLogin(loginVO);
   			if (loginmessage == "true") {
   				String message = accountantStaffDao.deleteAccountantStaff(accountantStaffVo);
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
