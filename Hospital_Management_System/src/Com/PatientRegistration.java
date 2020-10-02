package Com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
    private static String getSubmittedFileName(Part part) {
		String filename = "null";
		for (String cd : part.getHeader("content-disposition").split(";")) {
			System.out.println(cd);
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				System.out.println("----------------------------------122121------------------------");
				System.out.println(fileName);
				System.out.println("----------------------------------------");
				System.out.println(fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1));
				System.out.println("---------1235313-------------------------------------------------");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
			}
		}
		return filename;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------------------");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if (flag.equalsIgnoreCase("insert")) {
			patientRegistrationInsert(request, response);
		}
	}

	private void patientRegistrationInsert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Part profileImage1 = request.getPart("diagnosis1");
		System.out.println(profileImage1);
		System.out.println("---------------------");
		for(int i=1 ; i<=3 ; i++) {
			System.out.println("-----------------------------------------------------------------------------");
			
			Part profileImage = request.getPart("diagnosis"+i+"");
			System.out.println("part"+i+" ==>"+profileImage);
			String profileImageName = getSubmittedFileName(profileImage);
			System.out.println("profileImageName"+i+" ==>"+profileImageName);
			
		}
		
	}
}
