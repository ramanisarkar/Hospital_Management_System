package Com;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SentMail {

	public static String send(String to, String sub, String msg, String user, String pass) {
		String sentsuccess;
		Properties prop = new  Properties();
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port","587");
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.starttls.enable","true");
		
		Session session = Session.getInstance(prop , new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pass);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			
			Transport.send(message);
			return sentsuccess="true";
		}
		catch (Exception e) {
			return sentsuccess="false";
		}
		
	}
	
	

}
