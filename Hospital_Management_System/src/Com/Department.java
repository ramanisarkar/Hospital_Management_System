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
import VO.AdminVo;
import VO.DepartmentList;
import VO.DepartmentVo;

/**
 * Servlet implementation class College
 */
@WebServlet("/Department")
public class Department extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Department() {
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
			session.setAttribute("departmentadminid", adminid);
			response.sendRedirect("Admin_Department_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("departmentlist")) {
			departmentList(request, response);
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
			departmentInsert(request, response);
			departmentList(request, response);
		}
	
		if (flag.equalsIgnoreCase("deletedepartment")) {
			deleteDepatment(request, response);
		}
	}

	private void deleteDepatment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("depid"));
		System.out.println(id);
		
		DepartmentVo departmentVo = new DepartmentVo();
		departmentVo.setId(id);
		
		DepartmentDao departmentDao = new DepartmentDao();
		String message = departmentDao.deleteDepartment(departmentVo);
		if(message == "true") {
			String respose = "seccess";
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(respose);
		}
		else {
			String respose = "error";
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(respose);
		}
		
	}

	private void departmentList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String  message=null;
		int adminid = (int) session.getAttribute("departmentadminid");
		
		AdminVo  adminVo = new AdminVo();
		adminVo.setId(adminid);

		DepartmentVo departmentvo = new DepartmentVo();
		departmentvo.setDepartmentadminid(adminVo);

		DepartmentDao departmentDao = new DepartmentDao();
		
		ArrayList<DepartmentVo> semlist = departmentDao.departmentList(departmentvo);
		System.out.println(semlist.size());
		if(session.getAttribute("adddepartment") != null) {
			message = "seccess";
			session.removeAttribute("adddepartment");
		}else if (session.getAttribute("departmentexist") != null) {
			message = "exist";
			session.removeAttribute("departmentexist");
		}

		List<DepartmentList> list = new ArrayList<DepartmentList>();

		for (DepartmentVo sem : semlist) {
			int id = sem.getId();
			String department = sem.getDepartment();
			DepartmentList common = new DepartmentList();
			common.setId(id);
			common.setDepartment(department);
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
	
	
	protected void departmentInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("-------------------------------------dsadsad-------------------------");
		HttpSession session = request.getSession();
		try {
			int adminid = (int) session.getAttribute("departmentadminid");
			
			String departmentname = request.getParameter("departmentname");
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);
			
			DepartmentVo departmentvo = new DepartmentVo();
			departmentvo.setDepartment(departmentname);
			departmentvo.setDepartmentadminid(adminVo);

			DepartmentDao departmentdao = new DepartmentDao();
			ArrayList<DepartmentVo> departmentist = departmentdao.chackDepartment(departmentvo);
			System.out.println(departmentist.size());
			if (departmentist.isEmpty() == true) {
				departmentdao.insertDepartment(departmentvo);
				System.out.println("add---------------------------------------");
				session.setAttribute("adddepartment", "true");
			} else {
				System.out.println("add---------------------------------------");
				session.setAttribute("departmentexist", "true");
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}
}
