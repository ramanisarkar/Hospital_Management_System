package Com;

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

import com.google.gson.Gson;

import DAO.TreatmentDao;
import VO.AdminVo;
import VO.TreatmentList;
import VO.TreatmentVo;

/**
 * Servlet implementation class Treatment
 */
@WebServlet("/TreatmentUpdate")
@MultipartConfig
public class Treatment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Treatment() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String treatmentupdate = null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("treatmentAdminId", adminid);
			response.sendRedirect("Admin_Treatment_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("treatmentList")) {
			treatmentList(request, response);
		}
		if (flag.equalsIgnoreCase("editTreatment")) {
			treatmentEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteTreatment")) {
			treatmentDelete(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		String flag1 = request.getParameter("firstname");
		System.out.println(flag1);
		if (flag.equalsIgnoreCase("insert")) {
			treatmentInsert(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			treatmentUpdate(request, response);
		}
	}
	
	
	private void treatmentInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("treatmentAdminId");
			String treatmentName = request.getParameter("treatment_Name");
			float treatmentPrice = Float.parseFloat(request.getParameter("treatment_price"));
			
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			
			TreatmentVo treatmentVo = new TreatmentVo();
			treatmentVo.setAdminid(adminVo);
			treatmentVo.setJoiningdate(joiningdate);
			treatmentVo.setTreatmentname(treatmentName);
			treatmentVo.setTreatmentprice(treatmentPrice);

			TreatmentDao treatmentDao = new TreatmentDao();
			String chacktreatment = treatmentDao.treatmentInsert(treatmentVo);
			if (chacktreatment == "true") {
				treatmentupdate = "true";
			} else {
				treatmentupdate = "false";
			}
			System.out.println(treatmentupdate);
			if (treatmentupdate == "true") {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void treatmentList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("treatmentAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		TreatmentVo treatmentVo = new TreatmentVo();
		treatmentVo.setAdminid(adminVo);

		TreatmentDao treatmentDao = new TreatmentDao();
		ArrayList<TreatmentVo> treatmentlist = treatmentDao.treatmentList(treatmentVo);
		List<TreatmentList> list = new ArrayList<TreatmentList>();

		for (TreatmentVo treatment : treatmentlist) {
			int id = treatment.getId();
			String treatmentName = treatment.getTreatmentname();
			float treatmentPrise = treatment.getTreatmentprice();
			System.out.println(treatmentName);
			TreatmentList common = new TreatmentList();
			common.setId(id);
			common.setTreatmentname(treatmentName);
			common.setPrice(treatmentPrise);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
		
	}

	private void treatmentEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int treatmentId = Integer.parseInt(request.getParameter("treatmentId"));
			System.out.println(treatmentId);

			TreatmentVo treatmentVo = new TreatmentVo();
			treatmentVo.setId(treatmentId);
			
			TreatmentDao treatmentDao = new TreatmentDao();
			ArrayList<TreatmentVo> treatmentList = treatmentDao.treatmentEdit(treatmentVo);
			List<TreatmentList> list = new ArrayList<TreatmentList>();
			for (TreatmentVo treatment : treatmentList) {
				int adminid = treatment.getAdminid().getId();
				String treatmentName = treatment.getTreatmentname();
				String joiningdate = treatment.getJoiningdate();
				float price = treatment.getTreatmentprice();
				TreatmentList common = new TreatmentList();
				common.setId(treatmentId);
				common.setAdminid(adminid);
				common.setTreatmentname(treatmentName);
				common.setPrice(price);
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
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void treatmentUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("Id"));
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			String joiningdate = request.getParameter("joinig");
			String treatmentName = request.getParameter("treatment_Name");
			float treatmentPrice = Float.parseFloat(request.getParameter("treatment_price"));
		
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			TreatmentVo treatmentVo = new TreatmentVo();
			treatmentVo.setId(id);
			treatmentVo.setAdminid(adminVo);
			treatmentVo.setTreatmentname(treatmentName);
			treatmentVo.setTreatmentprice(treatmentPrice);
			treatmentVo.setJoiningdate(joiningdate);

			TreatmentDao treatmentDao = new TreatmentDao();
			String chacktreatment = treatmentDao.treatmeatUpdate(treatmentVo);
			if (chacktreatment == "true") {
				treatmentupdate = "true";
			} else {
				treatmentupdate = "false";
			}
			System.out.println(treatmentupdate);
			if (treatmentupdate == "true") {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void treatmentDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int treatmentId = Integer.parseInt(request.getParameter("treatmentId"));
			System.out.println(treatmentId);

			TreatmentVo treatmentVo = new TreatmentVo();
			treatmentVo.setId(treatmentId);

			TreatmentDao treatmentDao = new TreatmentDao();
			String message = treatmentDao.deleteTreatment(treatmentVo);
			if (message == "true") {
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
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
