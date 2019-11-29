package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import beans.UserAccount;
import beans.UserDAO;

public class MailUtil {

	public static void sendEmailRegistrationLink(String id, String email, String hash) throws AddressException, MessagingException {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", Setup.MAIL_SMTP_HOST);
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD);
			}
		  });

		String link = Setup.MAIL_REGISTRATION_SITE_LINK+"?scope=4&userId="+id+"&hash="+hash;
		UserAccount user = UserDAO.selectUSERbyEmail(email);
		  StringBuilder bodyText = new StringBuilder(); 
			bodyText.append("<div>")
			     .append("  Chào "+user.getUSERNAME()+" <br/><br/>")
			     .append("  Rất vui khi bạn đã đăng kí tài khoản. Email của bạn ("+email+") đã được xác thực<br/>")
			     .append("  Vui lòng nhấn vào <a href=\""+link+"\">đây</a> hoặc mở liên kết bên dưới trên trình duyệt<br/>")
			     .append("  <a href=\""+link+"\">"+link+"</a>")
			     .append("  <br/><br/>")
			     .append("  Cảm ơn,<br/>")
			     .append("  Đội ngũ Prince")
			     .append("</div>");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(email));
			message.setSubject("Email Registion");
			message.setContent(bodyText.toString(), "text/html; charset=utf-8");
			Transport.send(message);
	}

	public static void sendResetPasswordLink(String id, String email, String hash) throws AddressException, MessagingException {

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", Setup.MAIL_SMTP_HOST);
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD);
			}
		  });

		String link = Setup.MAIL_REGISTRATION_SITE_LINK+"?scope=3&userId="+id+"&hash="+hash;
		UserAccount user = UserDAO.selectUSERbyEmail(email);
		  StringBuilder bodyText = new StringBuilder(); 
			bodyText.append("<div>")
			     .append("  Chào "+user.getUSERNAME()+" <br/><br/>")
			     .append("  Yêu cầu đổi mật khẩu của bạn đã được tiếp nhận, đường dẫn bên dưới sẽ dẫn bạn đến trang đổi mật khẩu<br/>")
			     .append("  Vui lòng nhấp vào <a href=\""+link+"\">đây</a> hoặc mở liên kết bên dưới trên trình duyệt<br/>")
			     .append("  <a href=\""+link+"\">"+link+"</a>")
			     .append("  <br/><br/>")
			     .append("  Cảm ơn,<br/>")
			     .append("  Đội ngũ Prince")
			     .append("</div>");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(email));
			message.setSubject("Reset Password");
			message.setContent(bodyText.toString(), "text/html; charset=utf-8");
			Transport.send(message);
	}
	
}
