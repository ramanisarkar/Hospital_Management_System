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

import com.google.gson.Gson;

import DAO.SymptomsDao;
import VO.AdminVo;
import VO.SymptomsVo;

/**
 * Servlet implementation class Symptoms
 */
@WebServlet("/Symptoms")
@MultipartConfig
public class Symptoms extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String symptomsUpdate;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Symptoms() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("symptomsList")) {
			symptomsList(request, response);
		}
		if (flag.equalsIgnoreCase("symptomsDelete")) {
			symptomsDelete(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("precriptionSymptomesInsert")) {
			symptomsInsert(request, response);
		}
	}

	private void symptomsInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			int adminid = Integer.parseInt(request.getParameter("adinid"));
			String name = request.getParameter("name");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			SymptomsVo symptomsVo = new SymptomsVo();
			symptomsVo.setAdminid(adminVo);
			symptomsVo.setName(name);
			symptomsVo.setJoiningdate(joiningdate);

			SymptomsDao symptomsDao = new SymptomsDao();
			String check = symptomsDao.insertaSymptoms(symptomsVo);
			if (check == "true") {
				symptomsUpdate ="true";
			}else {
				symptomsUpdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void symptomsList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int adminid = Integer.parseInt(request.getParameter("adminId"));

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		SymptomsVo symptomsVo = new SymptomsVo();
		symptomsVo.setAdminid(adminVo);

		SymptomsDao symptomsDao = new SymptomsDao();
		ArrayList<SymptomsVo> symptomslist = symptomsDao.symptomsList(symptomsVo);
		List<SymptomsVo> list = new ArrayList<SymptomsVo>();
		for (SymptomsVo report : symptomslist) {
			int id = report.getId();
			String name = report.getName();
			String joining = report.getJoiningdate();
			SymptomsVo common = new SymptomsVo();
			common.setId(id);
			common.setName(name);
			common.setJoiningdate(joining);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}
	
	private void symptomsDelete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("symptomsId"));
		
		SymptomsVo symptomsVo = new SymptomsVo();
		symptomsVo.setId(id);
		
		SymptomsDao symptomsDao = new SymptomsDao();
		symptomsDao.deleteSymptomes(symptomsVo);
	}
}
