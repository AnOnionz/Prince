package beans;

import java.util.Date;

public class LuckyWheel {
	private int id;
	private int user_id;
	private String date_luckywheel;
	public LuckyWheel(int id, int user_id, String date_luckywheel) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.date_luckywheel = date_luckywheel;
	}
	public LuckyWheel() {
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
	public String getDate_luckywheel() {
		return date_luckywheel;
	}
	public void setDate_luckywheel(String date_luckywheel) {
		this.date_luckywheel = date_luckywheel;
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
}
