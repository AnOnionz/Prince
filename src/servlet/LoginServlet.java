package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserAccount;
import beans.UserDAO;

import util.BCrypt;
import util.DBUtils;
import util.GlobalConstants;
import util.Utils;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = null;
		try {
			userId = (String) request.getSession().getAttribute(GlobalConstants.USER_ID);

		} catch (Exception e) {
			e.getStackTrace();
		}
		if (userId != null) {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/home.jsp");
		} else {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String inputEmail = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword");
		String inputPassword = BCrypt.hashpw(password, GlobalConstants.SALT);
	
		try {
			
			UserAccount up = UserDAO.verifyLogin(inputEmail, inputPassword);
			if (up != null && up.getUSER_ID() != 0) {
				if (up.getSTATUS() == (GlobalConstants.ACTIVE)) {
					String identify = Utils.prepareRandomString(40);
					UserDAO.updateIdentify(String.valueOf(up.getUSER_ID()), identify);
					DBUtils.storeUserCookie(request, response, identify);
					// khoi tao cookie identify
					request.getSession().setAttribute("valueLogin", 0);
					response.sendRedirect("/Prince/Home");
				
				} else {
					if (up.getSTATUS() == (GlobalConstants.NEW)) {
						request.setAttribute(GlobalConstants.MESSAGE,
								"Tài khoản đang trong quá trình xác thực </br> <a href=\"javascript:history.back()\"> quay lại</a>");
						request.getRequestDispatcher("/WEB-INF/classes/messagetouser.jsp").forward(request, response);
					}
				}
			} else {
				request.setAttribute(GlobalConstants.ERROR, "Email hoặc mật khẩu không chính xác");
				request.getRequestDispatcher("/WEB-INF/classes/login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			response.sendError(404);

		}

	}

}
