package Com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AllDataCountDao;
import VO.AdminVo;
import VO.AllDataCountVo;

/**
 * Servlet implementation class CommonDataCount
 */
@WebServlet("/CommonDataCount")
public class CommonDataCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonDataCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int adminid = (int)session.getAttribute("loginadminid");
		System.out.println(adminid);
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		AllDataCountVo allDataCountVo = new AllDataCountVo();
		allDataCountVo.setAdminid(adminVo);
		
		AllDataCountDao allDataCountDao = new AllDataCountDao();
		ArrayList<AllDataCountVo> alldata = allDataCountDao.allDataList(allDataCountVo);
		System.out.println(alldata.size());
		session.setAttribute("dashboarddata", alldata);
	}
}