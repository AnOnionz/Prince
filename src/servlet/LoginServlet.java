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

import beans.Notify;
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
		String identify = null;
		String requestUri = null;
		try {
			 identify = DBUtils.getCookie(request, "identify");
			 requestUri = (String) request.getSession().getAttribute("requestUri");
		}catch(Exception e) {
			e.getStackTrace();
		}
		request.getSession().setAttribute("valueLogin", 0);
		if(UserDAO.verifyIdentify(identify)) {
    		UserAccount user = UserDAO.selectUSER(identify);
    		HttpSession session = request.getSession();
			session.setAttribute("valueLogin", (int)session.getAttribute("valueLogin")+1);
			if((int)session.getAttribute("valueLogin") == 1) {
			Notify.createNotify("Đăng nhập thành công","chào mừng bạn đến với Prince", "success", "false",request, response);
			}
			if(requestUri==null) {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Home");
			dispatcher.forward(request, response);
			}else {
			response.sendRedirect(requestUri);
			}
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
		String inputEmail = request.getParameter("inputEmail").trim();;
		String password = request.getParameter("inputPassword").trim();;
		String inputPassword = BCrypt.hashpw(password, GlobalConstants.SALT);
	
		try {
			UserAccount up = UserDAO.verifyLogin(inputEmail, inputPassword);
			if (up != null && up.getUSER_ID() != 0) {
				if (up.getSTATUS() == (GlobalConstants.ACTIVE)) {
					// khoi tao cookie identify
					String identify = Utils.prepareRandomString(40);
					UserDAO.updateIdentify(String.valueOf(up.getUSER_ID()), identify);
					DBUtils.storeUserCookie(request, response, identify);
					HttpSession session = request.getSession(true);		
					session.setAttribute(GlobalConstants.USER_ID, up.getUSER_ID());
					session.setAttribute(GlobalConstants.USER_NAME, up.getUSERNAME());
					session.setAttribute("user", up);	
					session.setAttribute("valueLogin",(int)session.getAttribute("valueLogin")+1);
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
