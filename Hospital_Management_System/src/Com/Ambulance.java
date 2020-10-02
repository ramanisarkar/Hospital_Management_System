package Com;

import java.io.File;
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
import javax.servlet.http.Part;

import com.google.gson.Gson;

import DAO.AccountantStaffDao;
import DAO.AmbulanceDao;
import DAO.LoginDAO;
import DAO.NurseDao;
import VO.AccountantList;
import VO.AccountantStaffVo;
import VO.AdminVo;
import VO.AmbulanceList;
import VO.AmbulanceVo;
import VO.DepartmentVo;
import VO.LoginVO;
import VO.NurseVo;
import VO.PatientVo;

/**
 * Servlet implementation class Abulance
 */
@WebServlet("/Ambulance")
@MultipartConfig
public class Ambulance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ambulance() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private String ambulanceeUpdate = null;

	private static final String SAVE_DIR_Images = "Ambulance_Image";

	private static String getSubmittedFileName(Part part) {
		String filename = "null";
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
			}
		}
		return filename;
	}

	private void ambulanceImage(boolean s, String profileImagepath, Part profileImage) {
		try {
			if (s == true) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImagepath);
				profileImage.write(Path);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("ambulanceAdminid", adminid);
			response.sendRedirect("Admin_Ambulance_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("accountantStaffList")) {
			ambulanceList(request, response);
		}
		if (flag.equalsIgnoreCase("editAccountantStaff")) {
			ambulanceEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteAccountantStaff")) {
			ambulanceDelete(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------sasasa--------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			ambulanceInsert(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			ambulanceUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("chackusername")) {
			ambulanceIdDispatch(request, response);
		}
	}

	private void ambulanceIdDispatch(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("ambulanceAdminid");
		
		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);
		
		AmbulanceVo ambulanceVo = new AmbulanceVo();
		ambulanceVo.setAdminid(adminVo);
		
		AmbulanceDao ambulanceDao = new AmbulanceDao();
		ArrayList<PatientVo> getlastrecord = ambulanceDao.getlastrecord();
		
	}

	private void ambulanceList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("ambulanceAdminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		AmbulanceVo ambulanceVo = new AmbulanceVo();
		ambulanceVo.setAdminid(adminVo);

		AmbulanceDao ambulanceDao = new AmbulanceDao();
		ArrayList<AmbulanceVo> ambulanceList = ambulanceDao.ambulanceList(ambulanceVo);
		List<AmbulanceList> list = new ArrayList<AmbulanceList>();
		for (AmbulanceVo ambulance : ambulanceList) {
			int id = ambulance.getId();
			String name = ambulance.getName();
			String photo = ambulance.getDriverimage();
			String registerno = ambulance.getRegistrationnumber();
			String ambulanceid = ambulance.getAmbulanceid();
			AmbulanceList common = new AmbulanceList();
			common.setId(id);
			common.setName(name);
			common.setDriverimage(photo);
			common.setRegistrationnumber(registerno);
			common.setAmbulanceid(ambulanceid);
			common.setAmbulanceupdate(ambulanceeUpdate);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void ambulanceInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminId = (int) session.getAttribute("ambulanceAdminid");
			String ambulanceId = request.getParameter("ambulanceId");
			String registrationnNumber = request.getParameter("registrationnNumber");
			String driverName = request.getParameter("driverName");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String description = request.getParameter("description");

			Part profileImage = request.getPart("profileimage");
			String profileImageName = getSubmittedFileName(profileImage);
			String profileImagepath = null;

			boolean s;
			int i = 1;
			if ((profileImageName.isEmpty()) == false) {
				String uniq = String.valueOf(i);
				profileImagepath = ambulanceId.concat(uniq).concat("@").concat(profileImageName);
				s = true;
			} else {
				s = false;
			}

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminId);

			AmbulanceVo ambulanceVo = new AmbulanceVo();
			ambulanceVo.setAddress(address);
			ambulanceVo.setAdminid(adminVo);
			ambulanceVo.setDescription(description);
			ambulanceVo.setDriverimage(profileImagepath);
			ambulanceVo.setJoiningdate(joiningdate);
			ambulanceVo.setName(driverName);
			ambulanceVo.setPhone(phone);
			ambulanceVo.setRegistrationnumber(registrationnNumber);
			ambulanceVo.setAmbulanceid(ambulanceId);

			AmbulanceDao ambulanceDao = new AmbulanceDao();
			String chackdoctor = ambulanceDao.ambulanceInsert(ambulanceVo);
			if (chackdoctor == "true") {
				String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
				File imageDir = new File(uploadImagePath);
				if (!imageDir.exists()) {
					imageDir.mkdirs();
				}
				ambulanceImage(s, profileImagepath, profileImage);
				ambulanceeUpdate = "true";
			} else {
				ambulanceeUpdate = "false";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void ambulanceEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int ambulanceId = Integer.parseInt(request.getParameter("ambulanceId"));
		System.out.println(ambulanceId);

		AmbulanceVo ambulanceVo = new AmbulanceVo();
		ambulanceVo.setId(ambulanceId);

		AmbulanceDao ambulanceDao = new AmbulanceDao();
		ArrayList<AmbulanceVo> ambulanceList = ambulanceDao.ambulanceEdit(ambulanceVo);
		List<AmbulanceList> list = new ArrayList<AmbulanceList>();
		for (AmbulanceVo ambulance : ambulanceList) {
			int adminid = ambulance.getAdminid().getId();
			String driverName = ambulance.getName();
			String ambulanceid = ambulance.getAmbulanceid();
			String registerno = ambulance.getRegistrationnumber();
			String phone = ambulance.getPhone();
			String address = ambulance.getAddress();
			String discription = ambulance.getDescription();
			String profileimage = ambulance.getDriverimage();
			String profileimagename = "";
			if (profileimage != null) {
				int a = profileimage.indexOf("@");
				a++;
				profileimagename = profileimage.substring(a);
			}
			String joiningdate = ambulance.getJoiningdate();
			AmbulanceList common = new AmbulanceList();
			common.setId(ambulanceId);
			common.setAdminid(adminid);
			common.setName(driverName);
			common.setAddress(address);
			common.setAmbulanceid(ambulanceid);
			common.setDescription(discription);
			common.setDriverimage(profileimage);
			common.setDriverimagename(profileimagename);
			common.setJoiningdate(joiningdate);
			common.setPhone(phone);
			common.setRegistrationnumber(registerno);
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

	private void ambulanceUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			int id = Integer.parseInt(request.getParameter("AmbulanceId"));
			String joiningdate = request.getParameter("joinig");
			String ambulanceId = request.getParameter("ambulanceId");
			String registrationnNumber = request.getParameter("registrationnNumber");
			String driverName = request.getParameter("driverName");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String description = request.getParameter("description");
			String editprofileImage = request.getParameter("editprofileImage");
			System.out.println(editprofileImage);

			Part profileImage = request.getPart("profileimage");
			String profileImageName = getSubmittedFileName(profileImage);
			System.out.println(profileImage);
			String profileImagepath = null;

			boolean s;
			int i = 1;
			if ((profileImageName.isEmpty()) == false) {
				String Path = getServletContext()
						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + editprofileImage);
				File dir = new File(Path);
				dir.delete();
				String uniq = String.valueOf(i);
				profileImagepath = ambulanceId.concat(uniq).concat("@").concat(profileImageName);
				s = true;
			} else {
				s = false;
				profileImagepath = editprofileImage;
			}

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			AmbulanceVo ambulanceVo = new AmbulanceVo();
			ambulanceVo.setAddress(address);
			ambulanceVo.setAdminid(adminVo);
			ambulanceVo.setDescription(description);
			ambulanceVo.setAmbulanceid(ambulanceId);
			ambulanceVo.setDriverimage(profileImagepath);
			ambulanceVo.setId(id);
			ambulanceVo.setJoiningdate(joiningdate);
			ambulanceVo.setName(driverName);
			ambulanceVo.setPhone(phone);
			ambulanceVo.setRegistrationnumber(registrationnNumber);

			AmbulanceDao ambulanceDao = new AmbulanceDao();
			String ambulance = ambulanceDao.ambulanceUpdate(ambulanceVo);
			if (ambulance == "Add") {
				ambulanceeUpdate = "true";
				ambulanceImage(s, profileImagepath, profileImage);
				System.out.println(ambulanceeUpdate);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(ambulanceeUpdate);
			} else {
				System.out.println("supportStaff profile was not update");
				ambulanceeUpdate = "false";
				System.out.println(ambulanceeUpdate);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(ambulanceeUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void ambulanceDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
   			int ambulanceId = Integer.parseInt(request.getParameter("ambulanceId"));
   			System.out.println(ambulanceId);
   			
   			AmbulanceVo ambulanceVo = new AmbulanceVo();
   			ambulanceVo.setId(ambulanceId);
   			
   			AmbulanceDao ambulanceDao = new AmbulanceDao();
   			ArrayList<AmbulanceVo> ambulanceList = ambulanceDao.ambulanceEdit(ambulanceVo);
   			String profileimage = ambulanceList.get(0).getDriverimage();
			String message = ambulanceDao.deleteAmbulance(ambulanceVo);
			if (message == "true") {
				if ((profileimage.isEmpty()) == false) {
					String Path = getServletContext()
							.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileimage);
					File dir = new File(Path);
					dir.delete();
				}
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
