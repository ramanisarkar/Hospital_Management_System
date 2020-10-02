package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.DepartmentDao;
import DAO.SpecializationDao;
import VO.AdminVo;
import VO.DepartmentVo;
import VO.SpecializationList;
import VO.SpecializationVo;

/**
 * Servlet implementation class Specialization
 */
@WebServlet("/Specialization")
public class Specialization extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Specialization
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public Specialization() {
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
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("specializationadminid", adminid);
			departmentListForSpecialization(request, response);
			response.sendRedirect("Admin_Specialization_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("specializationlist")) {
			specializationList(request, response);
		}
		if (flag.equalsIgnoreCase("editspecialization")) {
			specializationEdit(request, response);
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
		if (flag.equalsIgnoreCase("insert")) {
			specializationInsert(request, response);
			specializationList(request, response);
		}

		if (flag.equalsIgnoreCase("deletespecialization")) {
			deleteSpecialization(request, response);
		}
		if (flag.equalsIgnoreCase("updatespecialization")) {
			specializationUpdate(request, response);
		}
	}

	private void specializationUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("specializationid"));
		String specializationName = request.getParameter("specializationame");

		SpecializationVo specializationVo = new SpecializationVo();
		specializationVo.setId(id);
		specializationVo.setSpecialization(specializationName);
		
		SpecializationDao specializationDao = new SpecializationDao();
		
		String message = specializationDao.updateSpecailization(specializationVo);
		if (message == "true") {
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
	}

	private void deleteSpecialization(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("specializationid"));
		System.out.println(id);

		SpecializationVo specializationVo = new SpecializationVo();
		specializationVo.setId(id);
		
		SpecializationDao specializationDao = new SpecializationDao();
		
		String message = specializationDao.deleteSpecailization(specializationVo);
		if (message == "true") {
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

	}

	private void specializationList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("---------------------------------------das;dksajdla-----------------");
		HttpSession session = request.getSession();
		String message = null;
		int adminid = (int) session.getAttribute("specializationadminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		SpecializationVo specializationVo = new SpecializationVo();
		specializationVo.setAdminid(adminVo);

		SpecializationDao specializationDao = new SpecializationDao();

		ArrayList<SpecializationVo> specializationlist = specializationDao.specializationList(specializationVo);
		System.out.println(specializationlist.size());
		if (session.getAttribute("addspecialization") != null) {
			message = "seccess";
			session.removeAttribute("addspecialization");
		} else if (session.getAttribute("specializationexist") != null) {
			message = "exist";
			session.removeAttribute("specializationexist");
		}

		List<SpecializationList> list = new ArrayList<SpecializationList>();

		for (SpecializationVo specialization : specializationlist) {
			int id = specialization.getId();
			String special = specialization.getSpecialization();
			String departmentName = specialization.getDepartmentid().getDepartment();
			SpecializationList common = new SpecializationList();
			common.setId(id);
			common.setSpecialization(special);
			common.setDepartmentname(departmentName);
			common.setMessage(message);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();

	}

	protected void specializationInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("-------------------------------------dsadsad-------------------------");
		HttpSession session = request.getSession();
		try {
			int adminid = (int) session.getAttribute("specializationadminid");
			int departmentid = Integer.parseInt(request.getParameter("departmentid"));
			String specializationname = request.getParameter("specializationname");
			
			DepartmentVo departmentVo = new DepartmentVo();
			departmentVo.setId(departmentid);
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			SpecializationVo specializationVo = new SpecializationVo();
			specializationVo.setAdminid(adminVo);
			specializationVo.setDepartmentid(departmentVo);
			specializationVo.setSpecialization(specializationname);

			SpecializationDao specializationDao = new SpecializationDao();
			ArrayList<SpecializationVo> specializationlist = specializationDao.chackDepartment(specializationVo);
			System.out.println(specializationlist.size());
			if (specializationlist.isEmpty() == true) {
				specializationDao.insertSpecialization(specializationVo);
				System.out.println("add---------------------------------------");
				session.setAttribute("addspecialization", "true");
			} else {
				System.out.println("add---------------------------------------");
				session.setAttribute("specializationexist", "true");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void specializationEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int specializationid = Integer.parseInt(request.getParameter("specializationid"));

		SpecializationVo specializationVo = new SpecializationVo();
		specializationVo.setId(specializationid);
		
		SpecializationDao specializationDao = new SpecializationDao();
		
		ArrayList<SpecializationVo> specializationlist =specializationDao.editSpecailization(specializationVo);
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
	
	private void departmentListForSpecialization(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("specializationadminid");
		
		AdminVo  adminVo = new AdminVo();
		adminVo.setId(adminid);

		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setDepartmentadminid(adminVo);

		DepartmentDao departmentDao = new DepartmentDao();
		
		ArrayList<DepartmentVo> departmentlist = departmentDao.departmentList(departmentvo);
		System.out.println(departmentlist.size());
		session.setAttribute("departmentlist", departmentlist);
	}
	
}
