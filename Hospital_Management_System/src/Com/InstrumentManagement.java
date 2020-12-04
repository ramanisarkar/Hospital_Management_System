package Com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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

import org.hibernate.cfg.FkSecondPass;

import com.google.gson.Gson;

import DAO.InstrumentDao;
import DAO.PatientChargesHistoryDao;
import DAO.PatientDao;
import VO.AdminVo;
import VO.CommonFiledVo;
import VO.InstrumentAssignVO;
import VO.InstrumentList;
import VO.InstrumentVO;
import VO.PatientChargesHistoryVo;
import VO.PatientOtherInfo;
import VO.PatientRegistretionVo;

/**
 * Servlet implementation class InstrumentManagement
 */
@WebServlet("/InstrumentManagement")
@MultipartConfig
public class InstrumentManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String instrumentUpdate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstrumentManagement() {
		super();
	}

	SimpleDateFormat sdfdate = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdfdateconvert = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insert")) {
			HttpSession session = request.getSession();
			int adminid = (Integer.parseInt(request.getParameter("id")));
			session.setAttribute("instrumentAdminid", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Instrument_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("instrumentList")) {
			instrumentList(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentEdit")) {
			instrumentEdit(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentDelete")) {
			instrumentDelete(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentAssignList")) {
			instrumentAssignList(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentAssignEdit")) {
			instrumentAssignEdit(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentAssignDelete")) {
			instrumentAssignDelete(request, response);
		}
		if (flag.equalsIgnoreCase("checkInstrument")) {
			instrumentEdit(request, response);
		}
		if (flag.equalsIgnoreCase("assginInstrumentEnd")) {
			instrumentEndTime(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		System.out.println(flag);
		HttpSession session = request.getSession();
		if (flag.equalsIgnoreCase("insertInstrument")) {
			InstrumentInsert(request, response);
			instrumentList(request, response);
		}
		if (flag.equalsIgnoreCase("instruemntupdate")) {
			int adminid = (Integer.parseInt(request.getParameter("adminid")));
			session.setAttribute("instrumentAdminid", adminid);
			instrumentUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("instruemntupdate")) {
			instrumentUpdate(request, response);
		}
		if (flag.equalsIgnoreCase("instrumentAssginInsert")) {
			instrumentAssginInsertShre(request, response);
		}
		if (flag.equalsIgnoreCase("instruemntAssginUpdate")) {
			instrumentAssignUpdate(request, response);
		}
	}

	private void instrumentEndTime(HttpServletRequest request, HttpServletResponse response) {
		try {
			int instrumentId = Integer.parseInt(request.getParameter("instrumentId"));
			Timestamp t1 = new Timestamp(System.currentTimeMillis());

			InstrumentAssignVO assignVO = new InstrumentAssignVO();
			assignVO.setId(instrumentId);
			assignVO.setEnddate(t1);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentAssignVO> arrayList = instrumentDao.editIstrumentAssign(assignVO);

			float insertumentcharges = arrayList.get(0).getInstrumnetid().getInstrumentcharge();
			int adminid = arrayList.get(0).getAdminid().getId();
			int patientid = arrayList.get(0).getPatientid().getId();
			String instrumentName = arrayList.get(0).getInstrumnetid().getInstrumentname();
			int stock = arrayList.get(0).getInstrumnetid().getStock();
			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientid);

			java.sql.Date date = java.sql.Date.valueOf(LocalDate.now());

			boolean flag = arrayList.get(0).isFlag();

			float total = 0;
			String duration = null;
			boolean check = false;
			if (flag == false) {
				Date startdate = arrayList.get(0).getStartdate();
				Time strattime = arrayList.get(0).getStarttime();
				String dateTime = startdate.toString().concat(" ").concat(strattime.toString());

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				LocalDateTime now = LocalDateTime.now();
				String currentdatetime = dtf.format(now);

				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Date d1 = null;
				Date d2 = null;

				d1 = format.parse(dateTime);
				d2 = format.parse(currentdatetime);

				long diff = d2.getTime() - d1.getTime();
				long diffHours = diff / (60 * 60 * 1000);

				total = diffHours * insertumentcharges;
				check = true;

			} else if (flag == true) {
				Date startdate = arrayList.get(0).getStartdate();

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate now = LocalDate.now();
				String currentdatetime = dtf.format(now);

				Date d1 = startdate;
				Date d2 = sdfdateconvert.parse(currentdatetime);

				long diff = d2.getTime() - d1.getTime();
				long difference_In_Days = (diff / (1000 * 60 * 60 * 24)) % 365;
				total = difference_In_Days * insertumentcharges;
				duration = String.valueOf(difference_In_Days).concat("Day");

				check = true;
			}
			if (check == true) {
				String message = instrumentDao.updateInstrumentAssginEndDate(assignVO);
				if (message == "true") {
					stock = stock + 1;
					InstrumentVO instrumentVO = new InstrumentVO();
					instrumentVO.setStock(stock);
					instrumentDao.updateInstrumentStock(instrumentVO);
					
					PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
					chargesHistoryVo.setAdminid(adminVo);
					chargesHistoryVo.setInstrumentid(assignVO);
					chargesHistoryVo.setAmount(total);
					chargesHistoryVo.setUnit(duration);
					chargesHistoryVo.setChargetype("Instrument Charges");
					chargesHistoryVo.setDate(date);
					chargesHistoryVo.setPatientid(patientVo);
					chargesHistoryVo.setTitle(instrumentName);

					PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
					chargesHistoryDao.insertCharges(chargesHistoryVo);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("instrumentAdminid");

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

	private void InstrumentInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);

		int Adminid = (int) session.getAttribute("instrumentAdminid");
		int instrumentCode = Integer.parseInt(request.getParameter("instrument_code"));
		String instrumentName = request.getParameter("instrument_name");
		String chargesType = request.getParameter("charge_type");
		float instrumentCharge = Float.parseFloat(request.getParameter("instrument_charge"));
		String description = request.getParameter("instrument_description");
		int code = 0;
		if (request.getParameter("code").isEmpty() == false) {
			code = Integer.parseInt(request.getParameter("code"));
		}
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String assetDescription = request.getParameter("description");
		int assetQuantity = 0;
		if (request.getParameter("quantity").isEmpty() == false) {
			assetQuantity = Integer.parseInt(request.getParameter("quantity"));
		}
		float assetPrice = 0.0f;
		if (request.getParameter("price").isEmpty() == false) {
			assetPrice = Float.parseFloat(request.getParameter("price"));
		}
		String assetClass = request.getParameter("class");
		int serial = 0;
		if (request.getParameter("serial").isEmpty() == false) {
			serial = Integer.parseInt(request.getParameter("serial"));
		}
		int acquire = 0;
		if (request.getParameter("acquire").isEmpty() == false) {
			acquire = Integer.parseInt(request.getParameter("acquire"));
		}
		int assetID = 0;
		if (request.getParameter("asset_id").isEmpty() == false) {
			assetID = Integer.parseInt(request.getParameter("asset_id"));
		}
		Timestamp t1 = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
		String joiningdate = sdf.format(t1);

		AdminVo adminVo = new AdminVo();
		adminVo.setId(Adminid);

		InstrumentVO instrumentVO = new InstrumentVO();
		instrumentVO.setAdminid(adminVo);
		instrumentVO.setAssetclass(assetClass);
		instrumentVO.setAssetdescription(assetDescription);
		instrumentVO.setAssetID(assetID);
		instrumentVO.setAssetprice(assetPrice);
		instrumentVO.setAssetQuantity(assetQuantity);
		instrumentVO.setFirmaddress(address);
		instrumentVO.setFirmcode(code);
		instrumentVO.setFirmcontact(contact);
		instrumentVO.setFirmname(name);
		instrumentVO.setInstrumentcharge(instrumentCharge);
		instrumentVO.setInstrumentchargestype(chargesType);
		instrumentVO.setInstrumentcode(instrumentCode);
		instrumentVO.setInstrumentdescription(description);
		instrumentVO.setInstrumentname(instrumentName);
		instrumentVO.setInvoiceAcquire(acquire);
		instrumentVO.setInvoiceserial(serial);
		instrumentVO.setJoiningdate(joiningdate);

		InstrumentDao instrumentDao = new InstrumentDao();
		String message = instrumentDao.insertInstrument(instrumentVO);
		if (message.equalsIgnoreCase("message")) {
			instrumentUpdate = "true";
		}
	}

	private void instrumentList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("instrumentAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InstrumentVO instrumentVO = new InstrumentVO();
			instrumentVO.setAdminid(adminVo);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentVO> instrumentList = instrumentDao.listInstrument(instrumentVO);
			List<InstrumentVO> list = new ArrayList<InstrumentVO>();
			for (InstrumentVO instrument : instrumentList) {
				int id = instrument.getId();
				int instrumentCode = instrument.getInstrumentcode();
				String name = instrument.getInstrumentname();
				float charges = instrument.getInstrumentcharge();
				String Instrumentchargestype = instrument.getInstrumentchargestype();
				String description = instrument.getInstrumentdescription();
				InstrumentVO common = new InstrumentVO();
				common.setId(id);
				common.setInstrumentcode(instrumentCode);
				common.setInstrumentname(name);
				common.setInstrumentcharge(charges);
				common.setInstrumentchargestype(Instrumentchargestype);
				common.setInstrumentdescription(description);
				common.setAssetclass(instrumentUpdate);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void instrumentEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int instrumentId = Integer.parseInt(request.getParameter("instrumentId"));
			System.out.println(instrumentId);

			InstrumentVO instrumentVO = new InstrumentVO();
			instrumentVO.setId(instrumentId);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentVO> instrumentList = instrumentDao.editIstrument(instrumentVO);
			List<InstrumentVO> list = new ArrayList<InstrumentVO>();
			for (InstrumentVO instrument : instrumentList) {
				int adminid = instrument.getAdminid().getId();
				String instrumentName = instrument.getInstrumentname();
				String assetClass = instrument.getAssetclass();
				int instrumentCode = instrument.getInstrumentcode();
				String chargesType = instrument.getInstrumentchargestype();
				float instrumentCharge = instrument.getInstrumentcharge();
				String description = instrument.getInstrumentdescription();
				int code = instrument.getInstrumentcode();
				String name = instrument.getFirmname();
				String address = instrument.getFirmaddress();
				String contact = instrument.getFirmcontact();
				String assetDescription = instrument.getAssetdescription();
				int assetQuantity = instrument.getAssetQuantity();
				float assetPrice = instrument.getAssetprice();
				int serial = instrument.getInvoiceserial();
				int acquire = instrument.getInvoiceAcquire();
				int assetID = instrument.getAssetID();
				String joiningdate = instrument.getJoiningdate();
				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);
				InstrumentVO common = new InstrumentVO();
				common.setId(instrumentId);
				common.setAdminid(adminVo);
				common.setAssetclass(assetClass);
				common.setAssetdescription(assetDescription);
				common.setAssetID(assetID);
				common.setAssetprice(assetPrice);
				common.setAssetQuantity(assetQuantity);
				common.setFirmaddress(address);
				common.setFirmcode(code);
				common.setFirmcontact(contact);
				common.setFirmname(name);
				common.setInstrumentcharge(instrumentCharge);
				common.setInstrumentchargestype(chargesType);
				common.setInstrumentcode(instrumentCode);
				common.setInstrumentdescription(description);
				common.setInstrumentname(instrumentName);
				common.setInvoiceAcquire(acquire);
				common.setInvoiceserial(serial);
				common.setJoiningdate(joiningdate);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException exception) {

		}
	}

	private void instrumentUpdate(HttpServletRequest request, HttpServletResponse response) {

		int Adminid = Integer.parseInt(request.getParameter("instrumentAdminid"));
		int instrumentId = Integer.parseInt(request.getParameter("instrumentAdminid"));
		int instrumentCode = Integer.parseInt(request.getParameter("instrumentAdminid"));
		String instrumentName = request.getParameter("");
		String chargesType = request.getParameter("");
		float instrumentCharge = Float.parseFloat(request.getParameter(""));
		String description = request.getParameter("");
		int code = Integer.parseInt(request.getParameter(""));
		String name = request.getParameter("");
		String address = request.getParameter("");
		String contact = request.getParameter("");
		String assetDescription = request.getParameter("");
		int assetQuantity = Integer.parseInt(request.getParameter(""));
		float assetPrice = Float.parseFloat(request.getParameter(""));
		String assetClass = request.getParameter("");
		int serial = Integer.parseInt(request.getParameter(""));
		int acquire = Integer.parseInt(request.getParameter(""));
		int assetID = Integer.parseInt(request.getParameter(""));
		String joiningdate = request.getParameter("");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(Adminid);

		InstrumentVO instrumentVO = new InstrumentVO();
		instrumentVO.setId(instrumentId);
		instrumentVO.setAdminid(adminVo);
		instrumentVO.setAssetclass(assetClass);
		instrumentVO.setAssetdescription(assetDescription);
		instrumentVO.setAssetID(assetID);
		instrumentVO.setAssetprice(assetPrice);
		instrumentVO.setAssetQuantity(assetQuantity);
		instrumentVO.setFirmaddress(address);
		instrumentVO.setFirmcode(code);
		instrumentVO.setFirmcontact(contact);
		instrumentVO.setFirmname(name);
		instrumentVO.setInstrumentcharge(instrumentCharge);
		instrumentVO.setInstrumentchargestype(chargesType);
		instrumentVO.setInstrumentcode(instrumentCode);
		instrumentVO.setInstrumentdescription(description);
		instrumentVO.setInstrumentname(instrumentName);
		instrumentVO.setInvoiceAcquire(acquire);
		instrumentVO.setInvoiceserial(serial);
		instrumentVO.setJoiningdate(joiningdate);

		InstrumentDao instrumentDao = new InstrumentDao();
		String message = instrumentDao.updateInstrument(instrumentVO);
		if (message.equalsIgnoreCase("message")) {
			instrumentUpdate = "true";
		}
	}

	private void instrumentDelete(HttpServletRequest request, HttpServletResponse response) {
		
	}

	private void instrumentAssginInsertShre(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			int adminId = (int) session.getAttribute("instrumentAdminid");
			int patientId = Integer.parseInt(request.getParameter("patient_id"));
			int instrumentId = Integer.parseInt(request.getParameter("instrument_id"));
			String description = request.getParameter("description");
			String charge_type = request.getParameter("charge_type");
			String startDate = request.getParameter("start_date");
			String starttime = request.getParameter("start_time");
			String endtime = request.getParameter("end_time");
			String endDate = request.getParameter("end_date");
			Time assginTime = null;
			Time endTime = null;
			java.sql.Date dischage = null;
			String startdate = sdfdateconvert.format(sdfdate.parse(startDate));
			java.sql.Date allocation = java.sql.Date.valueOf(startdate);
			boolean flag; 
			if (charge_type.equalsIgnoreCase("Hourly")) {
				flag = false;
				LocalTime localTime = LocalTime.parse(starttime);
				assginTime = java.sql.Time.valueOf(localTime);

				LocalTime localTime2 = LocalTime.parse(endtime);
				endTime = java.sql.Time.valueOf(localTime2);
				dischage = java.sql.Date.valueOf(startdate);
			} else {
				flag = true;
				String enddate = sdfdateconvert.format(sdfdate.parse(endDate));
				dischage = java.sql.Date.valueOf(enddate);
			}

			Timestamp t1 = new Timestamp(System.currentTimeMillis());

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminId);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientId);

			InstrumentVO instrumentVO = new InstrumentVO();
			instrumentVO.setId(instrumentId);

			InstrumentAssignVO instrumentAssignVO = new InstrumentAssignVO();
			instrumentAssignVO.setAdminid(adminVo);
			instrumentAssignVO.setPatientid(patientVo);
			instrumentAssignVO.setDescription(description);
			instrumentAssignVO.setExpectedenddate(dischage);
			instrumentAssignVO.setInstrumnetid(instrumentVO);
			instrumentAssignVO.setStartdate(allocation);
			instrumentAssignVO.setStarttime(assginTime);
			instrumentAssignVO.setExpectedendtime(endTime);
			instrumentAssignVO.setJoiningdate(t1);
			instrumentAssignVO.setFlag(flag);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentVO> instrumentList = instrumentDao.editIstrument(instrumentVO);
			int stock = instrumentList.get(0).getStock();
			if (stock > 0) {
				if (charge_type.equalsIgnoreCase("Hourly")) {
					String message = instrumentDao.insertInstrumentAssgin(instrumentAssignVO);
					if (message.equalsIgnoreCase("true")) {
						stock = stock - 1;
						instrumentVO.setStock(stock);
						instrumentDao.updateInstrumentStock(instrumentVO);
						instrumentUpdate = "true";
					}
				} else {
					String message = instrumentDao.insertInstrumentAssgin(instrumentAssignVO);
					if (message.equalsIgnoreCase("true")) {
						stock = stock - 1;
						instrumentVO.setStock(stock);
						instrumentDao.updateInstrumentStock(instrumentVO);
						instrumentUpdate = "true";
					}
				}
				instrumentAssignList(request, response);
			} else {
				if (charge_type.equalsIgnoreCase("Hourly")) {
					List<Object[]> iav = instrumentDao.checkInstrumentAssginHourly(instrumentAssignVO);
					String patientName = String.valueOf(iav.get(0)[0]);
					String patientid = String.valueOf(iav.get(0)[1]);
					String date = String.valueOf(iav.get(0)[2]);
					String time = String.valueOf(iav.get(0)[3]);
					
					ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
					CommonFiledVo common = new CommonFiledVo();
					common.setField1(patientName.concat("-").concat(patientid));
					common.setField2("erorr");
					common.setField3(date.concat(" ").concat(time));
					list.add(common);
				
					Gson gson = new Gson();
					PrintWriter out = response.getWriter();
					out.print(gson.toJson(list));
					out.flush();
					out.close();
				} else {
					List<Object[]> iav = instrumentDao.checkInsertInstrumentAssginDaly(instrumentAssignVO);
					String patientName = String.valueOf(iav.get(0)[0]);
					String patientid = String.valueOf(iav.get(0)[1]);
					String time = String.valueOf(iav.get(0)[2]);
					
					ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
					CommonFiledVo common = new CommonFiledVo();
					common.setField2("erorr");
					common.setField1(patientName.concat("-").concat(patientid));
					common.setField3(time);
					list.add(common);
				
					Gson gson = new Gson();
					PrintWriter out = response.getWriter();
					out.print(gson.toJson(list));
					out.flush();
					out.close();
				}
				instrumentUpdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void instrumentAssginInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);

			int adminId = (int) session.getAttribute("instrumentAdminid");
			int patientId = Integer.parseInt(request.getParameter("patient_id"));
			int instrumentId = Integer.parseInt(request.getParameter("instrument_id"));
			String description = request.getParameter("description");
			String charge_type = request.getParameter("charge_type");
			System.out.println(charge_type);
			String startDate = request.getParameter("start_date");
			System.out.println(startDate);
			String starttime = request.getParameter("start_time");
			String endtime = request.getParameter("end_time");
			String endDate = request.getParameter("end_date");
			Time assginTime = null;
			Time endTime = null;
			java.sql.Date dischage = null;
			java.sql.Date allocation = java.sql.Date.valueOf(startDate);
			if (charge_type.equalsIgnoreCase("Hourly")) {
				LocalTime localTime = LocalTime.parse(starttime);
				assginTime = java.sql.Time.valueOf(localTime);

				LocalTime localTime2 = LocalTime.parse(endtime);
				endTime = java.sql.Time.valueOf(localTime2);
			} else {
				dischage = java.sql.Date.valueOf(endDate);
			}

			Timestamp t1 = new Timestamp(System.currentTimeMillis());

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminId);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientId);

			InstrumentVO instrumentVO = new InstrumentVO();
			instrumentVO.setId(instrumentId);

			java.sql.Date date1 = java.sql.Date.valueOf(LocalDate.now());

			InstrumentAssignVO instrumentAssignVO = new InstrumentAssignVO();
			instrumentAssignVO.setAdminid(adminVo);
			instrumentAssignVO.setPatientid(patientVo);
			instrumentAssignVO.setDescription(description);
			instrumentAssignVO.setExpectedenddate(dischage);
			instrumentAssignVO.setInstrumnetid(instrumentVO);
			instrumentAssignVO.setStartdate(allocation);
			instrumentAssignVO.setStarttime(assginTime);
			instrumentAssignVO.setExpectedendtime(endTime);
			instrumentAssignVO.setJoiningdate(t1);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentVO> instrumentList = instrumentDao.editIstrument(instrumentVO);
			int stock = instrumentList.get(0).getStock();
			String instrumentname = instrumentList.get(0).getInstrumentname();
			float charge = instrumentList.get(0).getInstrumentcharge();
			System.out.println(charge);
			float total = 0.0f;
			String duration = "";
			System.out.println(charge_type);
			if (charge_type.equalsIgnoreCase("Hourly")) {
				ArrayList<InstrumentAssignVO> check = instrumentDao.checkInstrumentTime(instrumentAssignVO);
				if (check.isEmpty() == true) {

					LocalTime start = assginTime.toLocalTime();
					LocalTime end = endTime.toLocalTime();
					long Duration = java.time.Duration.between(start, end).toMinutes();

					duration = String.valueOf(Duration) + " Minutes";
					total = charge * Duration;

				} else {
					return;
				}
			} else {
				ArrayList<InstrumentAssignVO> check = instrumentDao.checkInstrumentDate(instrumentAssignVO);
				if (check.isEmpty() == true) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date d1 = format.parse(startDate);
					Date d2 = format.parse(endDate);

					long diff = d2.getTime() - d1.getTime();
					long difference_In_Days = (diff / (1000 * 60 * 60 * 24)) % 365;
					System.out.println(difference_In_Days);
					duration = String.valueOf(difference_In_Days) + " day";
					total = charge * difference_In_Days;
				} else {
					return;
				}
			}
			System.out.println(total);
			instrumentAssignVO.setTotal(total);

			String message = instrumentDao.insertInstrumentAssgin(instrumentAssignVO);
			if (message.equalsIgnoreCase("message")) {
				instrumentUpdate = "true";
				PatientChargesHistoryVo chargesHistoryVo = new PatientChargesHistoryVo();
				chargesHistoryVo.setAdminid(adminVo);
				chargesHistoryVo.setInstrumentid(instrumentAssignVO);
				chargesHistoryVo.setAmount(total);
				chargesHistoryVo.setUnit(duration);
				chargesHistoryVo.setChargetype("Instrument Charges");
				chargesHistoryVo.setDate(date1);
				chargesHistoryVo.setPatientid(patientVo);
				chargesHistoryVo.setTitle(instrumentname);

				PatientChargesHistoryDao chargesHistoryDao = new PatientChargesHistoryDao();
				chargesHistoryDao.insertCharges(chargesHistoryVo);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private void instrumentAssignList(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("instrumentAdminid");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			InstrumentAssignVO instrumentAssignVO = new InstrumentAssignVO();
			instrumentAssignVO.setAdminid(adminVo);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentAssignVO> instrumentAssignList = instrumentDao.listInstrumentAssign(instrumentAssignVO);

			List<InstrumentList> list = new ArrayList<InstrumentList>();
			for (InstrumentAssignVO instrument : instrumentAssignList) {
				int id = instrument.getId();
				String patientName = instrument.getPatientid().getFirstname();
				String InstrumentName = instrument.getInstrumnetid().getInstrumentname();
				String chargestype = instrument.getInstrumnetid().getInstrumentchargestype();
				float charges = instrument.getInstrumnetid().getInstrumentcharge();
				java.sql.Date adate = instrument.getStartdate();
				String assigndate = adate.toString();
				String date1 = sdfdate.format(sdfdateconvert.parse(assigndate));
				java.sql.Date edate = instrument.getExpectedenddate();
				System.out.println(edate);
				String enddate = edate.toString();
				String date2 = sdfdate.format(sdfdateconvert.parse(enddate));
				float total = instrument.getTotal();
				InstrumentList common = new InstrumentList();
				common.setId(id);
				common.setPatientname(patientName);
				common.setInstrument(InstrumentName);
				common.setAssigndate(date1);
				common.setEnddate(date2);
				common.setTotal(total);
				common.setCharege(charges);
				common.setType(chargestype);
				common.setInstrumentUpdate(instrumentUpdate);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}

	private void instrumentAssignEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			int instrumentAssignId = Integer.parseInt(request.getParameter("instrumentId"));
			System.out.println(instrumentAssignId);

			InstrumentAssignVO instrumentAssignVO = new InstrumentAssignVO();
			instrumentAssignVO.setId(instrumentAssignId);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentAssignVO> instrumentList = instrumentDao.editIstrumentAssign(instrumentAssignVO);
			List<InstrumentAssignVO> list = new ArrayList<InstrumentAssignVO>();
			for (InstrumentAssignVO instrument : instrumentList) {
				int adminid = instrument.getAdminid().getId();
				int patientid = instrument.getPatientid().getId();
				int inst = instrument.getInstrumnetid().getId();
				String instdate = instrument.getStartdate();
				String insenddate = instrument.getExpectedenddate();
				String starttime = instrument.getStarttime();
				String endtime = instrument.getExpectedendtime();
				String description = instrument.getDescription();
				String joiningdate = instrument.getJoiningdate();
				AdminVo adminVo = new AdminVo();
				adminVo.setId(adminid);

				PatientRegistretionVo patientVo = new PatientRegistretionVo();
				patientVo.setId(patientid);

				InstrumentVO instrumentVO = new InstrumentVO();
				instrumentVO.setId(inst);
				InstrumentAssignVO common = new InstrumentAssignVO();
				common.setId(instrumentAssignId);
				common.setAdminid(adminVo);
				common.setPatientid(patientVo);
				common.setStartdate(instdate);
				common.setExpectedenddate(insenddate);
				common.setDescription(description);
				common.setExpectedendtime(endtime);
				common.setJoiningdate(joiningdate);
				common.setStarttime(starttime);
				list.add(common);
			}
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}

	private void instrumentAssignUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);

			int adminId = Integer.parseInt(request.getParameter("instrumentAdminid"));
			session.setAttribute("instrumentAdminid", adminId);
			int patientId = Integer.parseInt(request.getParameter(""));
			int instrumentId = Integer.parseInt(request.getParameter(""));
			String description = request.getParameter("");
			String startDate = request.getParameter("");
			String starttime = request.getParameter("");
			String endtime = request.getParameter("");
			String endDate = request.getParameter("");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminId);

			PatientRegistretionVo patientVo = new PatientRegistretionVo();
			patientVo.setId(patientId);

			InstrumentVO instrumentVO = new InstrumentVO();
			instrumentVO.setId(instrumentId);

			InstrumentDao instrumentDao = new InstrumentDao();
			ArrayList<InstrumentVO> instrumentList = instrumentDao.editIstrument(instrumentVO);
			float charge = instrumentList.get(0).getInstrumentcharge();
			float total;
			if (startDate.length() == 0) {
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date d1 = format.parse(startDate);
				Date d2 = format.parse(endDate);

				long diff = d2.getTime() - d1.getTime();
				long difference_In_Days = (diff / (1000 * 60 * 60 * 24)) % 365;

				total = charge * difference_In_Days;
			} else {
				SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
				long ms = sdf1.parse(starttime).getTime();
				java.sql.Time starTtime = new java.sql.Time(ms);
				long ms1 = sdf1.parse(endtime).getTime();
				java.sql.Time endTime = new java.sql.Time(ms1);

				LocalTime start = starTtime.toLocalTime();
				LocalTime end = endTime.toLocalTime();
				long Duration = java.time.Duration.between(start, end).toMinutes();
				total = charge * Duration;
			}
			InstrumentAssignVO instrumentAssignVO = new InstrumentAssignVO();
			instrumentAssignVO.setAdminid(adminVo);
			instrumentAssignVO.setPatientid(patientVo);
			instrumentAssignVO.setDescription(description);
			instrumentAssignVO.setExpectedenddate(endDate);
			instrumentAssignVO.setInstrumnetid(instrumentVO);
			instrumentAssignVO.setStartdate(startDate);
			instrumentAssignVO.setStarttime(starttime);
			instrumentAssignVO.setExpectedendtime(endtime);
			instrumentAssignVO.setTotal(total);
			instrumentAssignVO.setJoiningdate(joiningdate);

			String message = instrumentDao.insertInstrumentAssgin(instrumentAssignVO);
			if (message.equalsIgnoreCase("message")) {
				instrumentUpdate = "true";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private void instrumentAssignDelete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

}
