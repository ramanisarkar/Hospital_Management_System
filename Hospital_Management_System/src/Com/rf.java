package Com;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class rf {
	public static void main(String[] args) throws ParseException {
//	     ------------------convert to 24 to 12 hours------------------------
		String s = "22:18";
		LocalTime localTime = LocalTime.parse(s);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a");
		String sdsa = localTime.format(formatter);
		System.out.println(sdsa);

		String s6 = "";
		String s1 = "ds";
		String sds = s6.concat(s1);
		System.out.println(sds);
//	     ------------------convert to 24 to 12 hours------------------------
		
//	     ------------------dureation between tow date------------------------
		String dateStart = "05-10-2020";
		String dateStop = "06-10-2020";

		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(d2.getTime());
		long diff = d2.getTime() - d1.getTime();
		long difference_In_Days = (diff / (1000 * 60 * 60 * 24)) % 365;
		System.out.println(difference_In_Days);

//	     ------------------dureation between tow date------------------------
		
//     ------------------dureation between tow time------------------------
		String start = "16:00";
		String end = "19:00";

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		long ms = sdf.parse(start).getTime();
		java.sql.Time starttime = new java.sql.Time(ms);
		long ms1 = sdf.parse(end).getTime();
		java.sql.Time endtime = new java.sql.Time(ms1);

		LocalTime t1 = starttime.toLocalTime();
		LocalTime t2 = endtime.toLocalTime();
		long Duration = java.time.Duration.between(t1, t2).toMinutes();
		System.out.println(Duration);
//        ------------------dureation between tow time------------------------
		
//		commper tow date ------------------------------		
		String startDateString = "04/06/2020";
		String endDateString = "12/06/2020";
		String startc= "03/05/2020";
		String enda= "11/06/2020";
		
	    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	    String date1 =  sdf2.format(sdf1.parse(startDateString));
	    String date2 =  sdf2.format(sdf1.parse(endDateString));
	    String date3 =  sdf2.format(sdf1.parse(startc));
	    String date4 =  sdf2.format(sdf1.parse(enda));
	    
	    java.sql.Date dfa = java.sql.Date.valueOf(date1);
	    java.sql.Date dfa1 = java.sql.Date.valueOf(date2);
	    java.sql.Date d3 = java.sql.Date.valueOf(date3);
	    java.sql.Date d4 = java.sql.Date.valueOf(date4);
	    
	    if(((d3.after(dfa) || d3.equals(dfa))&&(d3.before(dfa1) || d3.equals(dfa1))) || (d4.after(dfa) || d4.equals(dfa))&&(d4.before(dfa1) || d4.equals(dfa1)) ||(dfa.after(d3) && dfa.before(d4)) ) {
	    	System.out.println("yes i got that");
	    }
	    else {
			System.out.println("okk");
		}
	    
	    if (dfa.compareTo(dfa1) > 0) {
	        System.out.println("Date1 is after Date2");
	    } else if (dfa.compareTo(dfa1) < 0) {
	        System.out.println("Date1 is before Date2");
	    } else {
	        System.out.println("Date1 is equal to Date2");
	    }
//		commper tow date ------------------------------	
	   
//	    UPDATE patientchargeshistory s
//	    JOIN (
//	        SELECT 1 AS id, "paid" AS patient
//	        UNION ALL
//	        SELECT 2, "paid"
//	        
//	    ) vals ON s.id = vals.id
//	    SET PatientType = patient;
		
	}
	
}
