package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LuckyWheelDAO;
import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class LuckyWheelHandling
 */
@WebServlet("/LuckyWheelHandling")
public class LuckyWheelHandling extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LuckyWheelHandling() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get day click
		int index = Integer.parseInt(request.getParameter("index"));

		// get user
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		UserAccount ua = UserDAO.selectUserById(userId);

		int score = ua.getSCORE();
		ServletContext context = getServletContext();
		RequestDispatcher rd;
		UserDAO.updateScore(userId, score+=index);
		LuckyWheelDAO.updateDateLuckyWheel(userId);
		rd = context.getRequestDispatcher("/WEB-INF/classes/home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
