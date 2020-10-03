package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.DepartmentDao;
import DAO.MedicineDao;
import DAO.MessageDao;
import VO.AccountantList;
import VO.AccountantStaffVo;
import VO.AdminVo;
import VO.DepartmentVo;
import VO.MessageList;
import VO.MessageVo;

/**
 * Servlet implementation class Message
 */
@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Message() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private String messageUpdate = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("messageAdminid", adminid);
			response.sendRedirect("Admin_Message_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("messageInboxList")) {
			messageInboxList(request, response);
		}
		
		if (flag.equalsIgnoreCase("deleteAmbulanceStaff")) {
			messageDelete(request, response);
			messageInboxList(request, response);
		}
	}

	private void messageInboxList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("messageAdminId");
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		MessageVo messageVo = new MessageVo();
		messageVo.setAdminid(adminVo);
		
		MessageDao messageDao = new MessageDao();
		ArrayList<MessageVo> messagelist =  messageDao.messageList(messageVo);
		List<MessageList> list = new ArrayList<MessageList>();
   		for (MessageVo message : messagelist) {
   			int id = message.getId();
   			String date = message.getDate();
   			String comment = message.getMessagecomment();
   			String to = message.getMessageto();
   			String subject = message.getSubject();

   			MessageList common = new MessageList();
   			common.setId(id);
   			common.setDate(date);
   			common.setMessagecomment(comment);
   			common.setMessageto(to);
   			common.setSubject(subject);
   			common.setMessageupdate(messageUpdate);
   			list.add(common);
   		}
   		Gson gson = new Gson();
   		System.out.println(gson.toJson(list));
   		PrintWriter out = response.getWriter();
   		out.print(gson.toJson(list));
   		out.flush();
   		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------------sasasa--------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			messageInsert(request, response);
		}
	}

	private void messageInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("messageAdminId");
		String to = request.getParameter("messageto");
		String sub = request.getParameter("subject");
		String msg = request.getParameter("message");
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
		String joiningdate = sdf.format(t1);
		
		
		System.out.println(to+" "+sub+" "+msg+" "+user+" "+pass);
		String s1 = SentMail.send(to, sub, msg, user, pass);
		
		if(s1.equalsIgnoreCase("true")){
			MessageVo messageVo = new MessageVo();
			messageVo.setAdminid(adminVo);
			messageVo.setMessagecomment(msg);
			messageVo.setSubject(sub);
			messageVo.setDate(joiningdate);
			messageVo.setMessageto(to);
			
			MessageDao messageDao = new MessageDao();
			String message = messageDao.insertMessage(messageVo);
			if(message.equalsIgnoreCase("true") ) {
				messageUpdate= "true";
			}else { 
				messageUpdate= "false";
			}
		}
	}
	
	private void messageDelete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("-------------------------------------dsadsad-------------------------");
		HttpSession session = request.getSession();
		try {
		
			int id = Integer.parseInt(request.getParameter("messageId"));
			
			MessageVo messageVo = new MessageVo();
			messageVo.setId(id);

			MessageDao messageDao = new MessageDao();
			String message = messageDao.messageDelete(messageVo);
			if(message.equalsIgnoreCase("true") ) {
				messageUpdate= "true";
			}else { 
				messageUpdate= "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
