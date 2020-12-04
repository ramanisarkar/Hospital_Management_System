package Com;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;

import com.google.gson.Gson;

import DAO.LoginDAO;
import DAO.ParsonRollDao;
import VO.AdminVo;
import VO.CommonFiledVo;
import VO.DoctorVo;
import VO.LaboratoryVo;
import VO.LoginVO;
import VO.NurseVo;
import VO.ParsonRollVo;
import VO.PatientRegistretionVo;
import VO.UserRoleVo;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	static Logger logger = Logger.getLogger(Login.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println("--------");
		if (flag.equals("CheckRole")) {
			checkRoleUser(request, response);
		}
		if (flag.equals("PermissionRole")) {
			PermissionRole(request, response);
		}
	}

	private void PermissionRole(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String role = (String) session.getAttribute("UserRole");
			int id = (int) session.getAttribute("loginadminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(id);
			
			UserRoleVo userRoleVo = new UserRoleVo();
			userRoleVo.setUser(role);
			userRoleVo.setAdminid(adminVo);
				
			ParsonRollDao parsonRollDao = new ParsonRollDao();
			List<Object[]> roleList = parsonRollDao.getListUserRole(userRoleVo);
			
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (int i = 0; i < roleList.size(); i++) {
				CommonFiledVo common = new CommonFiledVo();
				common.setBool1((boolean) roleList.get(i)[0]);
				common.setBool2( Boolean.valueOf((boolean) roleList.get(i)[1]));
				common.setField3(roleList.get(i)[5].toString());
				list.add(common);
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag = request.getParameter("flag");
		if (flag.equals("verify")) {
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			String pass = request.getParameter("pwd");

			session.setAttribute("email", email);
			session.setAttribute("pass", pass);
			verifyEmailAndPassword(request, response);
		} else if (flag.equals("forgetpassword")) {
			forgotepassword(request, response);
		} else if (flag.equals("updatepassword")) {
//			updatepassword(request, response);
		}
	}

	private void checkRoleUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			String rolename = request.getParameter("userRoleId");
			System.out.println(rolename);
			int adminid = Integer.parseInt(request.getParameter("adminid"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			LoginVO loginVO = new LoginVO();
			loginVO.setRoll(rolename);
			loginVO.setAdminid(adminVo);

			LoginDAO loginDAO = new LoginDAO();
			ArrayList<LoginVO> userList = loginDAO.getUserWithRole(loginVO);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (LoginVO role : userList) {
				CommonFiledVo common = new CommonFiledVo();
				common.setId(role.getId());
				if (rolename.equalsIgnoreCase("Doctor")) {
					common.setId2(role.getDoctorid().getId());
					common.setField1(
							role.getDoctorid().getFirstname().concat(" ").concat(role.getDoctorid().getLastname()));
					common.setField2(role.getDoctorid().getProfileimage());
					
				} else if (rolename.equalsIgnoreCase("Patient") || rolename.equalsIgnoreCase("Outpatient")) {
					common.setId2(role.getPatientloginid().getId());
					common.setField1(role.getPatientloginid().getFirstname().concat(" ")
							.concat(role.getPatientloginid().getLastname()));
					common.setField2(role.getPatientloginid().getProfileimage());
				}

				else if (rolename.equalsIgnoreCase("Support Staff")) {
					common.setId2(role.getSupportstaffloginid().getId());
					common.setField1(role.getSupportstaffloginid().getFirstname().concat(" ")
							.concat(role.getSupportstaffloginid().getLastname()));
					common.setField2(role.getSupportstaffloginid().getProfileimage());
				}

				else if (rolename.equalsIgnoreCase("Pharmacist")) {
					common.setId2(role.getPharmacistloginid().getId());
					common.setField1(role.getPharmacistloginid().getFirstname().concat(" ")
							.concat(role.getPharmacistloginid().getLastname()));
					common.setField2(role.getPharmacistloginid().getProfileimage());
				}

				else if (rolename.equalsIgnoreCase("Laboratory Staff")) {
					common.setId2(role.getLaboratoryloginid().getId());
					common.setField1(role.getLaboratoryloginid().getFirstname().concat(" ")
							.concat(role.getLaboratoryloginid().getLastname()));
					common.setField2(role.getLaboratoryloginid().getProfileimage());
				}

				else if (rolename.equalsIgnoreCase("Nurse")) {
					common.setId2(role.getNurseloginid().getId());
					common.setField1(role.getNurseloginid().getFirstname().concat(" ")
							.concat(role.getNurseloginid().getLastname()));
					common.setField2(role.getNurseloginid().getProfileimage());
					
				} else if (rolename.equalsIgnoreCase("Accountant Staff")) {
					common.setId2(role.getAccountantloginid().getId());
					common.setField1(role.getAccountantloginid().getFirstname().concat(" ")
							.concat(role.getAccountantloginid().getLastname()));
					common.setField2(role.getAccountantloginid().getProfileimage());
				}
				common.setName(rolename);
				list.add(common);
			}
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

	private void verifyEmailAndPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			System.out.println("-----------------------");
			HttpSession session = request.getSession(false);
			String email = (String) session.getAttribute("email");
			String pass = (String) session.getAttribute("pass");
			if (EmailValidation.isValid(email)) {

				LoginVO loginvo = new LoginVO();
				loginvo.setEmail(email);
				loginvo.setPassword(pass);

				LoginDAO logindao = new LoginDAO();
				Timestamp t1 = new Timestamp(System.currentTimeMillis());

				ArrayList<LoginVO> l1 = logindao.verify(loginvo);

				int loginid = l1.get(0).getId();
				String lastlogintime = l1.get(0).getLastlogin();

				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String lastlogin = sdf.format(t1);
				session.setAttribute("time", lastlogintime);

				String roll = l1.get(0).getRoll();
				session.setAttribute("UserRole", roll);
				if (roll.equals("Admin")) {
					AdminVo adminVo = new AdminVo();

					adminVo.setEmail(email);
					adminVo.setPassword(pass);
					ArrayList<AdminVo> admin = logindao.adminVerify(adminVo);
					logger.trace("admin" + admin.toString());
					int id = admin.get(0).getId();
					session.setAttribute("hospitalname", admin.get(0).getHospitalname());
					session.setAttribute("hospitaldata", admin);
					session.setAttribute("hospitalimage", admin.get(0).getHospitallogo());
					session.setAttribute("loginadminid", id);

					CommonDataCount commonDataCount = new CommonDataCount();
					commonDataCount.doGet(request, response);

					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);

					logindao.logintime(loginvo);

					response.sendRedirect("Admin_Login.jsp");
				} else if (roll.equalsIgnoreCase("Doctor")) {
					DoctorVo doctorVo = new DoctorVo();
					doctorVo.setEmail(email);
					doctorVo.setPassword(pass);

					ArrayList<DoctorVo> doctorList = logindao.doctorVerify(doctorVo);
					session.setAttribute("hospitalname", doctorList.get(0).getAdminid().getHospitalname());
					session.setAttribute("userdata", doctorList);
					session.setAttribute("hospitallogo", doctorList.get(0).getAdminid().getHospitallogo());
					session.setAttribute("userimage", doctorList.get(0).getProfileimage());
					session.setAttribute("loginadminid", doctorList.get(0).getAdminid().getId());

					CommonDataCount commonDataCount = new CommonDataCount();
					commonDataCount.doGet(request, response);

					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);

					logindao.logintime(loginvo);

					response.sendRedirect("Roll_Base_Login.jsp");
				} else if (roll.equalsIgnoreCase("Nurse")) {
					NurseVo nurseVo = new NurseVo();
					nurseVo.setEmail(email);
					nurseVo.setPassword(pass);
					
					ArrayList<NurseVo> userList = logindao.nurseVerify(nurseVo);
					session.setAttribute("hospitalname", userList.get(0).getAdminid().getHospitalname());
					session.setAttribute("userdata", userList);
					session.setAttribute("hospitallogo", userList.get(0).getAdminid().getHospitallogo());
					session.setAttribute("userimage", userList.get(0).getProfileimage());
					session.setAttribute("loginadminid", userList.get(0).getAdminid().getId());

					CommonDataCount commonDataCount = new CommonDataCount();
					commonDataCount.doGet(request, response);

					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);

					logindao.logintime(loginvo);

					response.sendRedirect("Roll_Base_Login.jsp");
				} else if (roll.equalsIgnoreCase("Patient")) {
					PatientRegistretionVo patientRegistretionVo =  new PatientRegistretionVo();
					patientRegistretionVo.setEmail(email);
					patientRegistretionVo.setPassword(pass);

					ArrayList<PatientRegistretionVo> userList = logindao.patientVerify(patientRegistretionVo);
					session.setAttribute("hospitalname", userList.get(0).getAdminid().getHospitalname());
					session.setAttribute("userdata", userList);
					session.setAttribute("hospitallogo", userList.get(0).getAdminid().getHospitallogo());
					session.setAttribute("userimage", userList.get(0).getProfileimage());
					session.setAttribute("loginadminid", userList.get(0).getAdminid().getId());

					CommonDataCount commonDataCount = new CommonDataCount();
					commonDataCount.doGet(request, response);

					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);

					logindao.logintime(loginvo);

					response.sendRedirect("Roll_Base_Login.jsp");
				} else if (roll.equalsIgnoreCase("Laboratory Staff")) {
					LaboratoryVo laboratoryVo = new LaboratoryVo();
					laboratoryVo.setEmail(email);
					laboratoryVo.setPassword(pass);

					ArrayList<LaboratoryVo> userList = logindao.laboratoryVerify(laboratoryVo);
					session.setAttribute("hospitalname", userList.get(0).getAdminid().getHospitalname());
					session.setAttribute("userdata", userList);
					session.setAttribute("hospitallogo", userList.get(0).getAdminid().getHospitallogo());
					session.setAttribute("userimage", userList.get(0).getProfileimage());
					session.setAttribute("loginadminid", userList.get(0).getAdminid().getId());

					CommonDataCount commonDataCount = new CommonDataCount();
					commonDataCount.doGet(request, response);

					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);

					logindao.logintime(loginvo);

					response.sendRedirect("Roll_Base_Login.jsp");
				}
//					} else if (professorroll.equalsIgnoreCase("professor")) {
//						byte[] image= professorlist.get(0).getImage();
//						System.out.println(image);
//						FileOutputStream fout=new FileOutputStream("D:\\ing\\professor.jpg");  
//						fout.write(image);  
//						fout.close();
//
//						loginvo.setLastlogin(lastlogin);
//						loginvo.setId(loginid);
//						
//						logindao.logintime(loginvo);
//						
//						session.setAttribute("professordata", professorlist);
//						
//						response.sendRedirect("Professor_Login.jsp");
//					} 
//				}
//				else if (roll.equalsIgnoreCase("Student")) {
//					
//					StudentVo studentvo = new StudentVo();
//					studentvo.setEmail(email);
//					studentvo.setPassword(pass);
//					ArrayList<StudentVo> studentlist = logindao.studentVerify(studentvo);
//					session.setAttribute("studentname", studentlist.get(0).getFirstName());
//					session.setAttribute("studentid", studentlist.get(0).getId());
//					byte[] image= studentlist.get(0).getImage();
//					System.out.println(image);
//					FileOutputStream fout=new FileOutputStream("D:\\ing\\student.jpg");  
//					fout.write(image);  
//					fout.close();
//					
//					loginvo.setLastlogin(lastlogin);
//					loginvo.setId(loginid);
//					
//					logindao.logintime(loginvo);
//					
//					session.setAttribute("studentdata", studentlist);
//					response.sendRedirect("Student_Login.jsp");
//				}
			} else {

				session.setAttribute("wrong", "true");
				response.sendRedirect("Com_Login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error("Login verify error:line no" + e + e.getStackTrace()[2].getLineNumber());
			HttpSession session = request.getSession();
			session.setAttribute("loginResult", "true");
			response.sendRedirect("Com_Login.jsp");

		}
	}

//	private void updatepassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		try {
//			HttpSession session = request.getSession(false);
//			String email = (String) session.getAttribute("email");
//			String userroll = (String) session.getAttribute("roll");
//			String password = request.getParameter("password");
//			String conformpassword = request.getParameter("cpassword");
//			if (EmailValidation.isValid(email)) {
//				if (password.equals(conformpassword)) {
//					if (userroll.equals("Admin")) {
//						CollegeVo collegevo = new CollegeVo();
//						collegevo.setEmail(email);
//						collegevo.setPassword(conformpassword);
//
//						LoginVO login = new LoginVO();
//						login.setEmail(email);
//						login.setPassword(conformpassword);
//
//						LoginDAO logindao = new LoginDAO();
////						logindao.forgetPasswordCollege(collegevo, login);
//					} else if (userroll.equals("professor")) {
//						ProfessorVo professorvo = new ProfessorVo();
//						professorvo.setEmail(email);
//						professorvo.setPassword(conformpassword);
//
//						LoginVO login = new LoginVO();
//						login.setEmail(email);
//						login.setPassword(conformpassword);
//
//						LoginDAO logindao = new LoginDAO();
////						logindao.forgetPasswordProfessor(professorvo, login);
//					}
//					else if (userroll.equals("student")) {
//						StudentVo studentvo = new StudentVo();
//						studentvo.setEmail(email);
//						studentvo.setPassword(conformpassword);
//
//						LoginVO login = new LoginVO();
//						login.setEmail(email);
//						login.setPassword(conformpassword);
//
//						LoginDAO logindao = new LoginDAO();
////						logindao.forgetPasswordStudent(studentvo, login);
//					}
//					response.sendRedirect("Com_Login.jsp");
//				} else {
//					session.setAttribute("error", "true");
//					response.sendRedirect("forgetPasswordupdate.jsp");
//				}
//
//			} else {
//				session.setAttribute("wrong", "true");
//				response.sendRedirect("forgetPasswordupdate.jsp");
//			}
//		} catch (Exception e) {
//			HttpSession session = request.getSession();
//			session.setAttribute("error", "true");
//			response.sendRedirect("forgetPasswordupdate.jsp");
//		}
//
//	}

	private void forgotepassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String email = request.getParameter("email");
			HttpSession session = request.getSession();
			if (EmailValidation.isValid(email)) {
				LoginVO login = new LoginVO();
				login.setEmail(email);

				LoginDAO logindao = new LoginDAO();
				ArrayList<LoginVO> forgetpass = logindao.emailverify(login);
				String roll = forgetpass.get(0).getRoll();
				String forgetemail = forgetpass.get(0).getEmail();

				session.setAttribute("email", forgetemail);
				session.setAttribute("roll", roll);
				response.sendRedirect("forgetPasswordupdate.jsp");

			} else {
				session.setAttribute("wrong", "true");
				response.sendRedirect("forgetPasswordupdate.jsp");
			}
		} catch (Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("error", "true");
			response.sendRedirect("forgetpassword.jsp");
		}

	}

}