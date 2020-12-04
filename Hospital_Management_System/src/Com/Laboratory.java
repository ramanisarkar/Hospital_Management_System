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
import DAO.LaboratoryDao;
import DAO.LoginDAO;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.LaboratoryList;
import VO.LaboratoryVo;
import VO.LoginVO;
import VO.PharmacistList;

/**
 * Servlet implementation class Laboratory
 */
@WebServlet("/Laboratory")
@MultipartConfig
public class Laboratory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Laboratory() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String laboratorystaffupdate = null;
   	private String laboratorystaffemail = null;
   	private String laboratorystaffuser = null;
   	private String laboratorystaffemailinvalid = null;

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

   	private void laboratory_Staff_Image(boolean s, String profileImagepath, Part profileImage) {
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
   			session.setAttribute("laboratoryStaffAdminid", adminid);
   			response.sendRedirect("Admin_Laboratory_Staff_Reg.jsp");
   		}
   		if (flag.equalsIgnoreCase("laboratoryStaffList")) {
   			laboratoryStaffList(request, response);
   		}
   		if (flag.equalsIgnoreCase("editLaboratoryStaff")) {
   			laboratoryStaffEdit(request, response);
   		}
   		if (flag.equalsIgnoreCase("deleteLaboratoryStaff")) {
   			laboratoryStaffDelete(request, response);
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
   		
   		if (flag.equalsIgnoreCase("insert")) {
   			laboratoryStaffInsert(request, response);
   		}
   		if (flag.equalsIgnoreCase("update")) {
   			laboratoryStaffUpdate(request, response);
   		}
   		if (flag.equalsIgnoreCase("chackusername")) {
   			laboratoryStaffUserNameChack(request, response);
   		}
   	}

   	private void laboratoryStaffUserNameChack(HttpServletRequest request, HttpServletResponse response)
   			throws IOException {
   		String pharmacistusername = request.getParameter("laboratoryStaffusername");
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
   	
   	private void laboratoryStaffList(HttpServletRequest request, HttpServletResponse response) throws IOException {

   		HttpSession session = request.getSession();
   		int adminid = (int) session.getAttribute("laboratoryStaffAdminid");

   		AdminVo adminVo = new AdminVo();
   		adminVo.setId(adminid);

   		LaboratoryVo laboratoryVo = new LaboratoryVo();
   		laboratoryVo.setAdminid(adminVo);
   		
   		LaboratoryDao laboratoryDao = new LaboratoryDao();
   		ArrayList<LaboratoryVo> laboratorystafflist = laboratoryDao.pharmacistList(laboratoryVo);
   		List<LaboratoryList> list = new ArrayList<LaboratoryList>();
   		for (LaboratoryVo laboratorystaff : laboratorystafflist) {
   			int id = laboratorystaff.getId();
   			String name = laboratorystaff.getFirstname();
   			String photo = laboratorystaff.getProfileimage();
   			String email = laboratorystaff.getEmail();
   			String mobile = laboratorystaff.getMobileno();
   			LaboratoryList common = new LaboratoryList();
   			common.setId(id);
   			common.setFirstname(name);
   			common.setProfileimage(photo);
   			common.setEmail(email);
   			common.setMobileno(mobile);
   			common.setLaboratoryemail(laboratorystaffemail);
   			common.setLaboratoryemailinvalid(laboratorystaffemailinvalid);
   			common.setLaboratoryupdate(laboratorystaffupdate);
   			common.setLaboratoryuser(laboratorystaffuser);
   			list.add(common);
   		}
   		Gson gson = new Gson();
   		System.out.println(gson.toJson(list));
   		PrintWriter out = response.getWriter();
   		out.print(gson.toJson(list));
   		out.flush();
   		out.close();

   	}

   	private void laboratoryStaffInsert(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			System.out.println("----------------------");
   			HttpSession session = request.getSession();
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = (int) session.getAttribute("laboratoryStaffAdminid");
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

   				LaboratoryVo laboratoryVo = new LaboratoryVo();
   				laboratoryVo.setFirstname(firstName);
   				laboratoryVo.setMidalname(middleName);
   				laboratoryVo.setLastname(lastName);
   				laboratoryVo.setBirthdate(dateofbirth);
   				laboratoryVo.setGender(gender);
   				laboratoryVo.setHomeeaddrss(homeAddress);
   				laboratoryVo.setHomecity(homeCity);
   				laboratoryVo.setHomestate(homeState);
   				laboratoryVo.setHomecountry(homeCountry);
   				laboratoryVo.setHomezipcode(homeZipcode);
   				laboratoryVo.setMobilecountrycode(standardCode);
   				laboratoryVo.setMobileno(mobileNumber);
   				laboratoryVo.setPhoneno(phoneNumber);
   				laboratoryVo.setEmail(email);
   				laboratoryVo.setUsername(userName);
   				laboratoryVo.setPassword(password);
   				laboratoryVo.setCharge(charge);
   				laboratoryVo.setProfileimage(profileImagepath);
   				laboratoryVo.setJoiningdate(joiningdate);
   				laboratoryVo.setAdminid(adminVo);

   				LoginVO loginvo = new LoginVO();
   				loginvo.setLaboratoryloginid(laboratoryVo);
   				loginvo.setAdminid(adminVo);
   				loginvo.setEmail(email);
   				loginvo.setPassword(password);
   				loginvo.setUsername(userName);
   				loginvo.setLastlogin(joiningdate);
   				loginvo.setRoll("Laboratory Staff");

   				LoginDAO logdao = new LoginDAO();
   				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
   				System.out.println(emailchack.size());
   				if (emailchack.isEmpty() == true) {
   					laboratorystaffemail= "true";
   					ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
   					System.out.println(usernamechack.size());
   					if (usernamechack.isEmpty() == true) {
   						LaboratoryDao laboratoryDao = new LaboratoryDao();
   						String chacklaboratorystaff = laboratoryDao.laboratoryStaffInsert(laboratoryVo, loginvo);
   						if (chacklaboratorystaff == "true") {
   							String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
   							File imageDir = new File(uploadImagePath);
   							if (!imageDir.exists()) {
   								imageDir.mkdirs();
   							}
   							laboratory_Staff_Image(s, profileImagepath, profileImage);
   							AllDataCountVo allDataCountVo = new AllDataCountVo();
   							allDataCountVo.setAdminid(adminVo);
   							AllDataCountDao allDataCountDao = new AllDataCountDao();
   							allDataCountDao.increaseData(allDataCountVo, "laboratorystaff");
   							laboratorystaffupdate = "true";
   						} else {
   							laboratorystaffupdate = "false";
   						}
   					} else {
   						laboratorystaffuser = "false";
   						laboratorystaffupdate = "false";
   					}
   				} else {
   					laboratorystaffupdate = "false";
   					laboratorystaffuser = "false";
   					laboratorystaffemail = "false";
   				}
   			} else {
   				laboratorystaffupdate = "false";
   				laboratorystaffuser = "false";
   				laboratorystaffemailinvalid = "false";
   			}

   		} catch (Exception e) {
   			e.printStackTrace();
   		}
   	}

   	private void laboratoryStaffEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
   		int laboratoryStaffId = Integer.parseInt(request.getParameter("laboratoryStaffId"));
   		System.out.println(laboratoryStaffId);

   		LaboratoryVo laboratoryVo = new LaboratoryVo();
   		laboratoryVo.setId(laboratoryStaffId);
   		
   		LaboratoryDao laboratoryDao = new LaboratoryDao();
   		ArrayList<LaboratoryVo> laboratoryStaffList = laboratoryDao.laboratoryStaffEdit(laboratoryVo);
   		List<LaboratoryList> list = new ArrayList<LaboratoryList>();
   		for (LaboratoryVo laboratorystaff: laboratoryStaffList) {
   			int adminid = laboratorystaff.getAdminid().getId();
   			String firstName = laboratorystaff.getFirstname();
   			String middleName = laboratorystaff.getMidalname();
   			String lastName = laboratorystaff.getLastname();
   			String date = laboratorystaff.getBirthdate();
   			String gender = laboratorystaff.getGender();
   			String homeAddress = laboratorystaff.getHomeeaddrss();
   			String homeCity = laboratorystaff.getHomecity();
   			String homeState = laboratorystaff.getHomestate();
   			String homeCountry = laboratorystaff.getHomecountry();
   			String homeZipcode = laboratorystaff.getHomezipcode();
   			String standardCode = laboratorystaff.getMobilecountrycode();
   			String mobileNumber = laboratorystaff.getMobileno();
   			String phoneNumber = laboratorystaff.getPhoneno();
   			String email = laboratorystaff.getEmail();
   			String password = laboratorystaff.getPassword();
   			String userName = laboratorystaff.getUsername();
   			String charge = laboratorystaff.getCharge();
   			String profileimage = laboratorystaff.getProfileimage();
   			String profileimagename = "";
   			if (profileimage != null) {
   				int a = profileimage.indexOf("@");
   				a++;
   				profileimagename = profileimage.substring(a);
   			}
   			String joiningdate = laboratorystaff.getJoiningdate();
   			LaboratoryList common = new LaboratoryList();
   			common.setId(laboratoryStaffId);
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

   	private void laboratoryStaffUpdate(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = Integer.parseInt(request.getParameter("adminid"));
   				int id = Integer.parseInt(request.getParameter("laboratoryStaffId"));
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

   				LaboratoryVo laboratoryVo = new LaboratoryVo();
   				laboratoryVo.setId(id);
   				laboratoryVo.setFirstname(firstName);
   				laboratoryVo.setMidalname(middleName);
   				laboratoryVo.setLastname(lastName);
   				laboratoryVo.setBirthdate(dateofbirth);
   				laboratoryVo.setGender(gender);
   				laboratoryVo.setHomeeaddrss(homeAddress);
   				laboratoryVo.setHomecity(homeCity);
   				laboratoryVo.setHomestate(homeState);
   				laboratoryVo.setHomecountry(homeCountry);
   				laboratoryVo.setHomezipcode(homeZipcode);
   				laboratoryVo.setMobilecountrycode(standardCode);
   				laboratoryVo.setMobileno(mobileNumber);
   				laboratoryVo.setPhoneno(phoneNumber);
   				laboratoryVo.setEmail(email);
   				laboratoryVo.setUsername(userName);
   				laboratoryVo.setPassword(password);
   				laboratoryVo.setCharge(charge);
   				laboratoryVo.setProfileimage(profileImagepath);
   				laboratoryVo.setJoiningdate(joiningdate);
   				laboratoryVo.setAdminid(adminVo);

   				LoginVO loginvo = new LoginVO();
   				loginvo.setLaboratoryloginid(laboratoryVo);
   				loginvo.setEmail(email);
   				loginvo.setPassword(password);
   				loginvo.setUsername(userName);

   				LoginDAO logdao = new LoginDAO();
   				LaboratoryDao laboratoryDao = new LaboratoryDao();
   				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
   				ArrayList<LoginVO> usernamechack = logdao.userNameVerify(loginvo);
   				if (emailchack.isEmpty() == false) {
   					String chackpassword = logdao.loginupdatePassword(loginvo);
   					if (chackpassword.equals("add")) {
   						if (usernamechack.isEmpty() == false) {
   							String addlaboratorystaff = laboratoryDao.laboratoryStaffUpdateProfile(laboratoryVo);
   							if (addlaboratorystaff == "Add") {
   								laboratorystaffupdate = "true";
   								laboratory_Staff_Image(s, profileImagepath, profileImage);
   							} else {
   								System.out.println("supportStaff profile was not update");
   								laboratorystaffupdate = "false";
   							}
   						} else if (usernamechack.isEmpty() == true) {
   							String chackusername = logdao.loginupdateUsername(loginvo);
   							if (chackusername.equals("add")) {
   								String addlaboratorystaff = laboratoryDao.laboratoryStaffUpdateProfile(laboratoryVo);
   								if (addlaboratorystaff == "Add") {
   									laboratorystaffupdate = "true";
   									laboratory_Staff_Image(s, profileImagepath, profileImage);
   								} else {
   									laboratorystaffupdate = "false";
   									System.out.println("supportStaff profile was not update");
   								}
   							} else {
   								laboratorystaffuser = "false";
   								System.out.println("User name was not update");
   							}
   						}
   					}
   				} else if (emailchack.isEmpty() == true) {
   					System.out.println("--1--1-1-11-111-1--11-1--1---------------");
   					String chack = logdao.laboratoryStaffLoginUpdate(loginvo);
   					if (chack.equals("add")) {
   						laboratorystaffemail = "true";
   						if (usernamechack.isEmpty() == false) {
   							String addlaboratorystaff = laboratoryDao.laboratoryStaffUpdateProfile(laboratoryVo);
   							if (addlaboratorystaff == "Add") {
   								laboratory_Staff_Image(s, profileImagepath, profileImage);
   								laboratorystaffupdate = "true";
   							} else {
   								System.out.println("doctor profile was not update");
   								laboratorystaffupdate = "false";
   							}
   						} else if (usernamechack.isEmpty() == true) {
   							System.out.println(email);
   							System.out.println("---------------------------------------------");
   							String chackusername = logdao.loginupdateUsername(loginvo);
   							System.out.println(chackusername);
   							if (chackusername.equals("add")) {
   								String addlaboratorystaff = laboratoryDao.laboratoryStaffUpdateProfile(laboratoryVo);
   								if (addlaboratorystaff == "Add") {
   									laboratory_Staff_Image(s, profileImagepath, profileImage);
   									laboratorystaffupdate= "true";
   								} else {
   									laboratorystaffupdate = "false";
   								}
   							} else {
   								laboratorystaffuser = "false";
   							}
   						}
   					} else {
   						laboratorystaffemail = "false";
   						System.out.println("Email id was not update");
   					}
   				}
   			} else {
   				laboratorystaffemailinvalid = "false";
   				System.out.println("Email id not valid");
   			}
   			List<LaboratoryList> list = new ArrayList<LaboratoryList>();
   			LaboratoryList common = new LaboratoryList();
   			common.setLaboratoryemail(laboratorystaffemail);
   			common.setLaboratoryemailinvalid(laboratorystaffemailinvalid);
   			common.setLaboratoryupdate(laboratorystaffupdate);
   			common.setLaboratoryuser(laboratorystaffuser);
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

   	private void laboratoryStaffDelete(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			int laboratoryStaffId = Integer.parseInt(request.getParameter("laboratoryStaffId"));
   			System.out.println(laboratoryStaffId);

   			LaboratoryVo laboratoryVo = new LaboratoryVo();
   			laboratoryVo.setId(laboratoryStaffId);
   			
   			LoginVO loginVO = new LoginVO();
   			loginVO.setLaboratoryloginid(laboratoryVo);
   			
   			LaboratoryDao laboratoryDao = new LaboratoryDao();
   			ArrayList<LaboratoryVo> pharmacistlist = laboratoryDao.laboratoryStaffEdit(laboratoryVo);
   			String profileimage = pharmacistlist.get(0).getProfileimage();
   			
   			String loginmessage = laboratoryDao.deleteLogin(loginVO);
   			if (loginmessage == "true") {
   				String message = laboratoryDao.deleteLaboratoryStaff(laboratoryVo);
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
