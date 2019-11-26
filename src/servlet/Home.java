package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Notify;
import beans.UserAccount;
import beans.UserDAO;
import util.DBUtils;
import util.GlobalConstants;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String identify = DBUtils.getCookie(request, "identify");
    	if(UserDAO.verifyIdentify(identify)) {
    		UserAccount user = UserDAO.selectUSER(identify);
    		HttpSession session = request.getSession();
			session.setAttribute(GlobalConstants.USER_ID, user.getUSER_ID());
			session.setAttribute(GlobalConstants.USER_NAME, user.getUSERNAME());
			session.setAttribute("user", user);
			session.setAttribute("valueLogin", (int)session.getAttribute("valueLogin")+1);
			if((int)session.getAttribute("valueLogin") == 1) {
			Notify.createNotify("Đăng nhập thành công","chào mừng bạn đến với Prince", "success", "false",request, response);
			}
    		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/home.jsp");
 	       dispatcher.forward(request, response);
			
			
    	}else {
    		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Login");
  	       dispatcher.forward(request, response);
    	}
		}catch (Exception e){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Login");
	 	       dispatcher.forward(request, response);
		}
    	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
