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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = (String) request.getSession().getAttribute(GlobalConstants.USER);
    	if(userId != null) {
    		request.getRequestDispatcher("/index.jsp").forward(request, response);	
    	} else {
    		request.getRequestDispatcher("/login.jsp").forward(request, response);	
    	}
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String inputEmail = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword");
		String inputPassword = BCrypt.hashpw(password, GlobalConstants.SALT);
		try {
			UserAccount up = UserDAO.verifyLogin(inputEmail, inputPassword);
			if(up != null && up.getUSER_ID() != 0) {
				if(up.getSTATUS() == (GlobalConstants.ACTIVE) || up.getSTATUS() == (GlobalConstants.IN_RESET_PASSWORD)) {
					request.getSession().setAttribute(GlobalConstants.USER, up.getUSER_ID());
					request.getSession().setAttribute(GlobalConstants.USER_NAME, up.getUSERNAME());
					request.getRequestDispatcher("/index.jsp").forward(request, response);	
				} else {
					if(up.getSTATUS()==(GlobalConstants.NEW)){
						request.setAttribute(GlobalConstants.MESSAGE, "Tài khoản đang trong quá trình xác thực </br> <a href=\"login.jsp\"> quay lại</a>");
						request.getRequestDispatcher("/messagetouser.jsp").forward(request, response);
				}	
				}
			}else {
				request.setAttribute(GlobalConstants.ERROR, "Email hoặc mật khẩu không chính xác");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			response.sendError(404);
			
		}
		
	}

}
