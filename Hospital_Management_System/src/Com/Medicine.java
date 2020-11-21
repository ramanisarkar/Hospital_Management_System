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
import DAO.DispatchedMedicineDao;
import DAO.MedicineDao;
import DAO.PatientRegistreationDao;
import DAO.PrescriptionDao;
import VO.AdminVo;
import VO.AllDataCountVo;
import VO.CategoryVo;
import VO.CommonFiledVo;
import VO.DispatchMedicineInfoVo;
import VO.DispatchedMedicineVo;
import VO.MedicineList;
import VO.MedicineVo;
import VO.PatientRegistretionVo;
import VO.PrescriptionMedicationVo;
import VO.PrescriptionVo;

/**
 * Servlet implementation class Medicine
 */
@WebServlet("/Medicine")
@MultipartConfig
public class Medicine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Medicine() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String medicineupdate = null;

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
			session.setAttribute("medicineAdminId", adminid);
			patientRegistrationList(request, response);
			response.sendRedirect("Admin_Medicine_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("medicineList")) {
			medicineList(request, response);
		}
		if (flag.equalsIgnoreCase("editMedicine")) {
			medicineEdit(request, response);
		}
		if (flag.equalsIgnoreCase("getPriscriptionRecord")) {
			getPriscription(request, response);
		}
		if (flag.equalsIgnoreCase("getPriscriptionMedicineRecord")) {
			getPriscriptionMedicineRecord(request, response);
		}
		if (flag.equalsIgnoreCase("deleteMedicine")) {
			medicineDelete(request, response);
			medicineList(request, response);
		}
	}

	private void getPriscriptionMedicineRecord(HttpServletRequest request, HttpServletResponse response) {
		try {
			int prescriptionId = Integer.parseInt(request.getParameter("prescriptionId"));

			PrescriptionVo prescriptionVo = new PrescriptionVo();
			prescriptionVo.setId(prescriptionId);

			PrescriptionMedicationVo prescriptionMedicationVo = new PrescriptionMedicationVo();
			prescriptionMedicationVo.setPrescriptionid(prescriptionVo);

			PrescriptionDao prescriptionDao = new PrescriptionDao();

			ArrayList<PrescriptionMedicationVo> prescriptionMedicineList = prescriptionDao
					.listPrescriptionMedicine(prescriptionMedicationVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			
			for (PrescriptionMedicationVo medicineList : prescriptionMedicineList) {
				int medicinid = medicineList.getMedicineid().getId();
				String medicinename = medicineList.getMedicineid().getMedicinename();
				String type = medicineList.getMedicineid().getTypeofdiscount();
				int quantity = medicineList.getMedicineid().getMedicinequantity();
				float price = medicineList.getMedicineid().getPrice();
				CommonFiledVo common = new CommonFiledVo();
				common.setId(medicinid);
				common.setPrice(price);
				common.setName(medicinename);
				common.setQuantity(quantity);
				common.setType(type);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	private void getPriscription(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			int adminid = (int) session.getAttribute("medicineAdminId");
			int patientid = Integer.parseInt(request.getParameter("patientId"));

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo registretionVo = new PatientRegistretionVo();
			registretionVo.setId(patientid);

			PrescriptionVo prescriptionVo = new PrescriptionVo();
			prescriptionVo.setAdminid(adminVo);
			prescriptionVo.setPatientid(registretionVo);

			PrescriptionDao prescriptionDao = new PrescriptionDao();

			ArrayList<PrescriptionVo> prescriptionList = prescriptionDao.listPatientPrescription(prescriptionVo);
			ArrayList<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
			for (PrescriptionVo prescription : prescriptionList) {
				int id = prescription.getId();
				String date = prescription.getDate();
				String patientname = prescription.getPatientid().getFirstname();

				CommonFiledVo common = new CommonFiledVo();
				common.setDate(date);
				common.setPatientName(patientname);
				common.setPrescriptionId(id);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		if (flag.equalsIgnoreCase("insert")) {
			medicineInsert(request, response);
			medicineList(request, response);
		}
		if (flag.equalsIgnoreCase("update")) {
			medicineUpdate(request, response);
			medicineList(request, response);
		}
		if (flag.equalsIgnoreCase("chackMedicineName")) {
			medicineNameChack(request, response);
		}
		if (flag.equalsIgnoreCase("chackMedicineId")) {
			chackMedicineId(request, response);
		}
		if (flag.equalsIgnoreCase("dispatchMedicineInsert")) {
			dispatchMedicineInsert(request, response);
		}
		if (flag.equalsIgnoreCase("dispatchedMedicineList")) {
			dispatchedMedicineList(request, response);
		}
	}

	protected void patientRegistrationList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("medicineAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
		patientRegistretionVo.setAdminid(adminVo);

		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
		ArrayList<PatientRegistretionVo> patientRegistration = patientRegistreationDao
				.patientRegistrationList(patientRegistretionVo);
		System.out.println(patientRegistration.size());
		session.setAttribute("patientRagistrationList", patientRegistration);
	}

	private void medicineList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("medicineAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		MedicineVo medicineVo = new MedicineVo();
		medicineVo.setAdminid(adminVo);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<MedicineVo> medicinelist = medicineDao.medicineList(medicineVo);
		List<MedicineList> list = new ArrayList<MedicineList>();
		String stock = null;
		for (MedicineVo medicine : medicinelist) {
			int id = medicine.getId();
			String name = medicine.getMedicinename();
			String categoryname = medicine.getCategoryid().getCategoryname();
			String batchno = medicine.getMedicinebatchnumber();
			float price = medicine.getPrice();
			float discount = medicine.getDiscount();
			String expiry = medicine.getExpirydate();
			String expirydate = expiry.toString();
			int quantity = medicine.getMedicinequantity();

			if (quantity > 0) {
				stock = "In";
			} else {
				stock = "Out";
			}

			MedicineList common = new MedicineList();
			common.setId(id);
			common.setMedicinename(name);
			common.setCategoryname(categoryname);
			common.setMedicinebatchnumber(batchno);
			common.setPrice(price);
			common.setDiscount(discount);
			common.setExpirydate(expirydate);
			common.setMedicinequantity(quantity);
			common.setStock(stock);
			common.setMedicineupdate(medicineupdate);

			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void dispatchedMedicineList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int adminid = (int) session.getAttribute("medicineAdminId");

		AdminVo adminVo = new AdminVo();
		adminVo.setId(adminid);

		DispatchedMedicineVo dispatchedMedicineVo = new DispatchedMedicineVo();
		dispatchedMedicineVo.setAdminid(adminVo);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<DispatchedMedicineVo> dispatchedMedicinelist = medicineDao
				.dispatchedMedicineList(dispatchedMedicineVo);
		List<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
		for (DispatchedMedicineVo medicine : dispatchedMedicinelist) {
			int id = medicine.getId();
			String patientName = medicine.getPatientid().getFirstname();
			String priscriptionDate = medicine.getPrescriptionid().getDate();
			float medicinePrice = medicine.getTotalprice();
			float discount = medicine.getTotaldiscount();
			float subtotal = medicine.getSubtotal();

			CommonFiledVo common = new CommonFiledVo();
			common.setId(id);
			common.setDate(priscriptionDate);
			common.setName(patientName);
			common.setPrice(medicinePrice);
			common.setDiscount(discount);
			common.setSubtotal(subtotal);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void medicineNameChack(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String medicineName = request.getParameter("medicineName");
		System.out.println(medicineName);

		MedicineVo medicineVo = new MedicineVo();
		medicineVo.setMedicinename(medicineName);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<MedicineVo> medicinenamechack = medicineDao.medicineNameChack(medicineVo);
		System.out.println(medicinenamechack.size());

		List<MedicineList> list = new ArrayList<MedicineList>();
		if (medicinenamechack.isEmpty() == true) {
			String respose = "true";
			MedicineList common = new MedicineList();
			common.setChackmedicinename(respose);
			list.add(common);
		} else {
			for (MedicineVo medicine : medicinenamechack) {
				String medicinename = medicine.getMedicinename();
				String user = "false";
				MedicineList common = new MedicineList();
				common.setMedicinename(medicinename);
				common.setChackmedicinename(user);
				list.add(common);
			}
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void chackMedicineId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String medicineId = request.getParameter("medicineId");

		MedicineVo medicineVo = new MedicineVo();
		medicineVo.setMedicineid(medicineId);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<MedicineVo> medicineidchack = medicineDao.medicineIdChack(medicineVo);
		System.out.println(medicineidchack.size());

		List<MedicineList> list = new ArrayList<MedicineList>();
		if (medicineidchack.isEmpty() == true) {
			String respose = "true";
			MedicineList common = new MedicineList();
			common.setChackmedicineid(respose);
			list.add(common);
		} else {
			for (MedicineVo medicine : medicineidchack) {
				String medicineid = medicine.getMedicineid();
				String user = "false";
				MedicineList common = new MedicineList();
				common.setMedicineid(medicineid);
				common.setChackmedicineid(user);
				list.add(common);
			}
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void medicineInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("medicineAdminId");
			int categoryId = Integer.parseInt(request.getParameter("medicine_category"));
			String[] medicineName = request.getParameterValues("medicine_name[]");
			String[] medicineDesrciption = request.getParameterValues("description[]");
			String[] medicineBatchNumber = request.getParameterValues("batch_number[]");
			String[] medicineQuantity = request.getParameterValues("med_quantity[]");
			String[] prices = request.getParameterValues("med_price[]");
			String[] medicineId = request.getParameterValues("med_uniqueid[]");
			String[] note = request.getParameterValues("note[]");
			String[] discount = request.getParameterValues("med_discount[]");
			String[] typeOfDiscount = request.getParameterValues("med_discount_in[]");
			String[] manufacturerCompanyName = request.getParameterValues("mfg_cmp_name[]");

			String[] manufactured = request.getParameterValues("manufactured_date[]");
			String[] expiry = request.getParameterValues("expiry_date[]");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			CategoryVo categoryVo = new CategoryVo();
			categoryVo.setId(categoryId);
			System.out.println(medicineId.length);
			for (int i = 0; i < medicineId.length; i++) {

				String medicineName1 = medicineName[i];
				String medicineDesrciption1 = medicineDesrciption[i];
				String medicineBatchNumber1 = medicineBatchNumber[i];
				int medicineQuantity1 = Integer.parseInt(medicineQuantity[i]);
				float prices1 = Float.parseFloat(prices[i]);
				String medicineId1 = medicineId[i];
				String note1 = note[i];
				float discount1 = Float.parseFloat(discount[i]);
				String typeOfDiscount1 = typeOfDiscount[i];
				String manufacturerCompanyName1 = manufacturerCompanyName[i];

				String manufactured1 = manufactured[i];
				String expiry1 = expiry[i];

				MedicineVo medicineVo = new MedicineVo();
				medicineVo.setAdminid(adminVo);
				medicineVo.setCategoryid(categoryVo);
				medicineVo.setDiscount(discount1);
				medicineVo.setExpirydate(expiry1);
				medicineVo.setJoiningdate(joiningdate);
				medicineVo.setManufacturedate(manufactured1);
				medicineVo.setManufacturercompanyname(manufacturerCompanyName1);
				medicineVo.setMedicinebatchnumber(medicineBatchNumber1);
				medicineVo.setMedicinedesrciption(medicineDesrciption1);
				medicineVo.setMedicineid(medicineId1);
				medicineVo.setMedicinename(medicineName1);
				medicineVo.setMedicinequantity(medicineQuantity1);
				medicineVo.setNote(note1);
				medicineVo.setTypeofdiscount(typeOfDiscount1);
				medicineVo.setPrice(prices1);

				MedicineDao medicineDao = new MedicineDao();
				String chackmedicine = medicineDao.medicineInsert(medicineVo);
				if (chackmedicine == "true") {
					AllDataCountVo allDataCountVo = new AllDataCountVo();
					allDataCountVo.setAdminid(adminVo);
					AllDataCountDao allDataCountDao = new AllDataCountDao();
					allDataCountDao.increaseData(allDataCountVo, "medicine");
					medicineupdate = "true";
				} else {
					medicineupdate = "false";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void dispatchMedicineInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("----------------------");
			HttpSession session = request.getSession();

			int adminid = (int) session.getAttribute("medicineAdminId");
			int patientId = Integer.parseInt(request.getParameter(""));
			int prescriptionId = Integer.parseInt(request.getParameter(""));
			float totalPrice = Float.parseFloat(request.getParameter(""));
			float totalDiscount = Float.parseFloat(request.getParameter(""));
			float subTotal = Float.parseFloat(request.getParameter(""));
			String description = request.getParameter("");
			String[] medicineId = request.getParameterValues("");
			String[] Quantity = request.getParameterValues("");
			String[] Discount = request.getParameterValues("Discount[]");
			String[] discountAmount = request.getParameterValues("");

			Timestamp t1 = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
			String joiningdate = sdf.format(t1);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
			patientRegistretionVo.setId(patientId);

			PrescriptionVo prescriptionVo = new PrescriptionVo();
			prescriptionVo.setId(prescriptionId);

			DispatchedMedicineVo dispatchedMedicineVo = new DispatchedMedicineVo();
			dispatchedMedicineVo.setAdminid(adminVo);
			dispatchedMedicineVo.setDiscription(description);
			dispatchedMedicineVo.setPatientid(patientRegistretionVo);
			dispatchedMedicineVo.setPrescriptionid(prescriptionVo);
			dispatchedMedicineVo.setSubtotal(subTotal);
			dispatchedMedicineVo.setJoinindate(joiningdate);
			dispatchedMedicineVo.setTotaldiscount(totalDiscount);
			dispatchedMedicineVo.setTotalprice(totalPrice);

			DispatchedMedicineDao dispatchedMedicineDao = new DispatchedMedicineDao();
			String checkDispatchedMedicine = dispatchedMedicineDao.insertDispatchedMedicince(dispatchedMedicineVo);
			if (checkDispatchedMedicine.equalsIgnoreCase("true")) {
				for (int i = 0; i < medicineId.length; i++) {
					int medicine = Integer.valueOf(medicineId[i]);
					int quantity = Integer.valueOf(Quantity[i]);
					float discount = Float.valueOf(Discount[i]);
					float discountamount = Float.valueOf(discountAmount[i]);

					MedicineVo medicineVo = new MedicineVo();
					medicineVo.setId(medicine);

					DispatchMedicineInfoVo dispatchMedicineInfoVo = new DispatchMedicineInfoVo();
					dispatchMedicineInfoVo.setAdminid(adminVo);
					dispatchMedicineInfoVo.setDiscount(discount);
					dispatchMedicineInfoVo.setDiscountamount(discountamount);
					dispatchMedicineInfoVo.setMedicineId(medicineVo);
					dispatchMedicineInfoVo.setQuantity(quantity);

					String checkDispatchedMedicineInfo = dispatchedMedicineDao
							.insertDispatchedMedicinceInfo(dispatchMedicineInfoVo);
					if (checkDispatchedMedicineInfo == "true") {
						medicineupdate = "true";
					} else {
						medicineupdate = "false";
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void medicineEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int medicineId = Integer.parseInt(request.getParameter("medicineId"));

		MedicineVo medicineVo = new MedicineVo();
		medicineVo.setId(medicineId);

		MedicineDao medicineDao = new MedicineDao();
		ArrayList<MedicineVo> medicinelist = medicineDao.medicineEdit(medicineVo);
		List<MedicineList> list = new ArrayList<MedicineList>();
		for (MedicineVo medicine : medicinelist) {
			int adminid = medicine.getAdminid().getId();
			int categoryid = medicine.getCategoryid().getId();
			String categoryname = medicine.getCategoryid().getCategoryname();
			String name = medicine.getMedicinename();
			String description = medicine.getMedicinedesrciption();
			String batchno = medicine.getMedicinebatchnumber();
			int quantity = medicine.getMedicinequantity();
			float price = medicine.getPrice();
			String medicinid = medicine.getMedicineid();
			String note = medicine.getNote();
			float discount = medicine.getDiscount();
			String typeofdiscount = medicine.getTypeofdiscount();
			String manufacturercompanyname = medicine.getManufacturercompanyname();
			String date = medicine.getManufacturedate();
			String manufacturerdate = date.toString();
			String expiry = medicine.getExpirydate();
			String expirydate = expiry.toString();
			String joiningdate = medicine.getJoiningdate();
			MedicineList common = new MedicineList();
			common.setId(medicineId);
			common.setAdminid(adminid);
			common.setCategoryid(categoryid);
			common.setCategoryname(categoryname);
			common.setMedicinename(name);
			common.setMedicinedesrciption(description);
			common.setMedicinebatchnumber(batchno);
			common.setMedicinequantity(quantity);
			common.setPrice(price);
			common.setMedicineid(medicinid);
			common.setNote(note);
			common.setDiscount(discount);
			common.setTypeofdiscount(typeofdiscount);
			common.setManufacturercompanyname(manufacturercompanyname);
			common.setManufacturedate(manufacturerdate);
			common.setExpirydate(expirydate);
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
	
	private void dispatchedMedicineEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int dispatchedMedicineId = Integer.parseInt(request.getParameter("dispatchedMedicineId"));

		DispatchedMedicineVo dispatchedMedicineVo = new DispatchedMedicineVo();
		dispatchedMedicineVo.setId(dispatchedMedicineId);

		DispatchedMedicineDao dispatchedMedicineDao = new DispatchedMedicineDao();
		
		ArrayList<DispatchedMedicineVo> diapatchedmedicinelist = dispatchedMedicineDao.editDispatechedMedicine(dispatchedMedicineVo);
		List<CommonFiledVo> list = new ArrayList<CommonFiledVo>();
		for (DispatchedMedicineVo medicine : diapatchedmedicinelist) {
			int adminid = medicine.getAdminid().getId();
			int patientId = medicine.getPatientid().getId();
			int prescriptionId = medicine.getPrescriptionid().getId();
			DispatchMedicineInfoVo dispatchMedicineInfoVo = new DispatchMedicineInfoVo();
			dispatchMedicineInfoVo.setDispatchedmedicineid(dispatchedMedicineVo);
			ArrayList<DispatchMedicineInfoVo> diapatchmedicinelist = dispatchedMedicineDao.editDispatechedMedicineInfo(dispatchMedicineInfoVo);
			float medicinePrice = medicine.getTotalprice();
			float discount = medicine.getTotaldiscount();
			float subtotal = medicine.getSubtotal();
			String joiningdate = medicine.getJoinindate();
			String discription = medicine.getDiscription();
			
			CommonFiledVo common = new CommonFiledVo();
			common.setJoiningdate(joiningdate);
			common.setDiscount(discount);
			common.setDispatchMedicineInfoVo(diapatchmedicinelist);
			common.setAdminId(adminid);
			common.setPatientID(patientId);
			common.setPrescriptionId(prescriptionId);
			common.setPrice(medicinePrice);
			common.setSubtotal(subtotal);
			common.setDiscription(discription);
			list.add(common);
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
		out.close();
	}

	private void medicineUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			int id = Integer.parseInt(request.getParameter("Id"));
			int adminid = Integer.parseInt(request.getParameter("adminId"));
			int categoryId = Integer.parseInt(request.getParameter("edit_medicine_category"));
			String joiningdate = request.getParameter("joinig");
			String medicineName = request.getParameter("medicine_name");
			String medicineDesrciption = request.getParameter("description");
			String medicineBatchNumber = request.getParameter("batch_number");
			int medicineQuantity = Integer.parseInt(request.getParameter("med_quantity"));
			float prices = Float.parseFloat(request.getParameter("med_price"));
			String medicineId = request.getParameter("med_uniqueid");
			String note = request.getParameter("note");
			float discount = Float.parseFloat(request.getParameter("med_discount"));

			String typeOfDiscount = request.getParameter("med_discount_in");
			String manufacturerCompanyName = request.getParameter("mfg_cmp_name");
			String manufactured = request.getParameter("manufactured_date");
			String expiry = request.getParameter("expiry_date");

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			CategoryVo categoryVo = new CategoryVo();
			categoryVo.setId(categoryId);

			MedicineVo medicineVo = new MedicineVo();
			medicineVo.setId(id);
			medicineVo.setAdminid(adminVo);
			medicineVo.setCategoryid(categoryVo);
			medicineVo.setDiscount(discount);
			medicineVo.setExpirydate(expiry);
			medicineVo.setJoiningdate(joiningdate);
			medicineVo.setManufacturedate(manufactured);
			medicineVo.setManufacturercompanyname(manufacturerCompanyName);
			medicineVo.setMedicinebatchnumber(medicineBatchNumber);
			medicineVo.setMedicinedesrciption(medicineDesrciption);
			medicineVo.setMedicineid(medicineId);
			medicineVo.setMedicinename(medicineName);
			medicineVo.setMedicinequantity(medicineQuantity);
			medicineVo.setNote(note);
			medicineVo.setTypeofdiscount(typeOfDiscount);
			medicineVo.setPrice(prices);

			MedicineDao medicineDao = new MedicineDao();
			String chackmedicine = medicineDao.medicineUpdate(medicineVo);
			if (chackmedicine == "true") {
				medicineupdate = "true";
			} else {
				medicineupdate = "false";
			}
			System.out.println(medicineupdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void medicineDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			int medicineId = Integer.parseInt(request.getParameter("medicineId"));
			System.out.println(medicineId);

			MedicineVo medicineVo = new MedicineVo();
			medicineVo.setId(medicineId);

			MedicineDao medicineDao = new MedicineDao();
			String message = medicineDao.deleteMedicine(medicineVo);
			if (message == "true") {
				medicineupdate = "true";
			} else {
				medicineupdate = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
