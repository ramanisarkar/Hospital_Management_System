package Com;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import DAO.CategoryDao;
import VO.AdminVo;
import VO.CategoryList;
import VO.CategoryVo;

/**
 * Servlet implementation class Category
 */
@WebServlet("/Category")
@MultipartConfig
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Category() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("deleteCategory")) {
			categoryDelete(request, response);
		}
		if (flag.equalsIgnoreCase("categoryList")) {
			categoryList(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			categoryInsert(request, response);
			categoryList(request, response);
		}
	}

	private void categoryInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("medicineAdminId");
			String category = request.getParameter("category");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);
		
			CategoryVo categoryVo = new CategoryVo();
			categoryVo.setCategoryname(category);
			categoryVo.setJoiningdate(joiningdate);
			categoryVo.setAdminid(adminVo);
			
			CategoryDao categoryDao = new CategoryDao();
			String chackCategory = categoryDao.categoryInsert(categoryVo);
			if (chackCategory == "true") {
				System.out.println("category Insert");
			} else {
				System.out.println("category NOt insert");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void categoryDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			System.out.println(categoryId);
			
			CategoryVo categoryVo = new CategoryVo();
			categoryVo.setId(categoryId);
			
			CategoryDao categoryDao = new CategoryDao();
			String message = categoryDao.deleteCategory(categoryVo);
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	private void categoryList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("medicineAdminId");
		System.out.println(adminid);
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setAdminid(adminVo);
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<CategoryVo> categoryList= categoryDao.categoryList(categoryVo);
		
		ArrayList<CategoryList> category = new ArrayList<CategoryList>();
		for(CategoryVo categoryVo2 : categoryList) {
			int id = categoryVo2.getId();
			String categoryName = categoryVo2.getCategoryname();
			System.out.println(categoryName);
			CategoryList common = new  CategoryList();
			common.setId(id);
			common.setCategoryname(categoryName);
			category.add(common);	
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(category));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(category));
		out.flush();
		out.close();
	}
}
