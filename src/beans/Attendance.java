package beans;

import java.time.LocalDate;
import java.util.Date;

public class Attendance {
	private int id;
	private int user_id;
	private String date_attendance;
	private int count_attendance;
	
	public Attendance() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getDate_attendance() {
		return date_attendance;
	}

	public void setDate_attendance(String date_attendance) {
		this.date_attendance = date_attendance;
	}

	public int getCount_attendance() {
		return count_attendance;
	}

	public void setCount_attendance(int count_attendance) {
		this.count_attendance = count_attendance;
	}
	
	@SuppressWarnings("deprecation")
	public static int tinhNgay(Date yourDate) {
 	   int day = -1;
 	   	Date currentTime = new Date();
 	   	if(currentTime.getYear() != yourDate.getYear()) {
 	   			return day=5;
 	   	} else {
 	   		if(currentTime.getMonth() != yourDate.getMonth()) {   	
 	   			return day =4;
 	   		}else {
 	   			if(currentTime.getDate() - yourDate.getDate()>=2)
 	   				return day =3;
 	   			if(currentTime.getDate() - yourDate.getDate()==1) 
 	   				return day =1;
 	   			if(currentTime.getDate() - yourDate.getDate()==0) 
 	   				return day =0;
 	   		}
 	   	}
 	   	return day;
    }		
	public static void main(String[] args) {
		LocalDate l = LocalDate.now();
		System.out.println(l);
	}
}
