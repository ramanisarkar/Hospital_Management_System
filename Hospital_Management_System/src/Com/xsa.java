package Com;

import java.util.*;
import javax.mail.*;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class xsa {

	public static void main(String[] args) {

		
		
		java.util.Properties props = new java.util.Properties();
		props.put("mail.smtp.host", "smtp.myisp.com");
		Session session = Session.getDefaultInstance(props, null);

		// Construct the message
		String to = "hardikr19326@gmail.com";
		String from = "vishvastrada1540@gmail.com";
		String subject = "Hello";
		Message msg = new MimeMessage(session);
		try {
		    msg.setFrom(new InternetAddress(from));
		    msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		    msg.setSubject(subject);
		    msg.setText("Hi,\n\nHow are you?");

		    // Send the message.
		    Transport.send(msg);
		    System.out.println("fadnklnkhkh");
		} catch (MessagingException e) {
		   e.printStackTrace();
		}
	}

}
