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
import DAO.PatientDao;
import DAO.PatientRegistreationDao;
import VO.AdminVo;
import VO.BloodDonorVo;
import VO.BloodManageList;
import VO.BloodManageVo;
import VO.BloodOutwordVo;
import VO.BloodStockVo;
import VO.PatientRegistretionVo;
import VO.PatientVo;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("bloodManageAdminId", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Blood_Manage_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("bloodinwordlist")) {
			bloodManagetList(request, response);
		}
		if (flag.equalsIgnoreCase("viewBloodDonor")) {
			donorLogList(request, response);
		}
		if (flag.equalsIgnoreCase("bloodoutwordlist")) {
			bloodOutwordList(request, response);
		}
		if (flag.equalsIgnoreCase("donorList")) {
			DonorList(request, response);
		}
		if (flag.equalsIgnoreCase("editBloodInword")) {
			bloodManagetEdit(request, response);
		}
		if (flag.equalsIgnoreCase("editBloodDonor")) {
			bloodDonorEdit(request, response);
		}
		if (flag.equalsIgnoreCase("editBloodOutword")) {
			bloodOutwordEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteBloodInword")) {
			bloodInwordDelete(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("deleteBloodDonor")) {
			bloodDonorDelete(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("deleteBloodOutword")) {
			bloodOutwordDelete(request, response);
			bloodStock(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insertinword")) {
			bloodManagetInsert(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("insertblooddonor")) {
			bloodDonorInsert(request, response);
			DonorList(request, response);
		}
		if (flag.equalsIgnoreCase("insertOutword")) {
			bloodOutwordInsert(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("updatebloodinword")) {
			bloodOutwordUpdate(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("updateoutword")) {
			bloodManagetUpdate(request, response);
			bloodStock(request, response);
		}
		if (flag.equalsIgnoreCase("updatedonor")) {
			bloodDonorUpdate(request, response);
			DonorList(request, response);
		}
		if (flag.equalsIgnoreCase("bloodStock")) {
			bloodStock(request, response);
		}
	}

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientVo patientVo = new PatientVo();
		patientVo.setAdminid(adminVo);

		PatientDao patientDao = new PatientDao();
		ArrayList<PatientVo> patientRegistration = patientDao.patientList(patientVo);
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void bloodStock(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BloodStockVo bloodStockVo = new BloodStockVo();
		bloodStockVo.setAdminid(adminVo);

		BloodManageDao bloodManageDao = new BloodManageDao();
		ArrayList<BloodStockVo> bloodstock = bloodManageDao.bloodGroupStock(bloodStockVo);

		ArrayList<BloodManageList> list = new ArrayList<BloodManageList>();
		for (BloodStockVo bloodGroup : bloodstock) {
			int stock = bloodGroup.getNumberofbags();
			String bloodgroup = bloodGroup.getBloodgroup();
			BloodManageList common = new BloodManageList();
			common.setBloodgroup(bloodgroup);
			common.setNumberofbags(stock);
			common.setBloodmanageupdate(bloodmanageupdate);
			list.add(common);
		}
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void bloodManagetInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("bloodManageAdminId");
			String bloodGroup = request.getParameter("bloodgroup");
			String donationCampAddres = request.getParameter("donationCampAddres");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String zipCode = request.getParameter("zipCode");
			String lastDonation = request.getParameter("lastdate");
			java.sql.Date lastDonationDate = java.sql.Date.valueOf(lastDonation);
			int donorid = Integer.parseInt(request.getParameter("donorId"));
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(donorid);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setAdminid(adminVo);
			bloodManageVo.setDonorid(bloodDonorVo);
			bloodManageVo.setCity(city);
			bloodManageVo.setDonationcampaddres(donationCampAddres);
			bloodManageVo.setCountry(country);
			bloodManageVo.setState(state);
			bloodManageVo.setZipcode(zipCode);
			bloodManageVo.setLastdonationdate(lastDonationDate);
			bloodManageVo.setJoiningdate(joiningdate);
			bloodManageVo.setBloodgroup(bloodGroup);
			bloodManageVo.setNumberofbags(numberOfBags);

			BloodManageDao bloodManageDao = new BloodManageDao();
			String chackblood = bloodManageDao.bloodManageInsert(bloodManageVo);
			if (chackblood == "true") {

				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setBloodgroup(bloodGroup);
				bloodStockVo.setAdminid(adminVo);

				ArrayList<BloodStockVo> st = bloodManageDao.bloodGroupList(bloodStockVo);
				System.out.println("----------------------------");
				System.out.println(st.size());
				System.out.println(st);
				int stock = st.get(0).getNumberofbags();
				stock = stock + numberOfBags;
				System.out.println(stock);
				bloodStockVo.setNumberofbags(stock);

				String bloodstock = bloodManageDao.bloodStockUpdate(bloodStockVo);

				bloodmanageupdate = bloodstock;
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void bloodDonorInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("bloodManageAdminId");
			String firstName = request.getParameter("firstname");
			String middleName = request.getParameter("middlename");
			String lastName = request.getParameter("lastname");
			String dateofbirth = request.getParameter("dob");
			java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String standardCode = request.getParameter("standardcode");
			String mobileNumber = request.getParameter("mobilenumber");
			String phoneNumber = request.getParameter("phonenumber");
			String email = request.getParameter("email");
			String bloodGroup = request.getParameter("bloodgroup");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			ArrayList<BloodDonorVo> getlastrecord = bloodDonorDao.getlastrecord();
			SimpleDateFormat yl2d = new SimpleDateFormat("yy");
			String yearoflastdigital = yl2d.format(t1);
			String DonorId = null;
			if (getlastrecord.isEmpty() == true) {
				DonorId = "D".concat(yearoflastdigital).concat("0001");
			} else if (getlastrecord.isEmpty() == false) {
				String id = getlastrecord.get(0).getDonorid();
				String removeFirst = id.substring(3);

				int a1 = Integer.parseInt(removeFirst);
				a1++;
				int c = a1;
				String s23 = String.valueOf(c);
				if (c >= 1 && c < 10) {
					DonorId = "D".concat(yearoflastdigital).concat("000").concat(s23);
				} else if (c >= 10 && c < 100) {
					DonorId = "D".concat(yearoflastdigital).concat("00").concat(s23);
				} else if (c >= 100) {
					DonorId = "D".concat(yearoflastdigital).concat("0").concat(s23);
				} else if (c >= 1000) {
					DonorId = "D".concat(yearoflastdigital).concat(s23);
				}
			}

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setAdminid(adminVo);
			bloodDonorVo.setDonorid(DonorId);
			bloodDonorVo.setFirstname(firstName);
			bloodDonorVo.setLastname(lastName);
			bloodDonorVo.setMidalname(middleName);
			bloodDonorVo.setBirthdate(dateOfBirth);
			bloodDonorVo.setAge(age);
			bloodDonorVo.setEmail(email);
			bloodDonorVo.setGender(gender);
			bloodDonorVo.setMobilecountrycode(standardCode);
			bloodDonorVo.setMobileno(mobileNumber);
			bloodDonorVo.setPhoneno(phoneNumber);
			bloodDonorVo.setJoiningdate(joiningdate);
			bloodDonorVo.setBloodgroup(bloodGroup);

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

	private void bloodOutwordInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("bloodManageAdminId");
			int patientid = Integer.parseInt(request.getParameter("patientId"));
			String date = request.getParameter("date");
			int numberofbag = Integer.parseInt(request.getParameter("numberofbags"));
			int charge = Integer.parseInt(request.getParameter("charge"));
			String total = request.getParameter("total");
			String bloogroup = request.getParameter("blood_group");
			System.out.println(bloogroup);
			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientVo patientVo = new PatientVo();
			patientVo.setId(patientid);

			BloodOutwordVo bloodOutwordVo = new BloodOutwordVo();
			bloodOutwordVo.setAdminid(adminVo);
			bloodOutwordVo.setCharge(charge);
			bloodOutwordVo.setDate(date);
			bloodOutwordVo.setJoiningdate(joiningdate);
			bloodOutwordVo.setNumberofbag(numberofbag);
			bloodOutwordVo.setPatientid(patientVo);
			bloodOutwordVo.setTotal(total);

			BloodStockVo bloodStockVo = new BloodStockVo();
			bloodStockVo.setBloodgroup(bloogroup);
			bloodStockVo.setAdminid(adminVo);
			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodStockVo> bloodStock = bloodManageDao.bloodGroupList(bloodStockVo);
			System.out.println("------------------");
			System.out.println(bloodStock.size());
			System.out.println(bloodStock);
			if (bloodStock.isEmpty() == false) {
				int stock = bloodStock.get(0).getNumberofbags();
				System.out.println(stock);
				if (stock >= numberofbag) {
					System.out.println("conform");
					numberofbag = stock - numberofbag;
					bloodStockVo.setNumberofbags(numberofbag);
					bloodStockVo.setBloodgroup(bloogroup);
					String chackbloodstock = bloodManageDao.bloodStockUpdate(bloodStockVo);
					if (chackbloodstock == "true") {
						String chackblood = bloodManageDao.bloodDonorInsert(bloodOutwordVo);
						if (chackblood == "true") {
							bloodmanageupdate = "true";
						} else {
							bloodmanageupdate = "false";
						}
					} else {
						bloodmanageupdate = "false";
					}
				} else {
					bloodmanageupdate = "false";
				}
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

		BloodManageVo bloodManageVo = new BloodManageVo();
		bloodManageVo.setAdminid(adminVo);

		BloodManageDao bloodManageDao = new BloodManageDao();
		ArrayList<BloodManageVo> bloodManageList = bloodManageDao.bloodManageList(bloodManageVo);
		List<BloodManageList> list = new ArrayList<BloodManageList>();

		for (BloodManageVo bloodManage : bloodManageList) {
			int id = bloodManage.getId();
			String bloodgroup = bloodManage.getBloodgroup();
			int numberofbags = bloodManage.getNumberofbags();
			int age = bloodManage.getDonorid().getAge();
			String name = bloodManage.getDonorid().getFirstname();
			String adrress = bloodManage.getDonationcampaddres();
			String phone = bloodManage.getDonorid().getMobileno();
			String email = bloodManage.getDonorid().getEmail();
			java.sql.Date admitedate = bloodManage.getLastdonationdate();
			String date = admitedate.toString();
			BloodManageList common = new BloodManageList();
			common.setId(id);
			common.setAge(age);
			common.setName(name);
			common.setAddress(adrress);
			common.setPhone(phone);
			common.setEmail(email);
			common.setLastdonationdate(date);
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
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BloodDonorVo bloodDonorVo = new BloodDonorVo();
		bloodDonorVo.setAdminid(adminVo);

		BloodDonorDao bloodDonorDao = new BloodDonorDao();
		ArrayList<BloodDonorVo> bloodDonorList = bloodDonorDao.bloodDonorList(bloodDonorVo);
		List<BloodManageList> list = new ArrayList<BloodManageList>();
		for (BloodDonorVo bloodDonor : bloodDonorList) {
			int id = bloodDonor.getId();
			String donorid = bloodDonor.getDonorid();
			String name = bloodDonor.getFirstname();
			int age = bloodDonor.getAge();
			String phone = bloodDonor.getMobileno();
			String email = bloodDonor.getEmail();
			String bloodgroup = bloodDonor.getBloodgroup();
			String joining = bloodDonor.getJoiningdate();

			BloodManageList common = new BloodManageList();
			common.setId(id);
			common.setAge(age);
			common.setName(name);
			common.setDonorid(donorid);
			common.setJoiningdate(joining);
			common.setPhone(phone);
			common.setEmail(email);
			common.setBloodgroup(bloodgroup);
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

	private void bloodOutwordList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bloodManageAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BloodOutwordVo bloodOutwordVo = new BloodOutwordVo();
		bloodOutwordVo.setAdminid(adminVo);

		BloodDonorDao bloodDonorDao = new BloodDonorDao();
		ArrayList<BloodOutwordVo> bloodOutwordList = bloodDonorDao.bloodOutwordList(bloodOutwordVo);
		List<BloodManageList> list = new ArrayList<BloodManageList>();
		for (BloodOutwordVo bloodoutword : bloodOutwordList) {
			int id = bloodoutword.getId();
			String name = bloodoutword.getPatientid().getFirstname();
			String bloodgroup = bloodoutword.getPatientid().getBloodgroup();
			String email = bloodoutword.getPatientid().getEmail();
			String mobile = bloodoutword.getPatientid().getMobileno();
			int bag = bloodoutword.getNumberofbag();
			String date = bloodoutword.getDate();

			BloodManageList common = new BloodManageList();
			common.setId(id);
			common.setMobileno(mobile);
			common.setName(name);
			common.setEmail(email);
			common.setLastdonationdate(date);
			common.setMobileno(mobile);
			common.setBloodgroup(bloodgroup);
			common.setNumberofbags(bag);
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
			HttpSession session = request.getSession();
			int bloodManageId = Integer.parseInt(request.getParameter("bloodInwordId"));

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(bloodManageId);

			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodManageVo> bloodManageList = bloodManageDao.bloodManageEdit(bloodManageVo);
			session.setAttribute("bag", bloodManageList.get(0).getNumberofbags());
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodManageVo bloodManage : bloodManageList) {
				int adminid = bloodManage.getAdminid().getId();
				int donorid = bloodManage.getDonorid().getId();
				String bloodgroup = bloodManage.getBloodgroup();
				String email = bloodManage.getDonorid().getEmail();
				String phone = bloodManage.getDonorid().getMobileno();
				int age = bloodManage.getDonorid().getAge();
				int numberofbags = bloodManage.getNumberofbags();
				java.sql.Date admitedate = bloodManage.getLastdonationdate();
				String date = admitedate.toString();
				String address = bloodManage.getDonationcampaddres();
				String city = bloodManage.getCity();
				String gender = bloodManage.getDonorid().getGender();
				String state = bloodManage.getState();
				String cuntry = bloodManage.getCountry();
				String zipcode = bloodManage.getZipcode();
				String joiningdate = bloodManage.getJoiningdate();
				BloodManageList common = new BloodManageList();
				common.setId(bloodManageId);
				common.setAdminid(adminid);
				common.setDonorId(donorid);
				common.setBloodgroup(bloodgroup);
				common.setGender(gender);
				common.setEmail(email);
				common.setAge(age);
				common.setMobileno(phone);
				common.setNumberofbags(numberofbags);
				common.setLastdonationdate(date);
				common.setAddress(address);
				common.setCity(city);
				common.setCountry(cuntry);
				common.setState(state);
				common.setZipcode(zipcode);
				common.setJoiningdate(joiningdate);
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

	private void donorLogList(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodManageId = Integer.parseInt(request.getParameter("bloodDonorId"));

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(bloodManageId);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setDonorid(bloodDonorVo);

			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodManageVo> bloodManageList = bloodManageDao.getBloodDonorHistry(bloodManageVo);
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodManageVo bloodManage : bloodManageList) {
				int adminid = bloodManage.getAdminid().getId();
				int donorId = bloodManage.getDonorid().getId();
				String name = bloodManage.getDonorid().getFirstname();
				int age = bloodManage.getDonorid().getAge();
				String bloodgroup = bloodManage.getBloodgroup();
				int numberofbags = bloodManage.getNumberofbags();
				String donorid = bloodManage.getDonorid().getDonorid();
				java.sql.Date admitedate = bloodManage.getLastdonationdate();
				String date = admitedate.toString();
				String address = bloodManage.getDonationcampaddres();
				String city = bloodManage.getCity();
				String state = bloodManage.getState();
				String cuntry = bloodManage.getCountry();
				String zipcode = bloodManage.getZipcode();
				String joiningdate = bloodManage.getJoiningdate();
				BloodManageList common = new BloodManageList();
				common.setId(bloodManageId);
				common.setAge(age);
				common.setAdminid(adminid);
				common.setName(name);
				common.setDonorId(donorId);
				common.setDonorid(donorid);
				common.setBloodgroup(bloodgroup);
				common.setNumberofbags(numberofbags);
				common.setLastdonationdate(date);
				common.setAddress(address);
				common.setCity(city);
				common.setCountry(cuntry);
				common.setState(state);
				common.setZipcode(zipcode);
				common.setJoiningdate(joiningdate);
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

	private void bloodDonorEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bloodDonorId = Integer.parseInt(request.getParameter("bloodDonorId"));

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(bloodDonorId);

			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			ArrayList<BloodDonorVo> bloodDonorList = bloodDonorDao.bloodDonorEdit(bloodDonorVo);
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodDonorVo bloodDonor : bloodDonorList) {
				int adminid = bloodDonor.getAdminid().getId();
				String name = bloodDonor.getFirstname();
				String middlename = bloodDonor.getMidalname();
				String lastname = bloodDonor.getLastname();
				String gender = bloodDonor.getGender();
				java.sql.Date dob = bloodDonor.getBirthdate();
				String date = dob.toString();
				String email = bloodDonor.getEmail();
				String donorid = bloodDonor.getDonorid();
				String bloodgroup = bloodDonor.getBloodgroup();
				int age = bloodDonor.getAge();
				String code = bloodDonor.getMobilecountrycode();
				String mobileno = bloodDonor.getMobileno();
				String phoneno = bloodDonor.getPhoneno();
				String joiningdate = bloodDonor.getJoiningdate();
				BloodManageList common = new BloodManageList();
				common.setId(bloodDonorId);
				common.setAdminid(adminid);
				common.setDonorid(donorid);
				common.setName(name);
				common.setMiddelname(middlename);
				common.setLastname(lastname);
				common.setDob(date);
				common.setGender(gender);
				common.setEmail(email);
				common.setAge(age);
				common.setBloodgroup(bloodgroup);
				common.setPhone(phoneno);
				common.setCountrycode(code);
				common.setMobileno(mobileno);
				common.setJoiningdate(joiningdate);
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

	private void bloodOutwordEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int bloodOutwordId = Integer.parseInt(request.getParameter("bloodOutwordId"));

			BloodOutwordVo bloodOutwordVo = new BloodOutwordVo();
			bloodOutwordVo.setId(bloodOutwordId);

			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodOutwordVo> bloodOutwordList = bloodManageDao.bloodOutwordEdit(bloodOutwordVo);
			session.setAttribute("outwordbeg", bloodOutwordList.get(0).getNumberofbag());
			List<BloodManageList> list = new ArrayList<BloodManageList>();
			for (BloodOutwordVo bloodOutword : bloodOutwordList) {
				int adminid = bloodOutword.getAdminid().getId();
				String date = bloodOutword.getDate();
				int noofbeg = bloodOutword.getNumberofbag();
				int charg = bloodOutword.getCharge();
				String total = bloodOutwordVo.getTotal();
				int patientId = bloodOutword.getPatientid().getId();
				String firstname = bloodOutword.getPatientid().getFirstname();
				String midalname = bloodOutword.getPatientid().getMidalname();
				String lastname = bloodOutword.getPatientid().getLastname();
				java.sql.Date dob = bloodOutword.getPatientid().getBirthdate();
				String bod = dob.toString();
				String bloodgroup = bloodOutword.getPatientid().getBloodgroup();
				String gender = bloodOutword.getPatientid().getGender();
				String joiningdate = bloodOutword.getJoiningdate();
				BloodManageList common = new BloodManageList();
				common.setId(bloodOutwordId);
				common.setAdminid(adminid);
				common.setName(firstname);
				common.setMiddelname(midalname);
				common.setLastname(lastname);
				common.setDob(date);
				common.setLastdonationdate(bod);
				common.setGender(gender);
				common.setBloodgroup(bloodgroup);
				common.setDonorId(patientId);
				common.setCharge(charg);
				common.setTotal(total);
				common.setNumberofbags(noofbeg);
				common.setJoiningdate(joiningdate);
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

	private void bloodManagetUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int id = Integer.parseInt(request.getParameter("id"));
			int adminid = Integer.parseInt(request.getParameter("adminid"));
			String joiningdate = request.getParameter("joining");
			String bloodGroup = request.getParameter("bloodgroup");
			String donationCampAddres = request.getParameter("donationCampAddres");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String zipCode = request.getParameter("zipcode");
			String lastDonation = request.getParameter("lastdate");
			java.sql.Date lastDonationDate = java.sql.Date.valueOf(lastDonation);
			int donorid = Integer.parseInt(request.getParameter("donorId"));
			int numberOfBags = Integer.parseInt(request.getParameter("numberofbags"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(donorid);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(id);
			bloodManageVo.setAdminid(adminVo);
			bloodManageVo.setJoiningdate(joiningdate);
			bloodManageVo.setDonorid(bloodDonorVo);
			bloodManageVo.setCity(city);
			bloodManageVo.setDonationcampaddres(donationCampAddres);
			bloodManageVo.setCountry(country);
			bloodManageVo.setState(state);
			bloodManageVo.setZipcode(zipCode);
			bloodManageVo.setLastdonationdate(lastDonationDate);
			bloodManageVo.setJoiningdate(joiningdate);
			bloodManageVo.setBloodgroup(bloodGroup);
			bloodManageVo.setNumberofbags(numberOfBags);

			BloodManageDao bloodManageDao = new BloodManageDao();
			String chackblood = bloodManageDao.bloodManageUpdate(bloodManageVo);
			if (chackblood == "true") {

				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setBloodgroup(bloodGroup);
				bloodStockVo.setAdminid(adminVo);
				ArrayList<BloodStockVo> stock = bloodManageDao.bloodGroupList(bloodStockVo);
				int bag = (int) session.getAttribute("bag");
				int i = stock.get(0).getNumberofbags();
				int st = i - bag;
				st = st + numberOfBags;
				bloodStockVo.setBloodgroup(bloodGroup);
				bloodStockVo.setNumberofbags(numberOfBags);
				bloodManageDao.bloodStockUpdate(bloodStockVo);

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
			int id = Integer.parseInt(request.getParameter("id"));
			int adminid = Integer.parseInt(request.getParameter("adminid"));
			String joiningdate = request.getParameter("joining");
			String firstName = request.getParameter("firstname");
			String middleName = request.getParameter("middlename");
			String lastName = request.getParameter("lastname");
			String dateofbirth = request.getParameter("dateofbirth");
			java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String standardCode = request.getParameter("standardcode");
			String mobileNumber = request.getParameter("mobilenumber");
			String phoneNumber = request.getParameter("phonenumber");
			String email = request.getParameter("email");
			String bloodGroup = request.getParameter("bloodgroup");
			String donorId = request.getParameter("donorId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(id);
			bloodDonorVo.setAdminid(adminVo);
			bloodDonorVo.setDonorid(donorId);
			bloodDonorVo.setFirstname(firstName);
			bloodDonorVo.setLastname(lastName);
			bloodDonorVo.setMidalname(middleName);
			bloodDonorVo.setBirthdate(dateOfBirth);
			bloodDonorVo.setAge(age);
			bloodDonorVo.setEmail(email);
			bloodDonorVo.setGender(gender);
			bloodDonorVo.setMobilecountrycode(standardCode);
			bloodDonorVo.setMobileno(mobileNumber);
			bloodDonorVo.setPhoneno(phoneNumber);
			bloodDonorVo.setJoiningdate(joiningdate);
			bloodDonorVo.setBloodgroup(bloodGroup);

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

	private void bloodOutwordUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int id = Integer.parseInt(request.getParameter("id"));
			int adminid = Integer.parseInt(request.getParameter("adminid"));
			String joiningdate = request.getParameter("joining");
			int patientid = Integer.parseInt(request.getParameter("patientId"));
			String date = request.getParameter("date");
			int numberofbag = Integer.parseInt(request.getParameter("numberofbags"));
			int charge = Integer.parseInt(request.getParameter("charge"));
			String total = request.getParameter("total");
			String bloogroup = request.getParameter("blood_group");
			System.out.println(bloogroup);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientVo patientVo = new PatientVo();
			patientVo.setId(patientid);

			BloodOutwordVo bloodOutwordVo = new BloodOutwordVo();
			bloodOutwordVo.setId(id);
			bloodOutwordVo.setAdminid(adminVo);
			bloodOutwordVo.setCharge(charge);
			bloodOutwordVo.setDate(date);
			bloodOutwordVo.setJoiningdate(joiningdate);
			bloodOutwordVo.setNumberofbag(numberofbag);
			bloodOutwordVo.setPatientid(patientVo);
			bloodOutwordVo.setTotal(total);

			BloodManageDao bloodManageDao = new BloodManageDao();
			String chackblood = bloodManageDao.bloodOutwordUpdate(bloodOutwordVo);
			if (chackblood == "true") {

				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setBloodgroup(bloogroup);
				bloodStockVo.setAdminid(adminVo);
				ArrayList<BloodStockVo> stock = bloodManageDao.bloodGroupList(bloodStockVo);
				int bag = (int) session.getAttribute("outwordbeg");
				int i = stock.get(0).getNumberofbags();
				int st = i - bag;
				st = st + numberofbag;
				bloodStockVo.setBloodgroup(bloogroup);
				bloodStockVo.setNumberofbags(numberofbag);
				bloodManageDao.bloodStockUpdate(bloodStockVo);

				bloodmanageupdate = "true";
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void bloodInwordDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("bloodManageAdminId");
			int bloodManageId = Integer.parseInt(request.getParameter("bloodInwordId"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setId(bloodManageId);

			BloodManageDao bloodManageDao = new BloodManageDao();

			ArrayList<BloodManageVo> bloodinwordlist = bloodManageDao.bloodManageEdit(bloodManageVo);
			String bloodgroup = bloodinwordlist.get(0).getBloodgroup();
			int noofbag = bloodinwordlist.get(0).getNumberofbags();

			String message = bloodManageDao.deleteBloodManage(bloodManageVo);
			if (message == "true") {
				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setAdminid(adminVo);
				bloodStockVo.setBloodgroup(bloodgroup);

				ArrayList<BloodStockVo> bloodstok = bloodManageDao.bloodGroupList(bloodStockVo);
				int stock = bloodstok.get(0).getNumberofbags();
				stock = stock - noofbag;

				bloodStockVo.setNumberofbags(stock);
				String update = bloodManageDao.bloodStockUpdate(bloodStockVo);
				if (update == "true") {
					bloodmanageupdate = "true";
				} else {
					bloodmanageupdate = "false";
				}
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void bloodDonorDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("bloodManageAdminId");
			int bloodDonorId = Integer.parseInt(request.getParameter("bloodDonorId"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodDonorVo bloodDonorVo = new BloodDonorVo();
			bloodDonorVo.setId(bloodDonorId);

			BloodManageVo bloodManageVo = new BloodManageVo();
			bloodManageVo.setDonorid(bloodDonorVo);

			BloodDonorDao bloodDonorDao = new BloodDonorDao();
			BloodManageDao bloodManageDao = new BloodManageDao();
			ArrayList<BloodManageVo> bloodinwordlist = bloodManageDao.bloodManageEdit(bloodManageVo);
			
			int totalbloodbag = 0;
			String bloodgroup = bloodinwordlist.get(0).getBloodgroup();

			for (BloodManageVo bloodManage : bloodinwordlist) {
				int stock = bloodManage.getNumberofbags();
				totalbloodbag = totalbloodbag + stock;
			}

			String message = bloodDonorDao.deleteBloodManage(bloodManageVo);

			if (message == "true") {
				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setAdminid(adminVo);
				bloodStockVo.setBloodgroup(bloodgroup);

				ArrayList<BloodStockVo> bloodstok = bloodManageDao.bloodGroupList(bloodStockVo);
				int stock = bloodstok.get(0).getNumberofbags();
				stock = stock - totalbloodbag;

				bloodStockVo.setNumberofbags(stock);
				String update = bloodManageDao.bloodStockUpdate(bloodStockVo);
				if (update == "true") {
					String message1 = bloodDonorDao.deleteBloodDonor(bloodDonorVo);
					if (message1 == "true") {
						bloodmanageupdate = "true";
					} else {
						bloodmanageupdate = "false";
					}
				} else {
					bloodmanageupdate = "false";
				}
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void bloodOutwordDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("bloodManageAdminId");
			int bloodOutworsId = Integer.parseInt(request.getParameter("bloodOutwordId"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BloodOutwordVo bloodOutwordVo = new BloodOutwordVo();
			bloodOutwordVo.setId(bloodOutworsId);

			BloodManageDao bloodManageDao = new BloodManageDao();

			ArrayList<BloodOutwordVo> bloodinwordlist = bloodManageDao.bloodOutwordEdit(bloodOutwordVo);
			String bloodgroup = bloodinwordlist.get(0).getPatientid().getBloodgroup();
			int noofbag = bloodinwordlist.get(0).getNumberofbag();

			String message = bloodManageDao.deleteBloodOutword(bloodOutwordVo);
			if (message == "true") {
				BloodStockVo bloodStockVo = new BloodStockVo();
				bloodStockVo.setAdminid(adminVo);
				bloodStockVo.setBloodgroup(bloodgroup);

				ArrayList<BloodStockVo> bloodstok = bloodManageDao.bloodGroupList(bloodStockVo);
				int stock = bloodstok.get(0).getNumberofbags();
				stock = stock + noofbag;

				bloodStockVo.setNumberofbags(stock);
				String update = bloodManageDao.bloodStockUpdate(bloodStockVo);
				if (update == "true") {
					bloodmanageupdate = "true";
				} else {
					bloodmanageupdate = "false";
				}
			} else {
				bloodmanageupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
