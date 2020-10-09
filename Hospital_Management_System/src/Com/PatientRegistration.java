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
import DAO.LoginDAO;
import DAO.PatientRegistreationDao;
import VO.AccountantList;
import VO.AccountantStaffVo;
import VO.AdminVo;
import VO.AmbulanceVo;
import VO.LoginVO;
import VO.PatentRegistreationList;
import VO.PatientRegistretionVo;

/**
 * Servlet implementation class PatientRegistration
 */

@WebServlet("/PatientRegistration")
@MultipartConfig
public class PatientRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String patientupdate = null;
	private String patientemail = null;
	private String patientuser = null;
	private String patientemailinvalid = null;
   	
    private static final String SAVE_DIR_Images = "Patient_Registration_Image";

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

   	private void patientImage(boolean s, String profileImagepath, Part profileImage, boolean s2, String diagosispath, Part diagnosis) {
   		try {
   			if (s == true) {
   				String Path = getServletContext()
   						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileImagepath);
   				profileImage.write(Path);
   			}
   			if (s2 == true) {
   				String Path = getServletContext()
   						.getRealPath(File.separator + SAVE_DIR_Images + File.separator + diagosispath);
   				diagnosis.write(Path);
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
   			session.setAttribute("patientRaggistrationAdminid", adminid);
   			response.sendRedirect("Admin_Patient_Registration.jsp");
   		}
   		if (flag.equalsIgnoreCase("PatientRegistrationList")) {
   			patientList(request, response);
   		}
   		if (flag.equalsIgnoreCase("editPatientRegistration")) {
   			patientRegistrationEdit(request, response);
   		}
   		if (flag.equalsIgnoreCase("deletePatientRegistration")) {
   			patientRegistrationDelete(request, response);
   		}
   	}

   	protected void doPost(HttpServletRequest request, HttpServletResponse response)
   			throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		System.out.println("---------------sasasa--------------------------------------------");
   		String flag = request.getParameter("flag");
   		String firstName = request.getParameter("firstname");
   		
   		System.out.println(firstName);
   		System.out.println(flag);
   		if (flag.equalsIgnoreCase("insert")) {
   			patientRegistrationInsert(request, response);
   		}
   		if (flag.equalsIgnoreCase("update")) {
   			patientRegistrationUpdate(request, response);
   		}
   		if (flag.equalsIgnoreCase("chackuser")) {
   			patientReagistrationChack(request, response);
   		}
   	}

   	private void patientReagistrationChack(HttpServletRequest request, HttpServletResponse response)
   			throws IOException {
   		String patientuserId = request.getParameter("patientuserId");
   		System.out.println(patientuserId);
   		
   		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
   		patientRegistretionVo.setUsername(patientuserId);
   		
   		PatientRegistreationDao patientRegistreationDao = new  PatientRegistreationDao();
   		ArrayList<PatientRegistretionVo> usernamechack = patientRegistreationDao.userNameVerify(patientRegistretionVo);
   		System.out.println(usernamechack.size());
   		List<PatentRegistreationList> list = new ArrayList<PatentRegistreationList>();
   		if (usernamechack.isEmpty() == true) {
   			String respose = "true";
   			PatentRegistreationList common = new PatentRegistreationList();
   			common.setChackusername(respose);
   			list.add(common);
   		} else {
   			for (PatientRegistretionVo pharmacist : usernamechack) {
   				String username = pharmacist.getUsername();
   				String user = "false";
   				PatentRegistreationList common = new PatentRegistreationList();
   				common.setUsername(username);
   				common.setChackusername(user);
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
   	
   	private void patientList(HttpServletRequest request, HttpServletResponse response) throws IOException {

   		HttpSession session = request.getSession();
   		int adminid = (int) session.getAttribute("patientRaggistrationAdminid");

   		AdminVo adminVo = new AdminVo();
   		adminVo.setId(adminid);

   		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
   		patientRegistretionVo.setAdminid(adminVo);

   		PatientRegistreationDao  patientRegistreationDao = new PatientRegistreationDao();
   		ArrayList<PatientRegistretionVo> patientList = patientRegistreationDao.patientRegistrationList(patientRegistretionVo);
   		List<PatentRegistreationList> list = new ArrayList<PatentRegistreationList>();
   		for (PatientRegistretionVo patient : patientList) {
   			int id = patient.getId();
   			String name = patient.getFirstname();
   			String blood = patient.getBloodgroup();
   			String photo = patient.getProfileimage();
   			String email = patient.getEmail();
   			String mobile = patient.getMobileno();
   			String patientid = patient.getPatientid();
   			System.out.println(patientid);
   			PatentRegistreationList common = new PatentRegistreationList();
   			common.setId(id);
   			common.setFirstname(name);
   			common.setBloodgroup(blood);
   			common.setProfileimage(photo);
   			common.setEmail(email);
   			common.setMobileno(mobile);
   			common.setPatientid(patientid);
   			common.setPatientupdate(patientupdate);
   			list.add(common);
   		}
   		Gson gson = new Gson();
   		System.out.println(gson.toJson(list));
   		PrintWriter out = response.getWriter();
   		out.print(gson.toJson(list));
   		out.flush();
   		out.close();
   	}

   	private void patientRegistrationInsert(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			System.out.println("----------------------");
   			HttpSession session = request.getSession();
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = (int) session.getAttribute("patientRaggistrationAdminid");
   				String firstName = request.getParameter("first_name");
   				String middleName = request.getParameter("middle_name");
   				String lastName = request.getParameter("last_name");
   				String dateofbirth = request.getParameter("birth_date");
   				java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
   				String gender = request.getParameter("gender");
   				String blood_group = request.getParameter("blood_group");
   				String symptoms = request.getParameter("symptoms");
   				String address = request.getParameter("address");
   				String city_name = request.getParameter("city_name");
   				String state_name = request.getParameter("state_name");
   				String country_name = request.getParameter("country_name");
   				String zip_code = request.getParameter("zip_code");
   				String phonecode = request.getParameter("phonecode");
   				String mobile = request.getParameter("mobile");
   				String phone = request.getParameter("phone");
   				String userName = request.getParameter("username");
   				String password = request.getParameter("password");

   				Part profileImage = request.getPart("profileimage");
   				Part diagnosis = request.getPart("diagnosis");
   				
   				String profileImageName = getSubmittedFileName(profileImage);
   				String diagonsisName = getSubmittedFileName(diagnosis);
   				String profileImagepath = null;
   				String diagosispath = null;

   				boolean s,s2;
   				int i = 1;
   				if ((profileImageName.isEmpty()) == false) {
   					String uniq = String.valueOf(i);
   					profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
   					s = true;
   				} else {
   					s = false;
   				}
   				if ((diagonsisName.isEmpty()) == false) {
   					String uniq = String.valueOf(i);
   					diagosispath = userName.concat(uniq).concat("@").concat(diagonsisName);
   					s2 = true;
   				} else {
   					s2 = false;
   				}

   				Timestamp t1 = new Timestamp(System.currentTimeMillis());
   				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  hh:mm:ss aa");
   				String joiningdate = sdf.format(t1);

   				AdminVo adminVo = new AdminVo();
   				adminVo.setId(adminid);
   				
   				PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao(); 
   				ArrayList<PatientRegistretionVo> getlastrecord = patientRegistreationDao.getlastrecord();
   				SimpleDateFormat yl2d = new SimpleDateFormat("yy");
				String yearoflastdigital = yl2d.format(t1);
   				String patientId = null;
				if(getlastrecord.isEmpty()==true) {
					patientId = "P".concat(yearoflastdigital).concat("0001");
   				}
   				else if(getlastrecord.isEmpty()==false) {
   					String id = getlastrecord.get(0).getPatientid();
   					String removeFirst = id.substring(3);
   					
   					int a1 = Integer.parseInt(removeFirst);
   					a1++;
   					int c = a1;
   					String s23 = String.valueOf(c);
   					if (c >= 1 && c < 10) {
   						patientId = "P".concat(yearoflastdigital).concat("000").concat(s23);
   					} else if (c >= 10 && c < 100) {
   						patientId = "P".concat(yearoflastdigital).concat("00").concat(s23);
   					} else if (c >= 100) {
   						patientId = "P".concat(yearoflastdigital).concat("0").concat(s23);
   					}else if (c >= 1000) {
   						patientId = "P".concat(yearoflastdigital).concat(s23);
   					}
   				}
 
				PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
				patientRegistretionVo.setPatientid(patientId);
   				patientRegistretionVo.setFirstname(firstName);
   				patientRegistretionVo.setMidalname(middleName);
   				patientRegistretionVo.setLastname(lastName);
   				patientRegistretionVo.setBirthdate(dateOfBirth);
   				patientRegistretionVo.setBloodgroup(blood_group);
   				patientRegistretionVo.setSymptoms(symptoms);
   				patientRegistretionVo.setGender(gender);
   				patientRegistretionVo.setHomeeaddrss(address);
   				patientRegistretionVo.setHomecity(city_name);
   				patientRegistretionVo.setHomestate(state_name);
   				patientRegistretionVo.setHomecountry(country_name);
   				patientRegistretionVo.setHomezipcode(zip_code);
   				patientRegistretionVo.setMobilecountrycode(phonecode);
   				patientRegistretionVo.setMobileno(mobile);
   				patientRegistretionVo.setPhoneno(phone);
   				patientRegistretionVo.setEmail(email);
   				patientRegistretionVo.setUsername(userName);
   				patientRegistretionVo.setPassword(password);
   				patientRegistretionVo.setProfileimage(profileImagepath);
   				patientRegistretionVo.setDiagnosis(diagosispath);
   				patientRegistretionVo.setJoiningdate(joiningdate);
   				patientRegistretionVo.setAdminid(adminVo);

				String chackPatient = patientRegistreationDao.insertPatient(patientRegistretionVo);
				if (chackPatient == "true") {
					String uploadImagePath = getServletContext().getRealPath(File.separator + SAVE_DIR_Images);
					File imageDir = new File(uploadImagePath);
					if (!imageDir.exists()) {
						imageDir.mkdirs();
					}
					patientImage(s, profileImagepath, profileImage, s2, diagosispath, diagnosis);
					patientupdate="true";
					System.out.println(patientupdate);
   					String respose = "success";
   					response.setContentType("text/plain");
   					response.setCharacterEncoding("UTF-8");
   					response.getWriter().write(respose);
				} else {
					patientupdate = "false";
				}
   					
   			} else {
   				patientupdate = "false";
   				patientemailinvalid = "false";
   				System.out.println(patientupdate);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(patientemailinvalid);
   			}

   		} catch (Exception e) {
   			e.printStackTrace();
   		}
   	}

   	private void patientRegistrationEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
   		int patientId = Integer.parseInt(request.getParameter("patientId"));
   		System.out.println(patientId);

   		PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
   		patientRegistretionVo.setId(patientId);
   		
   		PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
   		
   		ArrayList<PatientRegistretionVo> patientList = patientRegistreationDao.editPatient(patientRegistretionVo);
   		List<PatentRegistreationList> list = new ArrayList<PatentRegistreationList>();
   		for (PatientRegistretionVo patient: patientList) {
   			int adminid = patient.getAdminid().getId();
   			String patientid = patient.getPatientid();
   			String symptoms = patient.getSymptoms();
   			String firstName = patient.getFirstname();
   			String middleName = patient.getMidalname();
   			String lastName = patient.getLastname();
   			java.sql.Date dateofbirth = patient.getBirthdate();
   			String date = dateofbirth.toString();
   			String gender = patient.getGender();
   			String homeAddress = patient.getHomeeaddrss();
   			String homeCity = patient.getHomecity();
   			String homeState = patient.getHomestate();
   			String homeCountry = patient.getHomecountry();
   			String homeZipcode = patient.getHomezipcode();
   			String standardCode = patient.getMobilecountrycode();
   			String mobileNumber = patient.getMobileno();
   			String phoneNumber = patient.getPhoneno();
   			String email = patient.getEmail();
   			String password = patient.getPassword();
   			String userName = patient.getUsername();
   			String profileimage = patient.getProfileimage();
   			String bloodgroup = patient.getBloodgroup();
   			String profileimagename = "";
   			if (profileimage != null) {
   				int a = profileimage.indexOf("@");
   				a++;
   				profileimagename = profileimage.substring(a);
   			}
   			String diagnosis = patient.getDiagnosis();
   			String diagnosisname = "";
   			if (diagnosis != null) {
   				int a = diagnosis.indexOf("@");
   				a++;
   				diagnosisname = diagnosis.substring(a);
   			}
   			String joiningdate = patient.getJoiningdate();
   			PatentRegistreationList common = new PatentRegistreationList();
   			common.setId(patientId);
   			common.setPatientid(patientid);
   			common.setDignosis(diagnosis);
   			common.setDignosisname(diagnosisname);
   			common.setSymptoms(symptoms);
   			common.setAdminid(adminid);
   			common.setFirstname(firstName);
   			common.setBloodgroup(bloodgroup);
   			common.setMidalname(middleName);
   			common.setLastname(lastName);
   			common.setDate(date);
   			common.setGender(gender);
   			common.setHomeeaddrss(homeAddress);
   			common.setHomecity(homeCity);
   			common.setHomestate(homeState);
   			common.setHomecountry(homeCountry);
   			common.setHomezipcode(homeZipcode);
   			common.setMobilecountrycode(standardCode);
   			common.setMobileno(mobileNumber);
   			common.setPhoneno(phoneNumber);
   			common.setEmail(email);
   			common.setUsername(userName);
   			common.setPassword(password);
   			common.setProfileimage(profileimage);
   			common.setProfileimagename(profileimagename);
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

   	private void patientRegistrationUpdate(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			String email = request.getParameter("email");
   			if (EmailValidation.isValid(email)) {
   				int adminid = Integer.parseInt(request.getParameter("adminid"));
   				int id = Integer.parseInt(request.getParameter("Id"));
   				String joiningdate = request.getParameter("joinig");
   				String patientId = request.getParameter("patientId");
   				String firstName = request.getParameter("first_name");
   				String middleName = request.getParameter("middle_name");
   				String lastName = request.getParameter("last_name");
   				String dateofbirth = request.getParameter("birth_date");
   				java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateofbirth);
   				String gender = request.getParameter("gender");
   				String blood_group = request.getParameter("blood_group");
   				String symptoms = request.getParameter("symptoms");
   				String address = request.getParameter("address");
   				String city_name = request.getParameter("city_name");
   				String state_name = request.getParameter("state_name");
   				String country_name = request.getParameter("country_name");
   				String zip_code = request.getParameter("zip_code");
   				String phonecode = request.getParameter("phonecode");
   				String mobile = request.getParameter("mobile");
   				String phone = request.getParameter("phone");
   				String userName = request.getParameter("username");
   				String password = request.getParameter("password");
   				String editprofileImage = request.getParameter("editprofileImage");
   				String dignosis = request.getParameter("editdignosis");
   				System.out.println(editprofileImage);

   				Part profileImage = request.getPart("profileimage");
   				Part diagnosis = request.getPart("diagnosis");
   				
   				String profileImageName = getSubmittedFileName(profileImage);
   				String diagonsisName = getSubmittedFileName(diagnosis);
   				String profileImagepath = null;
   				String diagosispath = null;

   				boolean s,s2;
   				int i = 1;
   				if ((profileImageName.isEmpty()) == false) {
   					String Path = getServletContext()
   							.getRealPath(File.separator + SAVE_DIR_Images + File.separator + editprofileImage);
   					File dir = new File(Path);
   					dir.delete();
   					String uniq = String.valueOf(i);
   					profileImagepath = userName.concat(uniq).concat("@").concat(profileImageName);
   					s = true;
   				} else {
   					s = false;
   					profileImagepath = editprofileImage;
   				}
   				if ((diagonsisName.isEmpty()) == false) {
   					String Path = getServletContext()
   							.getRealPath(File.separator + SAVE_DIR_Images + File.separator + dignosis);
   					File dir = new File(Path);
   					dir.delete();
   					String uniq = String.valueOf(i);
   					diagosispath = userName.concat(uniq).concat("@").concat(diagonsisName);
   					s2 = true;
   				} else {
   					s2 = false;
   					diagosispath = dignosis;
   				}

   				AdminVo adminVo = new AdminVo();
   				adminVo.setId(adminid);

   				PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
				patientRegistretionVo.setPatientid(patientId);
   				patientRegistretionVo.setFirstname(firstName);
   				patientRegistretionVo.setMidalname(middleName);
   				patientRegistretionVo.setLastname(lastName);
   				patientRegistretionVo.setBirthdate(dateOfBirth);
   				patientRegistretionVo.setBloodgroup(blood_group);
   				patientRegistretionVo.setSymptoms(symptoms);
   				patientRegistretionVo.setGender(gender);
   				patientRegistretionVo.setHomeeaddrss(address);
   				patientRegistretionVo.setHomecity(city_name);
   				patientRegistretionVo.setHomestate(state_name);
   				patientRegistretionVo.setHomecountry(country_name);
   				patientRegistretionVo.setHomezipcode(zip_code);
   				patientRegistretionVo.setMobilecountrycode(phonecode);
   				patientRegistretionVo.setMobileno(mobile);
   				patientRegistretionVo.setPhoneno(phone);
   				patientRegistretionVo.setEmail(email);
   				patientRegistretionVo.setUsername(userName);
   				patientRegistretionVo.setPassword(password);
   				patientRegistretionVo.setProfileimage(profileImagepath);
   				patientRegistretionVo.setDiagnosis(diagosispath);
   				patientRegistretionVo.setJoiningdate(joiningdate);
   				patientRegistretionVo.setAdminid(adminVo);
   				patientRegistretionVo.setId(id);

   				PatientRegistreationDao  patientRegistreationDao = new PatientRegistreationDao();
				String chackpatient = patientRegistreationDao.UpdatePatientProfile(patientRegistretionVo);
				if (chackpatient == "true") {
					patientupdate = "true";
					patientImage(s, profileImagepath, profileImage,s2, diagosispath, diagnosis );
					System.out.println(patientupdate);
   					String respose = "success";
   					response.setContentType("text/plain");
   					response.setCharacterEncoding("UTF-8");
   					response.getWriter().write(respose);
				} else {
					System.out.println("supportStaff profile was not update");
					patientupdate = "false";
				}
   			} else {
   				patientupdate = "false";
   				patientemailinvalid = "false";
   				System.out.println(patientupdate);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(patientemailinvalid);
   			}
   		} catch (Exception e) {
   			e.printStackTrace();
   		}
   	}

   	private void patientRegistrationDelete(HttpServletRequest request, HttpServletResponse response) {
   		try {
   			int patientId = Integer.parseInt(request.getParameter("patientId"));
   			System.out.println(patientId);

   			PatientRegistretionVo patientRegistretionVo = new PatientRegistretionVo();
   			patientRegistretionVo.setId(patientId);
   			
   			PatientRegistreationDao patientRegistreationDao = new PatientRegistreationDao();
   			ArrayList<PatientRegistretionVo> patientList = patientRegistreationDao.editPatient(patientRegistretionVo);
   			String profileimage = patientList.get(0).getProfileimage();
   			String diagnosis = patientList.get(0).getDiagnosis();
   			
   			String message = patientRegistreationDao.deletePatient(patientRegistretionVo);
   			if (message  == "true") {
				if ((profileimage.isEmpty()) == false) {
					String Path = getServletContext()
							.getRealPath(File.separator + SAVE_DIR_Images + File.separator + profileimage);
					File dir = new File(Path);
					dir.delete();
					String Path1 = getServletContext()
							.getRealPath(File.separator + SAVE_DIR_Images + File.separator + diagnosis);
					File dir1 = new File(Path1);
					dir1.delete();
				}
				System.out.println(message);
				String respose = "success";
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
