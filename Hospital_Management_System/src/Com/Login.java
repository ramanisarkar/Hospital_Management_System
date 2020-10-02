package Com;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDAO;
import VO.AdminVo;
import VO.LoginVO;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
			System.out.println(email);
			System.out.println(pass);
			
			session.setAttribute("email", email);
			session.setAttribute("pass", pass);
			verifyEmailAndPassword(request, response);
		}
		else if (flag.equals("forgetpassword")) {
			forgotepassword(request, response);
		} else if (flag.equals("updatepassword")) {
//			updatepassword(request, response);
		}
	}

	private void verifyEmailAndPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		try {
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
				System.out.println("l1");
				System.out.println(l1.size());
				int loginid = l1.get(0).getId();
				String lastlogintime = l1.get(0).getLastlogin();
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
				String lastlogin = sdf.format(t1);				
				session.setAttribute("time", lastlogintime);
				
				System.out.println(l1.get(0).getRoll());
				String roll = l1.get(0).getRoll();
				if (roll.equals("Admin")) {
					AdminVo adminVo = new AdminVo();
					
					adminVo.setEmail(email);
					adminVo.setPassword(pass);
					
					ArrayList<AdminVo> admin = logindao.adminVerify(adminVo);
					
					session.setAttribute("hospitalname", admin.get(0).getHospitalname());
					session.setAttribute("hospitaldata", admin);
					session.setAttribute("hospitalimage", admin.get(0).getHospitallogo());
					
					
					loginvo.setLastlogin(lastlogin);
					loginvo.setId(loginid);
					
					logindao.logintime(loginvo);

					response.sendRedirect("Admin_Login.jsp");
					
				} 
//				else if (roll.equalsIgnoreCase("Professor")) {
//					ProfessorVo professorvo = new ProfessorVo();
//					professorvo.setEmail(email);
//					professorvo.setPassword(pass);
//					
//					ArrayList<ProfessorVo> professorlist = logindao.professorVerify(professorvo);
//					String professorroll = professorlist.get(0).getRoll();
//					System.out.println(professorroll);
//					session.setAttribute("professorname", professorlist.get(0).getFirstName());
//					
//					if (professorroll.equalsIgnoreCase("hod")) {
//						byte[] image= professorlist.get(0).getImage();
//						System.out.println(image);
//						FileOutputStream fout=new FileOutputStream("D:\\ing\\hod.jpg");  
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
//						response.sendRedirect("Professor_HOD_Login.jsp");
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

//		} catch (Exception e) {
//			HttpSession session = request.getSession();
//			session.setAttribute("loginResult", "true");
//			response.sendRedirect("Com_Login.jsp");
//			e.printStackTrace();
//		}
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