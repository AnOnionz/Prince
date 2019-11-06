package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import  util.MailUtil;
import beans.UserAccount;
import  beans.UserDAO;

import  util.BCrypt;
import  util.GlobalConstants;
import  util.Utils;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ForgotPassword() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		String inputEmail = request.getParameter("inputEmail");
		
		try {
			UserAccount up = UserDAO.selectUSERbyEmail(inputEmail); 
			if(up!=null) {
				String hash = Utils.prepareRandomString(30);
				UserDAO.updateEmailVerificationHashForResetPassword(inputEmail, BCrypt.hashpw(hash,GlobalConstants.SALT));
				MailUtil.sendResetPasswordLink(up.getUSER_ID()+"", inputEmail, hash);
				request.setAttribute(GlobalConstants.MESSAGE, "Yêu cầu của bạn được chấp nhận.Chúng tôi đã gửi Email cho bạn!");
				request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);
			} else {
				request.setAttribute(GlobalConstants.ERROR, "Tài khoản không tồn tại");
				request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
			}
		} catch (Exception e) {
			
		}
		
	}

}
