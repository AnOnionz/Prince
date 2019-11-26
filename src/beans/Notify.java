package beans;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notify {
	private String title;
    private String message;
    private String type;
    private String html;
	public Notify(String title, String message, String type, String dangerouslyUseHTMLString) {
		super();
		this.title = title;
		this.message = message;
		this.type = type;
		this.html = dangerouslyUseHTMLString;
	}
	public String getHtml() {
		return html;
	}
	public void setHtml() {
		this.html = html;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public static void createNotify(String title, String message, String type,String html, HttpServletRequest request, HttpServletResponse response){
	   	Notify n = new Notify(title, message, type, html);
	   	request.getSession().setAttribute("notify", n);
   }

   
}
