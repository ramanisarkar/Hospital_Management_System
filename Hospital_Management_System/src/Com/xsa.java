package Com;

import java.util.*;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class xsa {
	public static void main(String[] args) {
		
		
		String user = "vishvastrada1540@gmail.com";
		String to ="hardikr19326@gmail.com";
		String sub = "dsadsa";
		String msg ="gbudsadsadasdaiuscfgkjabsbuogpwedjkbucgew";
		Properties properties = new  Properties();
		properties.put("mail.smtp.auth", "false");
	    properties.put("mail.smtp.starttls.enable", "true");
	    properties.put("mail.smtp.host", "smtp.gmail.com");
	    properties.put("mail.smtp.port", "587");
	    
	    Session session = Session.getInstance(properties);
		try {
			System.out.println("good-----");
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			
			Transport.send(message);
			System.out.println("slbdjgaslkdtg9wdhahdiy");
			String sentsuccess;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
