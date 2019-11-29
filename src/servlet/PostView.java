package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import beans.Post;
import beans.PostDAO;

/**
 * Servlet implementation class PostView
 */
@WebServlet("/View")
public class PostView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/post.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Post post = PostDAO.selectPostById(id);
		request.getSession(true).setAttribute("view", post);
		
		JsonObject jobj = new JsonObject();
		String urlToRedirect = "/Prince/View";
		jobj.addProperty("url", urlToRedirect);
		response.setContentType("application/json");	
		response.getWriter().write(jobj.toString());
		
	}

}
