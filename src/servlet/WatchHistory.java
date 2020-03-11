package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.websocket.Session;

import beans.Post;
import beans.PostDAO;
import beans.UserDAO;
import beans.WatchHistoryDAO;

/**
 * Servlet implementation class WatchHistory
 */
@WebServlet("/WatchHistory")
public class WatchHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WatchHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//update click
		int postId = Integer.parseInt(request.getParameter("postId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		int score = Integer.parseInt(request.getParameter("score"));
		WatchHistoryDAO.updateClick(userId, postId);
		if(!WatchHistoryDAO.maxWatchHistory()) {
			request.getSession().setAttribute("maxview", "yes");
		}else {
			UserDAO.updateScore(userId,UserDAO.selectUserById(userId).getSCORE()+score);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//update voted, watched
		int postId = Integer.parseInt(request.getParameter("postId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		WatchHistoryDAO.updateVote(userId, postId);
		Post post = PostDAO.selectPostById(String.valueOf(postId));
		post.setVote(post.getVote()+1);
		PostDAO.updatePostWatched(post);
		
	}

}
