package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");

    	Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER);
    	if(userId != null) {
    		request.getRequestDispatcher("/changePassword.jsp").forward(request, response);	
    	} else {
    		String message = "nhấn vào <a href=\"login.jsp\">đây</a> để đăng nhập";
    		request.setAttribute(GlobalConstants.MESSAGE, message);
			request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);
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
			inputCurrentPassword = BCrypt.hashpw(request.getParameter("inputCurrentPassword"), GlobalConstants.SALT);	
		};
		String inputPassword = null;
		if(request.getParameter("inputPassword")!=null) {
			inputPassword = BCrypt.hashpw(request.getParameter("inputPassword"), GlobalConstants.SALT);	
		};
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER);
		String isResetPasswordVerified = (String) request.getSession().getAttribute(GlobalConstants.IS_RESET_PASSWORD_VERIFIED);
		
		try {
			if(userId!=null && inputCurrentPassword != null) {
				if(UserDAO.verifyUserIdAndPassword(userId.toString(), inputCurrentPassword)) {
					UserDAO.updatePassword(userId.toString(), inputPassword);
					request.setAttribute(GlobalConstants.MESSAGE, "Mật khẩu đã thay đổi thành công.Nhấp vào <a href=\"login.jsp\">đây</a> để đăng nhập");
					request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);
				} else {
					request.setAttribute(GlobalConstants.ERROR, "Sai mật khẩu, vui lòng nhập lại!");
					request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
				}	
			} else if(userId!=null && isResetPasswordVerified != null) {
				UserDAO.updatePassword(userId.toString(), inputPassword);
				request.setAttribute(GlobalConstants.MESSAGE, "Mật khẩu đã thay đổi thành công.Nhấp vào <a href=\"login.jsp\">đây</a> để đăng nhập");
				request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}

}
