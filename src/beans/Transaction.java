package beans;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Transaction {
	private int transaction_id;
	private String transaction_name;
	private int user_id;
	private Timestamp created_time;
	private int score;
	private int status;
	
	public Transaction() {
		super();
	}
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getTransaction_name() {
		return transaction_name;
	}
	public void setTransaction_name(String transaction_name) {
		this.transaction_name = transaction_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Timestamp getCreate_time() {
		return created_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.created_time = create_time;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	public String timetoString() {
	String dateTime = "";
	Timestamp createtime = this.created_time;
	java.util.GregorianCalendar cal = (GregorianCalendar) Calendar.getInstance();
	cal.setTime(createtime);
	
	int date = cal.get(java.util.Calendar.DAY_OF_MONTH);
	int month = cal.get(java.util.Calendar.MONTH) + 1;
	int year = cal.get(java.util.Calendar.YEAR);

	dateTime = date + "/" + (month < 10 ? "0"+ month : month) + "/" + year;

	return dateTime;
	}
	

}
