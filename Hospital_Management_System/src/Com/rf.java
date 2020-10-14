package Com;

import java.text.ParseException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


public class rf {
	public static void main(String[] args) throws ParseException {
		
		String s = "22:18";
		LocalTime localTime = LocalTime.parse(s);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a");
		String sdsa = localTime.format(formatter);
		System.out.println(sdsa);
		
		String s6 ="";
		String s1 = "ds";
		String sds = s6.concat(s1);
		System.out.println(sds);
	}
}
