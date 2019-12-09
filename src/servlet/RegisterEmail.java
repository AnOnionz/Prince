package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
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
import  util.MailUtil;

/**
 * Servlet implementation class RegisterEmail
 */
@WebServlet("/RegisterEmail")
public class RegisterEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterEmail() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("inputUserName").trim();;
		String email = request.getParameter("inputEmail").trim();;
		String password = request.getParameter("inputPassword").trim();;
			UserAccount up = new UserAccount();
			up.setUSERNAME(userName);
			up.setEMAIL(email);
			up.setCREATED_TIME(Timestamp.valueOf(LocalDateTime.now()));
			up.setCODE(Utils.prepareRandomString(30));
			up.setSCORE(0);
			up.setROLE_ID(GlobalConstants.BASIC_USER);
			up.setSTATUS(GlobalConstants.NEW);
			up.setAVATAR("assets/images/user/avartar.png");
			// generate hash for password
			up.setPASSWORD(BCrypt.hashpw(password,GlobalConstants.SALT));
			
			// generate hash code for email verification
			String hash = Utils.prepareRandomString(30);
			
			// generate hash for password
			up.setEMAIL_VERIFICATION_HASH(BCrypt.hashpw(hash, GlobalConstants.SALT));
		    	// check whether email exists or not
		    	if(!UserDAO.isEmailExists(email)) {
		    		if(!UserDAO.isUserNameExists(userName)) {
		    		// create account if email not exists
		    		try {
		    		String id = UserDAO.insertRow(up);
		    		MailUtil.sendEmailRegistrationLink(id, email, hash);
		    		request.setAttribute(GlobalConstants.MESSAGE, "đăng ký hoàn tất, vui lòng kiểm tra Email của bạn");
					request.getRequestDispatcher("/WEB-INF/classes/messagetouser.jsp").forward(request, response);	
		    		}catch(Exception e){
		    			e.getMessage();
		    		}

		    	}else {
		    		request.setAttribute(GlobalConstants.ERROR, "Tên tài khoản đã được sử dụng");
		    		request.setAttribute("email",email);
					request.getRequestDispatcher("/WEB-INF/classes/register.jsp").forward(request, response);	
		    	}
		    		}else {
		    		// tell user that the email already in use
		    		request.setAttribute(GlobalConstants.ERROR, "Email đã được sử dụng");
		    		request.setAttribute("username",userName);
		    		request.getRequestDispatcher("/WEB-INF/classes/register.jsp").forward(request, response);
		    	
		    	}
				
			
		    	
	}
	   
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}