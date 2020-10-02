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

import DAO.BloodDonorDao;
import DAO.BloodManageDao;
import VO.AdminVo;
import VO.BloodDonorVo;
import VO.BloodManageList;
import VO.BloodManageVo;

/**
 * Servlet implementation class BloodManage
 */
@WebServlet("/BloodManage")
@MultipartConfig
public class BloodManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodManage() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String bloodmanageupdate = null;
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
			session.setAttribute("bloodManageAdminId", adminid);
			response.sendRedirect("Admin_Blood_Manage_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("bloodManageList")) {
			bloodManagetList(request, response);
		}
		if (flag.equalsIgnoreCase("donorList")) {
			DonorList(request, response);
		}
		if (flag.equalsIgnoreCase("editBloodManage")) {
			bloodManagetEdit(request, response);
		}
		if (flag.equalsIgnoreCase("editBloodDonor")) {
			bloodDonorEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteBloodManage")) {
			bloodManagetDelete(request, response);
			bloodManagetList(request, response);
		}
		if (flag.equalsIgnoreCase("deleteBloodDonor")) {
			bloodDonorDelete(request, response);
			DonorList(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			bloodManagetInsert(request, response);
			bloodManagetList(request, response);
		}
		if (flag.equalsIgnoreCase("insertblooddonor")) {
			bloodDonorInsert(request, response);
			DonorList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			bloodManagetUpdate(request, response);
			bloodManagetList(request, response);
		}
		if (flag.equalsIgnoreCase("blooddonorupdate")) {
			bloodDonorUpdate(request, response);
			DonorList(request, response);
		}
	}
	
	
	private void bloodManagetInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("bloodManageAdminId");
			String bloodGroup = request.getParameter("bloodgroup");
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));
			
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);
			
			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setAdminid(adminVo);
			bloodManageVo.setJoiningdate(joiningdate);
			bloodManageVo.setBloodgroup(bloodGroup);
			bloodManageVo.setNumberofbags(numberOfBags);

			BloodManageDao bloodManageDao = new BloodManageDao();
			String chackblood = bloodManageDao.bloodManageInsert(bloodManageVo);
			if (chackblood == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void bloodDonorInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("bloodManageAdminId");
			String name = request.getParameter("bool_dodnor_name");
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String bloodGroup = request.getParameter("blood_group");
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));
			String lastDonationDate = request.getParameter("last_donate_date");
			
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);
			
			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setAdminid(adminVo);
			bloodDonorVo.setName(name);
			bloodDonorVo.setAge(age);
			bloodDonorVo.setEmail(email);
			bloodDonorVo.setGender(gender);
			bloodDonorVo.setLastdonationdate(lastDonationDate);
			bloodDonorVo.setPhone(phone);
			bloodDonorVo.setJoiningdate(joiningdate);
			bloodDonorVo.setBloodgroup(bloodGroup);
			bloodDonorVo.setNumberofbags(numberOfBags);
			

			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			String chackblood = bloodDonorDao.bloodDonorInsert(bloodDonorVo);
			if (chackblood == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void bloodManagetList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BloodManageVo bloodManageVo = new  BloodManageVo();
		bloodManageVo.setAdminid(adminVo);

		BloodManageDao bloodManageDao = new BloodManageDao();
		ArrayList<BloodManageVo> bloodManageList = bloodManageDao.bloodManageList(bloodManageVo);
		List<BloodManageList> list = new ArrayList<BloodManageList>();

		for (BloodManageVo bloodManage : bloodManageList) {
			int id = bloodManage.getId();
			String bloodgroup = bloodManage.getBloodgroup();
			int numberofbags = bloodManage.getNumberofbags();
			System.out.println(bloodgroup);
			BloodManageList common = new BloodManageList();
			common.setId(id);
			common.setBloodgroup(bloodgroup);
			common.setNumberofbags(numberofbags);
			common.setBloodmanageupdate(bloodmanageupdate);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
		
	}

	private void DonorList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("-----------------------------------------------------------");
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");
		System.out.println(adminid);
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BloodDonorVo bloodDonorVo = new BloodDonorVo();
		bloodDonorVo.setAdminid(adminVo);
		
		BloodDonorDao bloodDonorDao = new BloodDonorDao();
		System.out.println(bloodDonorVo.getAdminid());
		ArrayList<BloodDonorVo> bloodDonorList = bloodDonorDao.bloodDonorList(bloodDonorVo);
		List<BloodManageList> list = new ArrayList<BloodManageList>();

		for (BloodDonorVo bloodDonor : bloodDonorList) {
			int id = bloodDonor.getId();
			String bloodgroup = bloodDonor.getBloodgroup();
			int numberofbags = bloodDonor.getNumberofbags();
			int age = bloodDonor.getAge();
			String name = bloodDonor.getName();
			String gender = bloodDonor.getGender();
			String phone = bloodDonor.getPhone();
			String email = bloodDonor.getEmail();
			String lastDonationDate = bloodDonor.getLastdonationdate();
			
			BloodManageList common = new BloodManageList();
			common.setId(id);
			common.setAdminid(adminid);
			common.setAge(age);
			common.setName(name);
			common.setGender(gender);
			common.setPhone(phone);
			common.setEmail(email);
			common.setLastdonationdate(lastDonationDate);
			common.setBloodgroup(bloodgroup);
			common.setNumberofbags(numberofbags);
			common.setBloodgroup(bloodgroup);
			common.setNumberofbags(numberofbags);
			common.setBloodmanageupdate(bloodmanageupdate);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
		
	}

	private void bloodManagetEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodManageId = Integer.parseInt(request.getParameter("bloodManageId"));
			System.out.println(bloodManageId);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(bloodManageId);
			
			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodManageVo> bloodManageList = bloodManageDao.bloodManageEdit(bloodManageVo);
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodManageVo bloodManage : bloodManageList) {
				int adminid = bloodManage.getAdminid().getId();
				String bloodgroup = bloodManage.getBloodgroup();
				String joiningdate = bloodManage.getJoiningdate();
				int numberofbags = bloodManage.getNumberofbags();
				BloodManageList  common = new  BloodManageList();
				common.setId(bloodManageId);
				common.setAdminid(adminid);
				common.setBloodgroup(bloodgroup);
				common.setNumberofbags(numberofbags);
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
	
	private void bloodDonorEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodDonorId = Integer.parseInt(request.getParameter("bloodDonorId"));
			System.out.println(bloodDonorId);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(bloodDonorId);
			
			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			ArrayList<BloodDonorVo> bloodDonorList = bloodDonorDao.bloodDonorEdit(bloodDonorVo);
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodDonorVo bloodDonor : bloodDonorList) {
				int adminid = bloodDonor.getAdminid().getId();
				int age = bloodDonor.getAge();
				String name = bloodDonor.getName();
				String gender = bloodDonor.getGender();
				String phone = bloodDonor.getPhone();
				String email = bloodDonor.getEmail();
				String bloodgroup = bloodDonor.getBloodgroup();
				int numberofbags = bloodDonor.getNumberofbags();
				String lastDonationDate = bloodDonor.getLastdonationdate();
				String joiningdate = bloodDonor.getJoiningdate();
				System.out.println(bloodgroup);
				BloodManageList  common = new  BloodManageList();
				common.setId(bloodDonorId);
				common.setAdminid(adminid);
				common.setName(name);
				common.setGender(gender);
				common.setAge(age);
				common.setPhone(phone);
				common.setEmail(email);
				common.setLastdonationdate(lastDonationDate);
				common.setBloodgroup(bloodgroup);
				common.setNumberofbags(numberofbags);
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
	
	private void bloodManagetUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("Id"));
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			String joiningdate = request.getParameter("joinig");
			String bloodGroup = request.getParameter("bloodgroup");
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));
		
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(id);
			bloodManageVo.setAdminid(adminVo);
			bloodManageVo.setJoiningdate(joiningdate);
			bloodManageVo.setBloodgroup(bloodGroup);
			bloodManageVo.setNumberofbags(numberOfBags);


			BloodManageDao bloodManageDao = new BloodManageDao();
			String chackblood = bloodManageDao.bloodManageUpdate(bloodManageVo);
			if (chackblood == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void bloodDonorUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("Id"));
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			String joiningdate = request.getParameter("joinig");			
			String name = request.getParameter("bool_dodnor_name");
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String bloodGroup = request.getParameter("blood_group");
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));
			String lastDonationDate = request.getParameter("last_donate_date");
			
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(id);
			bloodDonorVo.setAdminid(adminVo);
			bloodDonorVo.setName(name);
			bloodDonorVo.setAge(age);
			bloodDonorVo.setEmail(email);
			bloodDonorVo.setGender(gender);
			bloodDonorVo.setLastdonationdate(lastDonationDate);
			bloodDonorVo.setPhone(phone);
			bloodDonorVo.setJoiningdate(joiningdate);
			bloodDonorVo.setBloodgroup(bloodGroup);
			bloodDonorVo.setNumberofbags(numberOfBags);

			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			String chackblood = bloodDonorDao.bloodDonorUpdate(bloodDonorVo);
			if (chackblood == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void bloodManagetDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodManageId = Integer.parseInt(request.getParameter("bloodManageId"));
			System.out.println(bloodManageId);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(bloodManageId);
			
			BloodManageDao bloodManageDao = new BloodManageDao();
			String message = bloodManageDao.deleteBloodManage(bloodManageVo);
			if (message == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void bloodDonorDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodDonorId = Integer.parseInt(request.getParameter("bloodDonorId"));
			System.out.println(bloodDonorId);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(bloodDonorId);
			
			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			String message = bloodDonorDao.deleteBloodDonor(bloodDonorVo);
			if (message == "true") {
				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
