package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.ParsonRollDao;
import VO.AdminVo;
import VO.CommonFiledVo;
import VO.ParsonRollVo;
import VO.UserRoleVo;

/**
 * Servlet implementation class ParsonRoll
 */
@WebServlet("/ParsonRoll")
@MultipartConfig
public class ParsonRoll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String parsonroll;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParsonRoll() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insert")) {
			HttpSession session = request.getSession();
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("userAdminID", adminid);
			response.sendRedirect("Admin_Roll_Setting.jsp");
		}
		if (flag.equalsIgnoreCase("editUserPrivileges")) {
			editUserPrivileges(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insertUserPrivileges")) {
			insertUserPrivileges(request, response);
		}
	}

	private void insertUserPrivileges(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("userAdminID");
			System.out.println(adminid);
			int userid = Integer.parseInt(request.getParameter("RollName"));
			System.out.println(userid);
			String[] list = { "PatientRegistration", "department", "specialization", "doctor", "outpatient",
					"inpatient", "nurse", "supportstaff", "pharmacist", "laboratory", "accountant", "medicine",
					"treatment", "prescription", "addbed", "assginaddbed", "operationlist", "diagnosis", "bloodbank",
					"appointment", "invoice", "event", "message", "ambulance", "instrument", "report", "role" };
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			UserRoleVo userRoleVo = new UserRoleVo();
			userRoleVo.setId(userid);

			ParsonRollVo parsonRollVo = new ParsonRollVo();
			parsonRollVo.setAdminid(adminVo);
			parsonRollVo.setUserid(userRoleVo);
			parsonRollVo.setJoiningdate(timestamp);

			ParsonRollDao parsonRollDao = new ParsonRollDao();
			boolean s1=  true;
			for (int i = 0; i < list.length; i++) {
				String[] addlist = request.getParameterValues("permissions[" + list[i] + "][]");
				String[] role_id = request.getParameterValues("role_id[" + list[i] + "][]");
				if (addlist != null) {
					for (int j = 0; j < addlist.length; j++) {
						if (addlist[j].equalsIgnoreCase("owndata")) {
							parsonRollVo.setOwndata(s1);
						} else if (addlist[j].equalsIgnoreCase("view")) {
							parsonRollVo.setView(s1);
						} else if (addlist[j].equalsIgnoreCase("add")) {
							parsonRollVo.setAdd(s1);
						} else if (addlist[j].equalsIgnoreCase("edit")) {
							parsonRollVo.setEdit(s1);
						} else if (addlist[j].equalsIgnoreCase("delete")) {
							parsonRollVo.setDelete(s1);
						} 
					}
					parsonRollVo.setRollname(list[i]);
					if(role_id != null) {
						int id = Integer.valueOf(role_id[0]);
						parsonRollVo.setId(id);
						parsonRollDao.updateUserRole(parsonRollVo);
					}else {
						parsonRollDao.insertUserRole(parsonRollVo);
					}
					parsonRollVo.setOwndata(false);
					parsonRollVo.setAdd(false);
					parsonRollVo.setView(false);
					parsonRollVo.setEdit(false);
					parsonRollVo.setDelete(false);
					parsonroll = "true";
				}
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(parsonroll);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void editUserPrivileges(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("userAdminID");
			System.out.println(adminid);
			int userid = Integer.parseInt(request.getParameter("userRoleId"));
			System.out.println(userid);
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			UserRoleVo userRoleVo = new UserRoleVo();
			userRoleVo.setId(userid);

			ParsonRollVo parsonRollVo = new ParsonRollVo();
			parsonRollVo.setAdminid(adminVo);
			parsonRollVo.setUserid(userRoleVo);
			
			ParsonRollDao parsonRollDao = new ParsonRollDao();
			ArrayList<ParsonRollVo> userRole = parsonRollDao.editParsonRole(parsonRollVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (ParsonRollVo role : userRole) {
				CommonFiledVo common = new CommonFiledVo();
				common.setId(role.getId());
				common.setName(role.getRollname());
				common.setBool1(role.isOwndata());
				common.setBool2(role.isView());
				common.setBool3(role.isAdd());
				common.setBool4(role.isEdit());
				common.setBool5(role.isDelete());
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
}
