package beans;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Post {
	private int extend;
	private int post_id;
	private int category_id;
	private int author_id;
	private int click;
	private int visiter;
	private Timestamp created_time;
	private String title;
	private String subTitle1;
	private String subTitle2;
	private String content1;
	private String content2;
	private String image;
	private String image1;
	private String image2;
	private String figure3;
	private String figure1;
	private String figure2;
	private String url;
	private String video;
	private java.sql.Date startDate;
	private java.sql.Date endDate;
	private int cost;
	private double costPerClick;
	private int score;
	private int format;
	private int status;
	private int vote;
	public Post() {
		super();
		this.extend = 0;
	}

	public int getAuthor_id() {
		return author_id;
	}
	public String getAuthorName() {
		return UserDAO.selectUserById(author_id).getUSERNAME();
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getCategoryName() {
		return CategoryDAO.getCategoryName(String.valueOf(this.category_id));
	}

	public Timestamp getCreated_time() {
		return created_time;
	}

	public void setCreated_time(Timestamp created_time) {
		this.created_time = created_time;
	}
	public int getExtend() {
		return extend;
	}

	public void setExtend(int extend) {
		this.extend = extend;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle1() {
		return subTitle1;
	}

	public void setSubTitle1(String subTitle1) {
		this.subTitle1 = subTitle1;
	}

	public String getSubTitle2() {
		return subTitle2;
	}

	public void setSubTitle2(String subTitle2) {
		this.subTitle2 = subTitle2;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getFigure3() {
		return figure3;
	}

	public void setFigure3(String figure3) {
		this.figure3 = figure3;
	}

	public String getFigure1() {
		return figure1;
	}

	public void setFigure1(String figure1) {
		this.figure1 = figure1;
	}

	public String getFigure2() {
		return figure2;
	}

	public void setFigure2(String figure2) {
		this.figure2 = figure2;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public double getCostPerClick() {
		return costPerClick;
	}

	public void setCostPerClick(double cpc) {
		this.costPerClick = cpc;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public int getFormat() {
		return format;
	}

	public void setFormat(int format) {
		this.format = format;
	}

	public int getVisiter() {
		return visiter;
	}

	public void setVisiter(int visiter) {
		this.visiter = visiter;
	}
	
	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public int getClickGuess() {
		return (int) (cost / costPerClick);

	}

	public int costPerClick() throws Exception {
		// nguoi dung chi nhan 35%
		final double rate = 0.65;
		return (int) (((1 - rate) * (this.costPerClick))*util.Utils.getRateUSD())/100;
	}

	public String createTimeToString() {
		String dateTime = "";
		Timestamp createtime = this.created_time;
		java.util.GregorianCalendar cal = (GregorianCalendar) Calendar.getInstance();
		cal.setTime(createtime);
		int day = cal.get(java.util.Calendar.DAY_OF_WEEK);
		int date = cal.get(java.util.Calendar.DAY_OF_MONTH);
		int month = cal.get(java.util.Calendar.MONTH) + 1;
		int year = cal.get(java.util.Calendar.YEAR);
		int hours = cal.get(java.util.Calendar.HOUR);
		int minute = cal.get(java.util.Calendar.MINUTE);
		int a = cal.get(java.util.Calendar.AM_PM);

		dateTime = "ngày " + date + " tháng " + month + ", " + year + " lúc " + hours + ":" + minute;
		if (cal.get(Calendar.AM_PM) == 0) {
			dateTime = dateTime + " AM";
		} else {
			dateTime = dateTime + " PM";
		}

		return dateTime;
	}
	public String getFormatName() {
		if(this.format==1) {
			return "bài viết";
		}
		if(this.format==2) {
			return "video";
		}
		if(this.format==3) {
			return "banner";
		}
		return null;
	}
	public String getStringTime() {
		LocalDateTime today = LocalDateTime.now();
		Calendar cal = Calendar.getInstance();
		cal.setTime(this.created_time);
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
	@Override
	public String toString() {

		return title + "\n" + author_id + "\n" + content1 + "\n" + cost + "\n" + costPerClick + "\n" + format + "\n"
				+ image + "\n" + image1 + "\n" + image2 + "\n" + post_id + "\n" + visiter + "\n" + figure1 + "\n"
				+ figure2 + "\n" + category_id + "\n";

	}

	public static void main(String[] args) throws Exception {
		Post post = new Post();
		post.setCostPerClick(0.3);
		//System.out.println(post.costPerClick());
		post.setCreated_time(Timestamp.valueOf(LocalDateTime.now()));
		System.out.println(post.createTimeToString());
	}
}
