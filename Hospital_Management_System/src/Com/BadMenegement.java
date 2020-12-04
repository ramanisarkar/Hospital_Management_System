package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.BedMemegamentDao;
import DAO.NurseDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientDao;
import DAO.PatientRegistreationDao;
import VO.AddBedVo;
import VO.AdminVo;
import VO.AssginBedNurseVo;
import VO.AssignBedVo;
import VO.BedCategoryVo;
import VO.BedManagementList;
import VO.NurseList;
import VO.NurseVo;
import VO.PatientChargesHistoryVo;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;

/**
 * Servlet implementation class BadMenegement
 */
@WebServlet("/BadMenegement")
@MultipartConfig
public class BadMenegement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String bedmenagementupdate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BadMenegement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insert")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("bedManegmentAdminId", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Add_Bed.jsp");
		}
		if (flag.equalsIgnoreCase("bedassign")) {
			int adminid = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("bedManegmentAdminId", adminid);
			patientList(request, response);
			nurseList(request, response);
			response.sendRedirect("Admin_Assign_Bed_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("editBedCategoryVo")) {
			editBedCategory(request, response);
		}
		if (flag.equalsIgnoreCase("listBedCategory")) {
			listBedCategory(request, response);
		}
		if (flag.equalsIgnoreCase("listBednumber")) {
			listBedCategoryNumber(request, response);
		}
		if (flag.equalsIgnoreCase("editAddBed")) {
			editAddBed(request, response);
		}
		if (flag.equalsIgnoreCase("listAddBed")) {
			listAddBed(request, response);
		}
		if (flag.equalsIgnoreCase("editAssignBed")) {
			editAssginBed(request, response);
		}
		if (flag.equalsIgnoreCase("listAssignBed")) {
			listAssignBed(request, response);
		}
	}

	private void patientList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bedManegmentAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientOtherInfo patientOtherInfo = new PatientOtherInfo();
		patientOtherInfo.setAdminid(adminVo);
		patientOtherInfo.setPatienttype("IN");

		PatientDao patientDao = new PatientDao();
		ArrayList<PatientOtherInfo> patientList = patientDao.inPatientList(patientOtherInfo);
		System.out.println(patientList.size());
		session.setAttribute("patientList", patientList);

	}

	private void nurseList(HttpServletRequest request, HttpServletResponse response) {
		try {

			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("bedManegmentAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			NurseVo nurseVo = new NurseVo();
			nurseVo.setAdminid(adminVo);

			NurseDao nurseDao = new NurseDao();
			ArrayList<NurseVo> nurselist = nurseDao.nurseList(nurseVo);
			session.setAttribute("nurseList", nurselist);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insertBedCategory")) {
			insertBedCategory(request, response);
			listBedCategory(request, response);
		}
		if (flag.equalsIgnoreCase("insertAddBed")) {
			insertAddBed(request, response);
			listAddBed(request, response);
		}
		if (flag.equalsIgnoreCase("insertAssignBed")) {
			insertAssignBed(request, response);
		}
		if (flag.equalsIgnoreCase("insertTransferBed")) {
			insertAssignBed(request, response);
		}
		if (flag.equalsIgnoreCase("updateBedCategory")) {
			updateBedCategory(request, response);
		}
		if (flag.equalsIgnoreCase("updateAddBed")) {
			updateAddBed(request, response);
		}
	}

	private void insertBedCategory(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bedManegmentAdminId");
		String bedtype = request.getParameter("bedtype");
		String loction = request.getParameter("bedlocation");
		float charge = Float.parseFloat(request.getParameter("bed_cost"));

		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
		String joiningdate = sdf.format(t1);

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BedCategoryVo bedCategoryVo = new BedCategoryVo();
		bedCategoryVo.setAdminid(adminVo);
		bedCategoryVo.setBedtype(bedtype);
		bedCategoryVo.setCharge(charge);
		bedCategoryVo.setLoction(loction);
		bedCategoryVo.setJoiningdate(joiningdate);

		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
		String message = bedMemegamentDao.insertBedCategory(bedCategoryVo);
		if (message.equalsIgnoreCase("true")) {
			bedmenagementupdate = "true";
		}
	}

	protected void editBedCategory(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("dnsadhksadls-------");
			int categoryid = Integer.parseInt(request.getParameter("bedCategoryId"));
			System.out.println(categoryid);
			BedCategoryVo bedCategoryVo = new BedCategoryVo();
			bedCategoryVo.setId(categoryid);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<BedCategoryVo> bedcategorylist = bedMemegamentDao.editBedCategory(bedCategoryVo);

			List<BedCategoryVo> list = new ArrayList<BedCategoryVo>();
			for (BedCategoryVo category : bedcategorylist) {
				int id = category.getId();
				String type = category.getBedtype();
				String loction = category.getLoction();
				float charges = category.getCharge();
				int adminid = category.getAdminid().getId();
				String joiningdate = category.getJoiningdate();
				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);
				BedCategoryVo common = new BedCategoryVo();
				common.setId(id);
				common.setAdminid(adminVo);
				common.setBedtype(type);
				common.setCharge(charges);
				common.setLoction(loction);
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

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bedManegmentAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		System.out.println(patientRegistration);
		System.out.println(patientRegistration.size());
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void listBedCategory(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int adminid = (int) session.getAttribute("bedManegmentAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			BedCategoryVo bedCategoryVo = new BedCategoryVo();
			bedCategoryVo.setAdminid(adminVo);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<BedCategoryVo> bedcategorylist = bedMemegamentDao.listBedCategory(bedCategoryVo);
			session.setAttribute("bedcategory", bedcategorylist);
			List<BedCategoryVo> list = new ArrayList<BedCategoryVo>();
			for (BedCategoryVo category : bedcategorylist) {
				int id = category.getId();
				String type = category.getBedtype();
				String loction = category.getLoction();
				float charges = category.getCharge();
				String joiningdate = category.getJoiningdate();
				adminVo.setId(adminid);
				BedCategoryVo common = new BedCategoryVo();
				common.setId(id);
				common.setAdminid(adminVo);
				common.setBedtype(type);
				common.setCharge(charges);
				common.setLoction(loction);
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

	private void updateBedCategory(HttpServletRequest request, HttpServletResponse response) {
		int cetid = Integer.parseInt(request.getParameter("categoryid"));
		int adminid = Integer.parseInt(request.getParameter("adminid"));
		String bedtype = request.getParameter("homecity");
		String loction = request.getParameter("state_name");
		float charge = Float.parseFloat(request.getParameter(""));
		String joiningdate = request.getParameter("joiningdate");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BedCategoryVo bedCategoryVo = new BedCategoryVo();
		bedCategoryVo.setAdminid(adminVo);
		bedCategoryVo.setBedtype(bedtype);
		bedCategoryVo.setCharge(charge);
		bedCategoryVo.setLoction(loction);
		bedCategoryVo.setJoiningdate(joiningdate);
		bedCategoryVo.setId(cetid);

		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
		String message = bedMemegamentDao.updateBedMenegamen(bedCategoryVo);
		if (message.equalsIgnoreCase("true")) {
			bedmenagementupdate = "true";
		}
	}

	private void insertAddBed(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("bedManegmentAdminId");
		int bedid = Integer.parseInt(request.getParameter("bed_categoryid"));
		int number = Integer.parseInt(request.getParameter("bed_number"));
		String description = request.getParameter("Description");

		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
		String joiningdate = sdf.format(t1);

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BedCategoryVo bedCategoryVo = new BedCategoryVo();
		bedCategoryVo.setId(bedid);

		AddBedVo addBedVo = new AddBedVo();
		addBedVo.setAdminid(adminVo);
		addBedVo.setBedcategoryid(bedCategoryVo);
		addBedVo.setBednumber(number);
		addBedVo.setDescription(description);
		addBedVo.setJoiningdate(joiningdate);

		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
		ArrayList<AddBedVo> list = bedMemegamentDao.checkAddBed(addBedVo);
		if (list.isEmpty() == true) {
			String message = bedMemegamentDao.insertAddBed(addBedVo);
			if (message.equalsIgnoreCase("true")) {
				bedmenagementupdate = "true";
			}
		} else {
			bedmenagementupdate = "false";
		}
	}

	private void listAddBed(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int adminid = (int) session.getAttribute("bedManegmentAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setAdminid(adminVo);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AddBedVo> addbedlist = bedMemegamentDao.listAddBed(addBedVo);

			List<BedManagementList> list = new ArrayList<BedManagementList>();
			for (AddBedVo bed : addbedlist) {
				int id = bed.getId();
				String type = bed.getBedcategoryid().getBedtype();
				String loction = bed.getBedcategoryid().getLoction();
				float charges = bed.getBedcategoryid().getCharge();
				int bedumber = bed.getBednumber();
				String description = bed.getDescription();
				adminVo.setId(adminid);
				BedManagementList common = new BedManagementList();
				common.setAddbedid(id);
				common.setAdminid(adminid);
				common.setDescription(description);
				common.setBedtype(type);
				common.setCharges(charges);
				common.setLocation(loction);
				common.setBednumber(bedumber);
				common.setBedupdate(bedmenagementupdate);
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

	private void listBedCategoryNumber(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int id = Integer.parseInt(request.getParameter("bedId"));

			BedCategoryVo bedCategoryVo = new BedCategoryVo();
			bedCategoryVo.setId(id);

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setBedcategoryid(bedCategoryVo);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AddBedVo> addbedlist = bedMemegamentDao.listAddBedNumber(addBedVo);

			List<BedManagementList> list = new ArrayList<BedManagementList>();
			for (AddBedVo bed : addbedlist) {
				int id1 = bed.getId();
				String type = bed.getBedcategoryid().getBedtype();
				String loction = bed.getBedcategoryid().getLoction();
				float charges = bed.getBedcategoryid().getCharge();
				int bedumber = bed.getBednumber();
				String description = bed.getDescription();
				int adminid = bed.getAdminid().getId();
				BedManagementList common = new BedManagementList();
				common.setAddbedid(id1);
				common.setAdminid(adminid);
				common.setDescription(description);
				common.setBedtype(type);
				common.setCharges(charges);
				common.setLocation(loction);
				common.setBednumber(bedumber);
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

	private void editAddBed(HttpServletRequest request, HttpServletResponse response) {
		try {
			int addbedid = Integer.parseInt(request.getParameter("addbedId"));

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setId(addbedid);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AddBedVo> bedlist = bedMemegamentDao.editAddBed(addBedVo);

			List<BedManagementList> list = new ArrayList<BedManagementList>();
			for (AddBedVo bed : bedlist) {
				int id = bed.getId();
				int bedcatid = bed.getBedcategoryid().getId();
				String loction = bed.getBedcategoryid().getLoction();
				float charges = bed.getBedcategoryid().getCharge();
				String description = bed.getDescription();
				int bedumber = bed.getBednumber();
				int adminid = bed.getAdminid().getId();
				String joiningdate = bed.getJoiningdate();
				BedManagementList common = new BedManagementList();
				common.setAddbedid(id);
				common.setBedcategoryid(bedcatid);
				common.setJoiningdate(joiningdate);
				common.setAdminid(adminid);
				common.setCharges(charges);
				common.setLocation(loction);
				common.setBednumber(bedumber);
				common.setDescription(description);
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

	private void updateAddBed(HttpServletRequest request, HttpServletResponse response) {
		int adminid = Integer.parseInt(request.getParameter(""));
		int addbedid = Integer.parseInt(request.getParameter(""));
		int bedid = Integer.parseInt(request.getParameter(""));
		int number = Integer.parseInt(request.getParameter(""));
		String description = request.getParameter("");
		String joiningdate = request.getParameter("");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BedCategoryVo bedCategoryVo = new BedCategoryVo();
		bedCategoryVo.setId(bedid);

		AddBedVo addBedVo = new AddBedVo();
		addBedVo.setId(addbedid);
		addBedVo.setAdminid(adminVo);
		addBedVo.setBedcategoryid(bedCategoryVo);
		addBedVo.setBednumber(number);
		addBedVo.setDescription(description);
		addBedVo.setJoiningdate(joiningdate);

		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
		ArrayList<AddBedVo> list = bedMemegamentDao.checkAddBed(addBedVo);
		if (list.isEmpty() == true) {
			String message = bedMemegamentDao.updateAddBed(addBedVo);
			if (message.equalsIgnoreCase("true")) {
				bedmenagementupdate = "true";
			}
		} else {
			bedmenagementupdate = "false";
		}
	}

	private void insertAssignBed(HttpServletRequest request, HttpServletResponse response) {
		try {

			HttpSession session = request.getSession(false);
			int adminid = (int) session.getAttribute("bedManegmentAdminId");
			int patientid = Integer.parseInt(request.getParameter("patient_id"));
			String patientstatus = request.getParameter("patient_status");
			int addbedid = Integer.parseInt(request.getParameter("bed_type_id"));
			int bedCategory = Integer.parseInt(request.getParameter("bed_number"));
			String allotmentDate = request.getParameter("allotment_date");
			String expectedDischargeDate = request.getParameter("discharge_time");
			String[] nurseId = request.getParameterValues("nurse[]");
			String description = request.getParameter("allotment_description");

			SimpleDateFormat sdfdate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfdateconvert = new SimpleDateFormat("yyyy-MM-dd");

			String allotment = sdfdateconvert.format(sdfdate.parse(allotmentDate));
			String dispatche = sdfdateconvert.format(sdfdate.parse(expectedDischargeDate));

			java.sql.Date allocation = java.sql.Date.valueOf(allotment);
			java.sql.Date dischage = java.sql.Date.valueOf(dispatche);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientid);

			BedCategoryVo bedCategoryVo = new BedCategoryVo();
			bedCategoryVo.setId(bedCategory);

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setId(addbedid);

			PatientOtherInfo otherInfo = new PatientOtherInfo();
			otherInfo.setStatus(patientstatus);
			otherInfo.setPatientregistrationid(patientVo);

			java.sql.Timestamp t1 = new Timestamp(System.currentTimeMillis());

			java.sql.Date date = java.sql.Date.valueOf(LocalDate.now());

			AssignBedVo assignBedVo = new AssignBedVo();
			assignBedVo.setAdminid(adminVo);
			assignBedVo.setAllotmentdate(allocation);
			assignBedVo.setBedid(addBedVo);
			assignBedVo.setDescription(description);
			assignBedVo.setExpecteddischargedate(dischage);
			assignBedVo.setPatientid(patientVo);
			assignBedVo.setJoiningdate(t1);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AssignBedVo> assignbedlist = bedMemegamentDao.checkAssginBed(assignBedVo);
			if (assignbedlist.isEmpty() == true) {
				Date d1 = sdfdate.parse(allotmentDate);
				Date d2 = sdfdate.parse(expectedDischargeDate);

				long diff = d2.getTime() - d1.getTime();
				long difference_In_Days = (diff / (1000 * 60 * 60 * 24)) % 365;
				
				String message = bedMemegamentDao.insertAssignBed(assignBedVo);
				if (message.equalsIgnoreCase("true")) {

					for (int i = 0; i < nurseId.length; i++) {

						int nurse = Integer.valueOf(nurseId[i]);

						NurseVo nurseVo = new NurseVo();
						nurseVo.setId(nurse);

						AssginBedNurseVo assginBedNurseVo = new AssginBedNurseVo();
						assginBedNurseVo.setAdminid(adminVo);
						assginBedNurseVo.setAssignbedvo(assignBedVo);
						assginBedNurseVo.setNurseid(nurseVo);

						bedMemegamentDao.insertAssignBedNurse(assginBedNurseVo);

						NurseDao nurseDao = new NurseDao();
						ArrayList<NurseVo> nurselist = nurseDao.nurseEdit(nurseVo);

						float charge = nurselist.get(0).getCharge();
						String name = nurselist.get(0).getFirstname();
						charge = charge * difference_In_Days;

						PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
						chargesHistoryVo.setAdminid(adminVo);
						chargesHistoryVo.setAssginbedid(assignBedVo);
						chargesHistoryVo.setAmount(charge);
						chargesHistoryVo.setChargetype("Nurse Charges");
						chargesHistoryVo.setUnit("" + difference_In_Days + "day");
						chargesHistoryVo.setDate(date);
						chargesHistoryVo.setPatientid(patientVo);
						chargesHistoryVo.setTitle(name);

						PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
						chargesHistoryDao.insertCharges(chargesHistoryVo);

					}
					ArrayList<AddBedVo> bedlist = bedMemegamentDao.editAddBed(addBedVo);

					float bedcharg = bedlist.get(0).getBedcategoryid().getCharge();
					bedcharg = difference_In_Days * bedcharg;

					PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
					chargesHistoryVo.setAdminid(adminVo);
					chargesHistoryVo.setAssginbedid(assignBedVo);
					chargesHistoryVo.setAmount(bedcharg);
					chargesHistoryVo.setChargetype("Bed Charge");
					chargesHistoryVo.setUnit("" + difference_In_Days + "day");
					chargesHistoryVo.setDate(date);
					chargesHistoryVo.setPatientid(patientVo);
					chargesHistoryVo.setTitle("Bed");

					PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
					chargesHistoryDao.insertCharges(chargesHistoryVo);
					
					PatientDao dao = new PatientDao();
					dao.patientUpdateStatus(otherInfo);
				}
			} else if (assignbedlist.isEmpty() == false) {
				String respose = "Success";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(respose);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void listAssignBed(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int adminid = (int) session.getAttribute("bedManegmentAdminId");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			AssignBedVo assignBedVo = new AssignBedVo();
			assignBedVo.setAdminid(adminVo);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AssignBedVo> addbedlist = bedMemegamentDao.listAssignBed(assignBedVo);

			List<BedManagementList> list = new ArrayList<BedManagementList>();
			for (AssignBedVo bed : addbedlist) {
				int id = bed.getId();
				String type = bed.getBedid().getBedcategoryid().getBedtype();
				int bednumber = bed.getBedid().getBednumber();
				String patient = bed.getPatientid().getFirstname();
				String Allotmentdata = bed.getAllotmentdate();
				String enddate = bed.getExpecteddischargedate();
				BedManagementList common = new BedManagementList();
				common.setId(id);
				common.setBednumber(bednumber);
				common.setPatientname(patient);
				common.setStartdate(Allotmentdata);
				common.setEnddate(enddate);
				common.setBedtype(type);
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

	private void editAssginBed(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

//	private void insertTransferBed(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession(false);
//		int adminid = (int) session.getAttribute("bedManegmentAdminId");
//		int patientid = Integer.parseInt(request.getParameter(""));
//		int addbedid = Integer.parseInt(request.getParameter(""));
//		String allotmentDate = request.getParameter("");
//		String expectedDischargeDate = request.getParameter("");
//		String[] nurseId = request.getParameterValues("");
//		String description = request.getParameter("");
//
//		Timestamp t1 = new Timestamp(System.currentTimeMillis());
//		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
//		String joiningdate = sdf.format(t1);
//
//		AdminVo adminVo = new AdminVo();
//		adminVo.setId(adminid);
//
//		PatientRegistretionVo patientVo = new PatientRegistretionVo();
//		patientVo.setId(patientid);
//
//		AddBedVo addBedVo = new AddBedVo();
//		addBedVo.setId(addbedid);
//
//		AssignBedVo assignBedVo = new AssignBedVo();
//		assignBedVo.setAdminid(adminVo);
//		assignBedVo.setAllotmentdate(allotmentDate);
//		assignBedVo.setBedid(addBedVo);
//		assignBedVo.setDescription(description);
//		assignBedVo.setExpecteddischargedate(expectedDischargeDate);
//		assignBedVo.setPatientid(patientVo);
//		assignBedVo.setJoiningdate(joiningdate);

//		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
//		String message = bedMemegamentDao.insertTransferBed();
//		if (message.equalsIgnoreCase("true")) {
//
//			for (int i = 0; i < nurseId.length; i++) {
//
//				int nurse = Integer.valueOf(nurseId[i]);
//
//				NurseVo nurseVo = new NurseVo();
//				nurseVo.setId(nurse);
//
//				AssginBedNurseVo assginBedNurseVo = new AssginBedNurseVo();
//				assginBedNurseVo.setAdminid(adminVo);
//				assginBedNurseVo.setTransferid();
//				assginBedNurseVo.setNurseid(nurseVo);
//
//				bedMemegamentDao.insertAssignBedNurse(assginBedNurseVo);
//			}
//		}

//	}
}