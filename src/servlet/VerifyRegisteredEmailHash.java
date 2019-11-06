package servlet;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserAccount;
import  beans.UserDAO;

import  util.BCrypt;
import  util.GlobalConstants;
import  util.Utils;
import util.MailUtil;

/**
 * Servlet implementation class VerifyRegisteredEmailHash
 */
@WebServlet("/VerifyRegisteredEmailHash")
public class VerifyRegisteredEmailHash extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyRegisteredEmailHash() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get user Id and email verification code Hash code  
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		String hash = BCrypt.hashpw(request.getParameter("hash"), GlobalConstants.SALT);
		int scope = Integer.parseInt(request.getParameter("scope"));
		String message = null;
		try {
			// verify with database
			if(UserDAO.verifyEmailHash(userId.toString(), hash) && scope == GlobalConstants.ACTIVATION) {
			   //update status as active
			   UserDAO.updateStatus(userId.toString(), GlobalConstants.ACTIVE);
			   UserDAO.updateEmailVerificationHash(userId.toString(), null);
			   message = "Chúc mừng, bạn đã xác thực email hoàn tất. nhấp vào <a href=\"login.jsp\">đây</a> để đăng nhập";
			} else if(UserDAO.verifyEmailHash(userId.toString(), hash) && scope == GlobalConstants.RESET_PASSWORD) {
			   //update status as active
			   UserDAO.updateStatus(userId.toString(), 1);
			   UserDAO.updateEmailVerificationHash(userId.toString(), null);
			   //put some session for user
			   request.getSession().setAttribute("user", userId);
			   request.getSession().setAttribute("isResetPasswordVerified", "yes");
			   request.getRequestDispatcher("/resetpassword.jsp").forward(request, response);	
			} else {
			   //now increment verification attempts 
			   int attempts = UserDAO.incrementVerificationAttempts(userId.toString());
			   if(attempts == 20) {
				   // reset verification code if attempts equal to 20 
				   String hashcode = Utils.prepareRandomString(30);
				   UserDAO.updateEmailVerificationHash(userId.toString(), BCrypt.hashpw(hashcode, GlobalConstants.SALT));
				   UserAccount up = UserDAO.selectUSER(userId.toString());
				   MailUtil.sendEmailRegistrationLink(userId.toString(), up.getEMAIL(), hashcode);
				   message = "Bạn đã nhập quá 20 lần,chúng tôi cũng đã gửi Email xác thực mới cho bạn!";
			   } 
			}
		 
		} catch (Exception e) {
			message = e.getMessage();
			e.getMessage();
		}
		if(message!=null) {
			request.setAttribute(GlobalConstants.MESSAGE, message);
			request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);	
		} 
	}

}