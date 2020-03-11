package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class userDeal
 */
@WebServlet("/userDeal")
public class userDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userDeal() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			int authorId = (int) request.getSession().getAttribute(GlobalConstants.USER_ID);
			UserAccount user = UserDAO.selectUserById(authorId);

			request.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/classes/userDeal.jsp").forward(request, response);

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
