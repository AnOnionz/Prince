package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import beans.CommentDAO;
import beans.Post;
import beans.PostDAO;
import beans.WatchHistoryDAO;
import util.GlobalConstants;

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
		String location = null;
		
		
		try {
		Post view = (Post) request.getSession().getAttribute("view");
		location = (String) request.getSession().getAttribute("location");
		
		String id = String.valueOf(view.getPost_id());
		Post post = PostDAO.selectPostById(id);
		post.setVisiter(post.getVisiter()+1);
		PostDAO.updatePostWatched(post);
		int userId = (int) request.getSession().getAttribute(GlobalConstants.USER_ID);
		if(location !=null ){
		try {
		WatchHistoryDAO.insertRow(userId, Integer.parseInt(id), 0, 0);
		}catch(Exception e) {
		}
		}
		ArrayList parentCmt = CommentDAO.selectParentComment(id);
		request.getSession().setAttribute("listCMT", parentCmt);
		request.getSession().setAttribute("view", post);
		if(WatchHistoryDAO.maxWatchHistory()==false) {
			request.getSession().setAttribute("maxview", "yes");
		}
		}catch(Exception e) {
			
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/post.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String location = null;
		String id = request.getParameter("id");
		try {
			location = request.getParameter("location");
		}catch(Exception e) {
			
		}
		Post post = PostDAO.selectPostById(id);
		ArrayList parentCmt = CommentDAO.selectParentComment(id);
		request.getSession().setAttribute("listCMT", parentCmt);
		request.getSession().setAttribute("view", post);
		request.getSession().setAttribute("location", location);
		request.getSession().setAttribute("valuecmt", CommentDAO.countComment((int) request.getSession().getAttribute(GlobalConstants.USER_ID)));
		JsonObject jobj = new JsonObject();
		String urlToRedirect ="/Prince/View"; //call doget()
		jobj.addProperty("url", urlToRedirect);
		response.setContentType("application/json");
		response.getWriter().write(jobj.toString());
		
	}

}
