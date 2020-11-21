package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
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

import DAO.BedMemegamentDao;
import DAO.DoctorDao;
import DAO.OpreationDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientDao;
import VO.AddBedVo;
import VO.AdminVo;
import VO.AssignBedVo;
import VO.BedCategoryVo;
import VO.BedManagementList;
import VO.CommonDataVo;
import VO.CommonFiledVo;
import VO.DoctorVo;
import VO.OperationVo;
import VO.OpreationAddVo;
import VO.PatientChargesHistoryVo;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;

/**
 * Servlet implementation class OperationManagement
 */
@WebServlet("/OperationManagement")
@MultipartConfig
public class OperationManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String opreationUpdate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OperationManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			HttpSession session = request.getSession();
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("operationAdminid", adminid);
			patientList(request, response);
			doctorList(request, response);
			bedList(request, response);
			response.sendRedirect("Admin_Operation_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("listBednumber")) {
			listBedCategoryNumber(request, response);
		}
		if (flag.equalsIgnoreCase("operationList")) {
			operationList(request, response);
		}
		if (flag.equalsIgnoreCase("operationPrice")) {
			operationEdit(request, response);
		}
		if (flag.equalsIgnoreCase("operationApplyList")) {
			operationApplyList(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insertOperation")) {
			operationInsert(request, response);
			operationList(request, response);
		}
		if (flag.equalsIgnoreCase("insertOperationApply")) {
			operationApplyInsert(request, response);
			operationApplyList(request, response);
		}
	}

	private void listBedCategoryNumber(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int adminid = (int) session.getAttribute("operationAdminid");
			int id = Integer.parseInt(request.getParameter("bedId"));

			BedCategoryVo bedCategoryVo = new BedCategoryVo();
			bedCategoryVo.setId(id);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setAdminid(adminVo);
			addBedVo.setBedcategoryid(bedCategoryVo);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AddBedVo> addbedlist = bedMemegamentDao.listAddBedNumber(addBedVo);

			List<BedManagementList> list = new ArrayList<BedManagementList>();
			for (AddBedVo bed : addbedlist) {
				int id1 = bed.getId();
				String type = bed.getBedcategoryid().getBedtype();
				String loction = bed.getBedcategoryid().getLoction();
				int bedumber = bed.getBednumber();
				BedManagementList common = new BedManagementList();
				common.setAddbedid(id1);
				common.setBedtype(type);
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

	private void doctorList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("operationAdminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DoctorVo doctorVo = new DoctorVo();
		doctorVo.setAdminid(adminVo);

		DoctorDao doctorDao = new DoctorDao();
		ArrayList<DoctorVo> doctorList = doctorDao.doctorList(doctorVo);
		session.setAttribute("doctorList", doctorList);
	}

	private void operationList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("operationAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			OpreationAddVo opreationAddVo = new OpreationAddVo();
			opreationAddVo.setAdminid(adminVo);

			OpreationDao opreationDao = new OpreationDao();
			ArrayList<OpreationAddVo> opreationList = opreationDao.operationList(opreationAddVo);

			List<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (OpreationAddVo operation : opreationList) {
				int id1 = operation.getId();
				String name = operation.getOperationname();
				float charges = operation.getAmount();
				String description = operation.getDescription();
				CommonFiledVo common = new CommonFiledVo();
				common.setId(id1);
				common.setDiscription(description);
				common.setName(name);
				common.setPrice(charges);
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

	private void patientList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("operationAdminid");

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

	private void bedList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("operationAdminid");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		BedCategoryVo bedCategoryVo = new BedCategoryVo();
		bedCategoryVo.setAdminid(adminVo);

		BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
		ArrayList<BedCategoryVo> bedList = bedMemegamentDao.listBedCategory(bedCategoryVo);
		session.setAttribute("bedList", bedList);
	}

	private void operationInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("----------------------");
		HttpSession session = request.getSession();

		int adminid = (int) session.getAttribute("operationAdminid");
		String operationName = request.getParameter("operationName");
		float amount = Float.parseFloat(request.getParameter("operation_cost"));
		String description = request.getParameter("operation_description");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		OpreationAddVo opreationAddVo = new OpreationAddVo();
		opreationAddVo.setAdminid(adminVo);
		opreationAddVo.setAmount(amount);
		opreationAddVo.setDescription(description);
		opreationAddVo.setOperationname(operationName);

		OpreationDao opreationDao = new OpreationDao();
		opreationDao.insertOpreationAdd(opreationAddVo);
	}

	private void operationEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int operationId = Integer.parseInt(request.getParameter("operationId"));
			OpreationAddVo opreationAddVo = new OpreationAddVo();
			opreationAddVo.setId(operationId);

			OpreationDao opreationDao = new OpreationDao();
			ArrayList<OpreationAddVo> opreationList = opreationDao.operationEdit(opreationAddVo);
			List<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (OpreationAddVo operation : opreationList) {
				int id1 = operation.getId();
				String name = operation.getOperationname();
				float charges = operation.getAmount();
				String description = operation.getDescription();
				int adminid = operation.getAdminid().getId();
				CommonFiledVo common = new CommonFiledVo();
				common.setId(id1);
				common.setDiscription(description);
				common.setName(name);
				common.setPrice(charges);
				common.setAdminId(adminid);
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

	private void operationApplyInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			SimpleDateFormat sdfdate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfdateconvert = new SimpleDateFormat("yyyy-MM-dd");

			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("operationAdminid");
			int patientId = Integer.parseInt(request.getParameter("patient_id"));
			String patientStatus = request.getParameter("patient_status");
			int operationId = Integer.parseInt(request.getParameter("operation_title"));
			String[] doctiorId = request.getParameterValues("doctor[]");
			int bedNumber = Integer.parseInt(request.getParameter("bed_number"));
			String operationDate = request.getParameter("OperationDate");
			String allotment = sdfdateconvert.format(sdfdate.parse(operationDate));
			java.sql.Date allocation = java.sql.Date.valueOf(allotment);
			String operationtime = request.getParameter("insert_operation_time");
			System.out.println(operationtime);
			Time operationTime = null;
			if (operationtime.isEmpty() == false) {
				LocalTime localTime = LocalTime.parse(operationtime);
				operationTime = java.sql.Time.valueOf(localTime);
			}
			String description = request.getParameter("ot_description");
			float totalOpearationCharge = Float.parseFloat(request.getParameter("operation_charge"));
			String operationStatus = request.getParameter("operation_status");
			String outComeStatus = request.getParameter("out_come_status");
			String outstatus;
			if(operationStatus.equalsIgnoreCase("Completed")) {
				outstatus = outComeStatus;
			}
			else {
				outstatus="-";
			}
			Timestamp t1 = new Timestamp(System.currentTimeMillis());

			java.sql.Date date1 = java.sql.Date.valueOf(LocalDate.now());
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientId);

			OpreationAddVo opreationAddVo = new OpreationAddVo();
			opreationAddVo.setId(operationId);

			AddBedVo addBedVo = new AddBedVo();
			addBedVo.setId(bedNumber);

			OperationVo operationVo = new OperationVo();
			operationVo.setAdminid(adminVo);
			operationVo.setOutComeStatus(outstatus);
			operationVo.setBedid(addBedVo);
			operationVo.setDescription(description);
			operationVo.setOperationdate(allocation);
			operationVo.setOperationStatus(operationStatus);
			
			operationVo.setOperationtime(operationTime);
			operationVo.setOpreationaddid(opreationAddVo);
			operationVo.setPatientid(patientRegistretionVo);
			operationVo.setTotalopearationcharge(totalOpearationCharge);
			operationVo.setJoiningdate(t1);

			AssignBedVo assignBedVo = new AssignBedVo();
			assignBedVo.setAllotmentdate(allocation);
			assignBedVo.setOperationid(operationVo);
			assignBedVo.setExpecteddischargedate(allocation);
			assignBedVo.setBedid(addBedVo);
			assignBedVo.setAdminid(adminVo);
			assignBedVo.setJoiningdate(t1);
			assignBedVo.setFlag(false);

			BedMemegamentDao bedMemegamentDao = new BedMemegamentDao();
			ArrayList<AssignBedVo> assignbedlist = bedMemegamentDao.checkAssginBed(assignBedVo);
			System.out.println(assignbedlist);
			if (assignbedlist.isEmpty() == true) {
				OpreationDao opreationDao = new OpreationDao();
				String check = opreationDao.insertOpreationApply(operationVo);
				if (check.equalsIgnoreCase("true")) {
					bedMemegamentDao.insertAssignBed(assignBedVo);
					for (int i = 0; i < doctiorId.length; i++) {
						int doctorid = Integer.valueOf(doctiorId[i]);

						DoctorVo doctorVo = new DoctorVo();
						doctorVo.setId(doctorid);

						CommonDataVo commonDataVo = new CommonDataVo();
						commonDataVo.setAdminid(adminVo);
						commonDataVo.setOpreationdoctorid(doctorVo);
						commonDataVo.setOpreationid(operationVo);
						opreationDao.insertOpreationApplyDoctor(commonDataVo);
					}
					PatientOtherInfo otherInfo = new PatientOtherInfo();
					otherInfo.setStatus(patientStatus);
					otherInfo.setPatientregistrationid(patientRegistretionVo);

					opreationDao.updatePatientStatus(otherInfo);

					ArrayList<OpreationAddVo> operation = opreationDao.editOperationAdd(opreationAddVo);
					String operationName = operation.get(0).getOperationname();

					PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
					chargesHistoryVo.setAdminid(adminVo);
					chargesHistoryVo.setAmount(totalOpearationCharge);
					chargesHistoryVo.setChargetype("Operation Charges");
					chargesHistoryVo.setAssginbedid(assignBedVo);
					chargesHistoryVo.setDate(date1);
					chargesHistoryVo.setPatientid(patientRegistretionVo);
					chargesHistoryVo.setTitle(operationName);
					chargesHistoryVo.setOperationid(operationVo);

					PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
					chargesHistoryDao.insertCharges(chargesHistoryVo);
					
					opreationUpdate = "true";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void operationApplyList(HttpServletRequest request, HttpServletResponse response) {
		try {
			SimpleDateFormat sdfdate = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfdateconvert = new SimpleDateFormat("dd/MM/yyyy");

			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("operationAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			OperationVo operationVo = new OperationVo();
			operationVo.setAdminid(adminVo);

			OpreationDao opreationDao = new OpreationDao();
			ArrayList<OperationVo> opreationList = opreationDao.operationApplyList(operationVo);

			List<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (OperationVo operation : opreationList) {
				int id = operation.getId();
				String name = operation.getOpreationaddid().getOperationname();
				String patient = operation.getPatientid().getFirstname() +"-("+ operation.getPatientid().getPatientid()+")";
				Date date = operation.getOperationdate();
				String date1 = date.toString();
				String date2 = sdfdateconvert.format(sdfdate.parse(date1));
				float charges = operation.getOpreationaddid().getAmount();
				String status = operation.getOperationStatus();
				String outcomstatus = operation.getOutComeStatus();
				operationVo.setId(id);
				CommonDataVo commonDataVo = new CommonDataVo();
				commonDataVo.setOpreationid(operationVo);
				ArrayList<CommonDataVo> doctorList = opreationDao.doctorList(commonDataVo);
				String doctor ="";
				for (int i = 0; i < doctorList.size(); i++) {
					String s1 = doctorList.get(i).getOpreationdoctorid().getFirstname();
					doctor = doctor.concat(",").concat(s1);
				}
				CommonFiledVo common = new CommonFiledVo();
				common.setId(id);
				common.setName(name);
				common.setPatientName(patient);
				common.setDate(date2);
				common.setPrice(charges);
				common.setField1(status);
				common.setTitle(outcomstatus);
				common.setField2(doctor);
				common.setField3(opreationUpdate);
				list.add(common);
				
			}
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
