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

import DAO.AllDataCountDao;
import DAO.CategoryDao;
import DAO.EventDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.CategoryVo;
import VO.EventForVo;
import VO.EventVo;

/**
 * Servlet implementation class Event
 */
@WebServlet("/Event")
@MultipartConfig
public class Event extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String eventUpdate;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("eventadminid", adminid);
			response.sendRedirect("Admin_Event_Manage.jsp");
		}
		if (flag.equalsIgnoreCase("eventList")) {
			eventList(request, response);
		}
		if (flag.equalsIgnoreCase("eventEdit")) {
			eventEdit(request, response);
		}
		if (flag.equalsIgnoreCase("eventDelete")) {
			eventDelete(request, response);
			eventList(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------sasasa--------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insertevent")) {
			eventInsert(request, response);
			eventList(request, response);
		}
		if (flag.equalsIgnoreCase("updateevent")) {
			eventUpdate(request, response);
			eventList(request, response);
		}
	}

	private void eventInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("eventadminid");
			String event = request.getParameter("event");
			String title = request.getParameter("eventtitle");
			String commnet = request.getParameter("eventcommnet");
			String startdate = request.getParameter("startdate");
			String[] eventfor = request.getParameterValues("eventfor[]");
			String enddate = request.getParameter("eventenddate");
			String eventf = "";
			for (int i = 0; i < eventfor.length; i++) {
				eventf = eventf.concat(eventfor[i]).concat("/");
			}
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			EventVo eventVo = new EventVo();
			eventVo.setAdminid(adminVo);
			eventVo.setEventname(event);
			eventVo.setTitle(title);
			eventVo.setEventfor(eventf);
			eventVo.setComment(commnet);
			eventVo.setEnddate(enddate);
			eventVo.setStartdate(startdate);
			eventVo.setJoiningdate(joiningdate);

			EventDao eventDao = new EventDao();

			String check = eventDao.insertEvent(eventVo);
			if (check == "true") {
				eventUpdate="true";
				AllDataCountVo allDataCountVo = new AllDataCountVo();
				allDataCountVo.setAdminid(adminVo);
				AllDataCountDao allDataCountDao = new AllDataCountDao();
				allDataCountDao.increaseData(allDataCountVo, "event");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void eventList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("eventadminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			EventVo eventVo = new EventVo();
			eventVo.setAdminid(adminVo);

			EventDao eventDao = new EventDao();
			ArrayList<EventVo> eventlist = eventDao.listEvent(eventVo);
			List<EventVo> list = new ArrayList<EventVo>();
			for (EventVo event : eventlist) {
				int id = event.getId();
				String name = event.getEventname();
				String title = event.getTitle();
				String comment = event.getComment();
				String stdate = event.getStartdate();
				String enddate = event.getEnddate();
				String eventfor = event.getEventfor();
				EventVo common = new EventVo();
				common.setId(id);
				common.setEventname(name);
				common.setTitle(title);
				common.setComment(comment);
				common.setStartdate(stdate);
				common.setEnddate(enddate);
				common.setEventfor(eventfor);
				common.setUpdateevent(eventUpdate);
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

	private void eventEdit(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			int eventId = Integer.parseInt(request.getParameter("eventId"));
//			System.out.println(eventId);
//
//			EventVo eventVo = new EventVo();
//			eventVo.setId(eventId);
//
//			EventForVo eventForVo = new EventForVo();
//			eventForVo.setEventid(eventVo);
//
//			EventDao eventDao = new EventDao();
//			ArrayList<EventForVo> eventList = eventDao.editEventFor(eventForVo);
//			List<EventVo> list = new ArrayList<EventVo>();
//			for (EventForVo event : eventList) {
//				int adminid = event.getAdminid().getId();
//				String name = event.getEventid().getEventname();
//				String title = event.getEventid().getTitle();
//				String comment = event.getEventid().getComment();
//				String stdate = event.getEventid().getStartdate();
//				String enddate = event.getEventid().getEnddate();
//				String joiningdate = event.getEventid().getJoiningdate();
//				String eventfor = event.getEventfor();
//				EventVo common = new EventVo();
//				common.setId(eventId);
//				common.setAid(adminid);
//				common.setEventname(name);
//				common.setTitle(title);
//				common.setComment(comment);
//				common.setStartdate(stdate);
//				common.setEnddate(enddate);
//				common.setEventfor(eventfor);
//				common.setJoiningdate(joiningdate);
//				list.add(common);
//			}
//			Gson gson = new Gson();
//			System.out.println(gson.toJson(list));
//			PrintWriter out = response.getWriter();
//			out.print(gson.toJson(list));
//			out.flush();
//			out.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	private void eventUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int adminid = Integer.parseInt(request.getParameter("adminid"));
			int id = Integer.parseInt(request.getParameter("eventId"));
			String joiningdate = request.getParameter("joining");
			String event = request.getParameter("event");
			String title = request.getParameter("eventtitle");
			String commnet = request.getParameter("eventcommnet");
			String startdate = request.getParameter("startdate");
			String[] eventfor = request.getParameterValues("eventfor[]");
			System.out.println(eventfor.length);
			String enddate = request.getParameter("eventenddate");
			String eventf = "";
			for (int i = 0; i < eventfor.length; i++) {
				eventf = eventf.concat(eventfor[i]).concat("/");
			}
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			EventVo eventVo = new EventVo();
			eventVo.setId(id);
			eventVo.setAdminid(adminVo);
			eventVo.setEventname(event);
			eventVo.setTitle(title);
			eventVo.setComment(commnet);
			eventVo.setEnddate(enddate);
			eventVo.setStartdate(startdate);
			eventVo.setJoiningdate(joiningdate);

			EventDao eventDao = new EventDao();
			String check = eventDao.updateEvent(eventVo);

			if (check == "true") {

				eventUpdate = "true";
			} else {
				eventUpdate = "false";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void eventDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int eventId = Integer.parseInt(request.getParameter("eventId"));
			System.out.println(eventId);

			EventVo eventVo = new EventVo();
			eventVo.setId(eventId);

			EventDao eventDao = new EventDao();
			String mess = eventDao.deleteEvent(eventVo);
			if (mess == "true") {
				eventUpdate = "true";
			} else {
				eventUpdate = "false";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
