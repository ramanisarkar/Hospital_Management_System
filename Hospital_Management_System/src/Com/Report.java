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

import DAO.ReportDao;
import VO.AdminVo;
import VO.ReportVo;

/**
 * Servlet implementation class Report
 */
@WebServlet("/Report")
@MultipartConfig
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String reportUpdate;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
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
		if (flag.equalsIgnoreCase("reportList")) {
			reportList(request, response);
		}
		if (flag.equalsIgnoreCase("reportEdit")) {
			reportEdit(request, response);
		}
		if (flag.equalsIgnoreCase("reportDelete")) {
			reportDelete(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("reposrtInsert")) {
			reportInsert(request, response);
			reportList(request, response);
		}
		if (flag.equalsIgnoreCase("reposrtUpdate")) {
			reportUpdate(request, response);
			reportList(request, response);
		}
		
	}
	
	private void reportInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			String name = request.getParameter("event");
			String discription = request.getParameter("eventtitle");
			float amount = Float.parseFloat(request.getParameter("amount"));

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			ReportVo reportVo = new ReportVo();
			reportVo.setAdminid(adminVo);
			reportVo.setAmount(amount);
			reportVo.setDescription(discription);
			reportVo.setReportname(name);
			reportVo.setJoiningdate(joiningdate);

			ReportDao reportDao = new ReportDao();
			String check = reportDao.insertaReport(reportVo);
			if (check == "true") {
				reportUpdate ="true";
			}else {
				reportUpdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void reportList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int adminid = Integer.parseInt(request.getParameter("adminId"));

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		ReportVo reportVo = new ReportVo();
		reportVo.setAdminid(adminVo);

		ReportDao reportDao = new ReportDao();
		ArrayList<ReportVo> reportlist = reportDao.reportList(reportVo);
		List<ReportVo> list = new ArrayList<ReportVo>();
		for (ReportVo report : reportlist) {
			int id = report.getId();
			String name = report.getReportname();
			String discription = report.getDescription();
			float amount= report.getAmount();
			String joining = report.getJoiningdate();
			ReportVo common = new ReportVo();
			common.setId(id);
			common.setReportname(name);
			common.setDescription(discription);
			common.setAmount(amount);
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
	
	private void reportEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int reportId = Integer.parseInt(request.getParameter("reportId"));

		ReportVo reportVo = new ReportVo();
		reportVo.setId(reportId);

		ReportDao reportDao = new ReportDao();
		ArrayList<ReportVo> reportlist = reportDao.reportEdit(reportVo);
		List<ReportVo> list = new ArrayList<ReportVo>();
		for (ReportVo report : reportlist) {
			int adminid = report.getAdminid().getId();
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);
			String name = report.getReportname();
			String discription = report.getDescription();
			float amount= report.getAmount();
			String joining = report.getJoiningdate();
			ReportVo common = new ReportVo();
			common.setId(reportId);
			common.setAdminid(adminVo);
			common.setReportname(name);
			common.setDescription(discription);
			common.setAmount(amount);
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
	
	private void reportUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("event");
			String discription = request.getParameter("eventtitle");
			float amount = Float.parseFloat(request.getParameter("amount"));
			String joiningdate = request.getParameter("joining");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			ReportVo reportVo = new ReportVo();
			reportVo.setId(id);
			reportVo.setAdminid(adminVo);
			reportVo.setAmount(amount);
			reportVo.setDescription(discription);
			reportVo.setReportname(name);
			reportVo.setJoiningdate(joiningdate);

			ReportDao reportDao = new ReportDao();
			String check = reportDao.updateReport(reportVo);
			if (check == "true") {
				reportUpdate ="true";
			}else {
				reportUpdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void reportDelete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("reportId"));
		
		ReportVo reportVo = new ReportVo();
		reportVo.setId(id);

		ReportDao reportDao = new ReportDao();		
		
	}
}
