package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");

    	Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
    	if(userId != null) {
    		request.getRequestDispatcher("/WEB-INF/classes/changePassword.jsp").forward(request, response);	
    	} else {
    		String message = "nhấn vào <a href=\"/Prince/Login\">đây</a> để đăng nhập";
    		request.setAttribute(GlobalConstants.MESSAGE, message);
			request.getRequestDispatcher("/WEB-INF/classes/messagetouser.jsp").forward(request, response);
    	}
    }
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");

		String inputCurrentPassword = null;
		if(request.getParameter("inputCurrentPassword")!=null) {
			inputCurrentPassword = BCrypt.hashpw(request.getParameter("inputCurrentPassword").trim(), GlobalConstants.SALT);	
		};
		String inputPassword = null;
		if(request.getParameter("inputPassword")!=null) {
			inputPassword = BCrypt.hashpw(request.getParameter("inputPassword").trim(), GlobalConstants.SALT);	
		};
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		String isResetPasswordVerified = (String) request.getSession().getAttribute(GlobalConstants.IS_RESET_PASSWORD_VERIFIED);
		
		try {
			if(userId!=null && inputCurrentPassword != null) {
				if(UserDAO.verifyUserIdAndPassword(userId.toString(), inputCurrentPassword)) {
					UserDAO.updatePassword(userId.toString(), inputPassword);
					request.setAttribute(GlobalConstants.MESSAGE, "Mật khẩu đã thay đổi thành công </br>Nhấp vào <a href=\"/Prince/Login\">đây</a> để đăng nhập");
					RequestDispatcher dispatcher = this.getServletContext()
							.getRequestDispatcher("/WEB-INF/classes/messagetouser.jsp");
					dispatcher.forward(request, response);
				} else {
					request.setAttribute(GlobalConstants.ERROR, "Sai mật khẩu, vui lòng nhập lại!");
					RequestDispatcher dispatcher = this.getServletContext()
							.getRequestDispatcher("/WEB-INF/classes/changepassword.jsp");
					dispatcher.forward(request, response);
				
				}	
			} else if(userId!=null && isResetPasswordVerified != null) {
				UserDAO.updatePassword(userId.toString(), inputPassword);
				request.setAttribute(GlobalConstants.MESSAGE, "Mật khẩu đã thay đổi thành công</br>Nhấp vào <a href=\"/Prince/Login\">đây</a> để đăng nhập");
				RequestDispatcher dispatcher = this.getServletContext()
						.getRequestDispatcher("/WEB-INF/classes/messagetouser.jsp");
				dispatcher.forward(request, response);
				
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}

}
