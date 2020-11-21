package Com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import DAO.AdminDao;
import DAO.LoginDAO;
import VO.AdminVo;
import VO.LoginVO;

/**
 * Servlet implementation class Hospital
 */
@WebServlet("/Admin")
@MultipartConfig
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin() {
		super();
	}

	private static final String SAVE_DIR = "Admin_Images";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("editprofile")) {
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("adminid", adminid);
			editAdminProfile(request, response);
			response.sendRedirect("Admin_Edit_Profile.jsp");
		}
		if (flag.equalsIgnoreCase("desbord")) {
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("loginadminid", adminid);
			CommonDataCount commonDataCount = new CommonDataCount();
			commonDataCount.doGet(request, response);
			response.sendRedirect("Admin_Login.jsp");
		}
	}


	private void editAdminProfile(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("adminid");
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		AdminDao adminDao = new AdminDao();
		ArrayList<AdminVo> adminlist = adminDao.editAdminProfile(adminVo);
		System.out.println(adminlist.size());
		session.setAttribute("aadminData", adminlist);
		
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
			hospitalInsert(request, response);
		}
		if (flag.equalsIgnoreCase("updateprofile")) {
			updateAdminProfile(request, response);
			editAdminProfile(request, response);
			response.sendRedirect("Admin_Edit_Profile.jsp");
		}
	}

	private void updateAdminProfile(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String hospitalname = request.getParameter("hospitalname");
			String hospoitalAdd = request.getParameter("hospitaladdress");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String joiningdate = request.getParameter("joiningdate");
			String uploadpath = request.getParameter("uploadpath");

			int adminid = (Integer.parseInt(request.getParameter("id")));

			if (EmailValidation.isValid(email)) {

				Part filepart = request.getPart("myimg");
				String fileName = getSubmittedFileName(filepart);
				if ((fileName.isEmpty()) == false) {
					String Path = getServletContext()
							.getRealPath(File.separator + SAVE_DIR + File.separator + uploadpath);
					File dir = new File(Path);
					dir.delete();

					SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmssSSS");
					Date date = new Date();
					String d1ate = formatter.format(date);
					uploadpath = d1ate.concat(fileName);
					System.out.println(uploadpath);

					Path = getServletContext().getRealPath(File.separator + SAVE_DIR + File.separator + uploadpath);
					System.out.println(Path);
					filepart.write(Path);
					session.setAttribute("hospitalimage", uploadpath);
				}

				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);
				adminVo.setHospitalname(hospitalname);
				adminVo.setAddress(hospoitalAdd);
				adminVo.setEmail(email);
				adminVo.setPassword(password);
				adminVo.setJoiningdate(joiningdate);
//				adminVo.setImage(uploadpath);

				LoginVO loginvo = new LoginVO();
				loginvo.setAdminid(adminVo);
				loginvo.setEmail(email);
				loginvo.setPassword(password);

				AdminDao adminDao = new AdminDao();
				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				if (emailchack.isEmpty() == false) {
					logdao.loginupdatePassword(loginvo);
					adminDao.updateAdminProfile(adminVo);
					List adminlist = adminDao.editAdminProfile(adminVo);
					session.setAttribute("loginResult", "true");
					session.setAttribute("admindata", adminlist);
				} else if (emailchack.isEmpty() == true) {
					String chack = logdao.adminLoginUpdate(loginvo);
					if (chack.equals("add")) {
						adminDao.updateAdminProfile(adminVo);
						List adminlist = adminDao.editAdminProfile(adminVo);
						session.setAttribute("loginResult", "true");
						session.setAttribute("admindata", adminlist);
					} else {
						List adminlist = adminDao.editAdminProfile(adminVo);
						session.setAttribute("admindata", adminlist);
						session.setAttribute("not", "true");
					}
				}
			} else {
				session.setAttribute("wrong", "true");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void hospitalInsert(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			String respose = null;
			String email = request.getParameter("email");
			if (EmailValidation.isValid(email)) {
				
				String hospitalname = request.getParameter("hospitalname");
				String startingyear = request.getParameter("startingyear");
				String hospitaladdress = request.getParameter("hospitaladdress");
				String officeno = request.getParameter("officeno");
				String country = request.getParameter("country");
				String currency = request.getParameter("currency");
				String userchangeprofile = request.getParameter("userchangeprofile");
				String prescriptionprint = request.getParameter("prescriptionprint");
				String staffmessage = request.getParameter("staffmessage");
				String pass = request.getParameter("pass");

				Part hospitalLogo = request.getPart("hospitallogo");
				Part coverImage = request.getPart("coverimage");
				String hospitalLogoname = getSubmittedFileName(hospitalLogo);
				String coverImagename = getSubmittedFileName(coverImage);
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HHmmss");
				String hospitallogo = null;
				String hospitalcover = null;
				boolean s;
				boolean s2;
				int i = 0;
				if ((hospitalLogoname.isEmpty()) == false) {
					i++;
					Date date = new Date();
					String formeteddate = formatter.format(date);
					String uniq = String.valueOf(i);
					hospitallogo = formeteddate.concat(uniq).concat(hospitalLogoname);
					s = true;
				} else {
					s = false;
				}
				
				if ((coverImagename.isEmpty()) == false) {
					i++;
					String uniq = String.valueOf(i);
					Date date2 = new Date();
					String formeteddate2 = formatter.format(date2);
					hospitalcover = formeteddate2.concat(uniq).concat(coverImagename);
					s2 = true;
				} else {
					s2 = false;
				}
				
				Timestamp t1 = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String joiningdate = sdf.format(t1);
				AdminVo adminVo = new AdminVo();
				adminVo.setHospitalname(hospitalname);
				adminVo.setStartingyear(startingyear);
				adminVo.setAddress(hospitaladdress);
				adminVo.setEmail(email);
				adminVo.setPassword(pass);
				adminVo.setCon_no(officeno);
				adminVo.setCountry(country);
				adminVo.setCurrency(currency);
				adminVo.setUsercanchangeimage(userchangeprofile);
				adminVo.setHospitalnameprescription(prescriptionprint);
				adminVo.setMessageadmin(staffmessage);
				adminVo.setJoiningdate(joiningdate);
				adminVo.setCoverimage(hospitalcover);
				adminVo.setHospitallogo(hospitallogo);

				LoginVO loginvo = new LoginVO();
				loginvo.setAdminid(adminVo);
				loginvo.setEmail(email);
				loginvo.setPassword(pass);
				loginvo.setLastlogin(joiningdate);
				loginvo.setRoll("Admin");

				LoginDAO logdao = new LoginDAO();
				ArrayList<LoginVO> emailchack = logdao.emailverify(loginvo);
				if (emailchack.isEmpty() == true) {
					AdminDao admindao = new AdminDao();
					admindao.adminInsert(adminVo, loginvo);
					String Path = getServletContext()
							.getRealPath(File.separator + SAVE_DIR + File.separator + hospitallogo);
					String Path2 = getServletContext()
							.getRealPath(File.separator + SAVE_DIR + File.separator + hospitalcover);
					String uploadPath = getServletContext().getRealPath(File.separator + SAVE_DIR);
					File dir = new File(uploadPath);
					if (!dir.exists()) {
						dir.mkdirs();
					}
					System.out.println(Path);
					System.out.println(Path2);
					if (s == true) {
						hospitalLogo.write(Path);
					}
					if (s2 == true) {
						coverImage.write(Path2);
					}
					respose = "Success";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				} else {
					System.out.println("----------------------------");
					respose = "Email id";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(respose);
				}
			} else {
				respose = "Email id Error";
				System.out.println(respose);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(respose);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
