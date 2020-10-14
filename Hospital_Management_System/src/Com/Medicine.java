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

import DAO.MedicineDao;
import VO.AdminVo;
import VO.CategoryVo;
import VO.MedicineList;
import VO.MedicineVo;

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
			response.sendRedirect("Admin_Medicine_Reg.jsp");
		}
		if (flag.equalsIgnoreCase("medicineList")) {
			medicineList(request, response);
		}
		if (flag.equalsIgnoreCase("editMedicine")) {
			medicineEdit(request, response);
		}
		if (flag.equalsIgnoreCase("deleteMedicine")) {
			medicineDelete(request, response);
			medicineList(request, response);
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
			java.sql.Date expiry = medicine.getExpirydate();
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
				System.out.println("----------------------------");
				System.out.println(medicineName[i]+" "+medicineDesrciption[i]+" "+medicineBatchNumber[i] +" "+medicineQuantity[i]+" "+
						prices[i]+" "+medicineId[i]+" "+note[i] +" "+discount[i]+" "+typeOfDiscount[i] +" "+manufacturerCompanyName[i]+" "+manufactured[i]+" "+
						expiry[i]);
				System.out.println("----------------------------");
				
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
				java.sql.Date manufacturedDate1 = java.sql.Date.valueOf(manufactured1);
				String expiry1 = expiry[i];
				java.sql.Date expiryDate1 = java.sql.Date.valueOf(expiry1);

				MedicineVo medicineVo = new MedicineVo();
				medicineVo.setAdminid(adminVo);
				medicineVo.setCategoryid(categoryVo);
				medicineVo.setDiscount(discount1);
				medicineVo.setExpirydate(expiryDate1);
				medicineVo.setJoiningdate(joiningdate);
				medicineVo.setManufacturedate(manufacturedDate1);
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
					medicineupdate = "true";
				} else {
					medicineupdate = "false";
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
			java.sql.Date date = medicine.getManufacturedate();
			String manufacturerdate = date.toString();
			java.sql.Date expiry = medicine.getExpirydate();
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
			java.sql.Date manufacturedDate1 = java.sql.Date.valueOf(manufactured);
			java.sql.Date expiryDate1 = java.sql.Date.valueOf(expiry);

			AdminVo adminVo = new AdminVo();
			adminVo.setId(adminid);

			CategoryVo categoryVo = new CategoryVo();
			categoryVo.setId(categoryId);

			MedicineVo medicineVo = new MedicineVo();
			medicineVo.setId(id);
			medicineVo.setAdminid(adminVo);
			medicineVo.setCategoryid(categoryVo);
			medicineVo.setDiscount(discount);
			medicineVo.setExpirydate(expiryDate1);
			medicineVo.setJoiningdate(joiningdate);
			medicineVo.setManufacturedate(manufacturedDate1);
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
				medicineupdate= "true";
			} else {
				medicineupdate="false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
