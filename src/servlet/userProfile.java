package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Transaction;
import beans.TransactionDAO;
import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class userProfile
 */
@WebServlet("/userProfile")
public class userProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			int authorId = (int) request.getSession().getAttribute(GlobalConstants.USER_ID);
			UserAccount user = UserDAO.selectUserById(authorId);

			request.setAttribute("user", user);
			
			ArrayList<Transaction> listTran = TransactionDAO.getListTransaction((int) request.getSession().getAttribute(GlobalConstants.USER_ID));
			request.getSession().setAttribute("listTran", listTran );
			
			request.getRequestDispatcher("/WEB-INF/classes/userprofile.jsp").forward(request, response);

		} catch (Exception e) {
			e.getStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
