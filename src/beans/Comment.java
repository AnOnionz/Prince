package beans;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;

public class Comment {
	private int comment_id;
	private int user_id;
	private int post_id;
	private String content;
	private Timestamp create_time;
	private int root_id;
	private int reply_id;
	
	public Comment() {
		super();
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public int getRoot_id() {
		return root_id;
	}
	public void setRoot_id(int root_id) {
		this.root_id = root_id;
	}
	public String getStringTime() {
		LocalDateTime today = LocalDateTime.now();
		Calendar cal = Calendar.getInstance();
		cal.setTime(this.create_time);
		int dayc = cal.get(Calendar.DAY_OF_YEAR);
		int dayt = today.getDayOfYear();
		if(dayt-dayc < 7 && dayt-dayc >1) {
			return dayt-dayc +" ngày trước";
		}else {
			int hourc = cal.get(Calendar.HOUR_OF_DAY);
			int hourt = today.getHour();
			int minutec = cal.get(Calendar.MINUTE);
			int minutet = today.getMinute();
			int secondc = cal.get(Calendar.SECOND);
			int secondt =today.getSecond();
			String hour = hourt - hourc > 0 ? hourt - hourc + "" : null;
			String minute = minutet-minutec > 0 ? minutet-minutec + "" : null;
			String second = secondt-secondc > 0 ? secondt-secondc + "" : null;
			if(dayt-dayc<1) {
				return hour!=null?hour+" giờ trước": minute!=null?minute+" phút trước" : second!=null?second +" giây trước":"ngay bây giờ"; 
			}
			if(dayt-dayc==1){
				return "hôm qua lúc "+hourc+":"+minutec;
			}
		}
		return null;
		
	}
	public String getAvatar() {
		UserAccount user = UserDAO.selectUserById(this.user_id);
		String avatar = user.getAVATAR();
		if(avatar == null || avatar =="") {
			avatar = "assets/images/user/avatar.png";
		}
		return avatar;
	}
	public String getName() {
		UserAccount user = UserDAO.selectUserById(this.user_id);
		return user.getUSERNAME();
	}
	public String getAuthor() {
		Comment cmt = CommentDAO.selectCommentById(reply_id);
		UserAccount user = UserDAO.selectUserById(cmt.user_id);
		return user.getUSERNAME();
	}
	public ArrayList<Comment> getSubCmt(){	
		return CommentDAO.selectSubComment(this.comment_id);
		
	}
	public static void main(String[] args) throws ParseException {
		Comment c = new Comment();
		java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf("2019-11-29 16:00:00.0");
		c.setCreate_time(timestamp);
		System.out.println(c.getStringTime());
	}
	

}
