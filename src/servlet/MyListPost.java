package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Notify;
import beans.Post;
import beans.PostDAO;
import util.DBUtils;
import util.GlobalConstants;

/**
 * Servlet implementation class MyListPost
 */
@WebServlet("/MyListPost")
public class MyListPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = null;
		try {
		action = (String)request.getParameter("action");
		if(action == null) {
		String authorId = String.valueOf(request.getSession().getAttribute(GlobalConstants.USER_ID)); 
		ArrayList<Post> listPost = PostDAO.selectPostByUser(authorId);
		ArrayList<Post> listVideo = PostDAO.selectVideoByUser(authorId);
		ArrayList<Post> listBanner = PostDAO.selectBannerByUser(authorId);
		request.getSession().setAttribute("listPost", listPost);
		request.getSession().setAttribute("listVideo", listVideo);
		if (request.getSession().getAttribute("listPayment")==null) {
			request.getSession().removeAttribute("countPayment");
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/listpost.jsp");
	      dispatcher.forward(request, response);
		}
		if(action.equalsIgnoreCase("delete")) {
			request.getSession().removeAttribute("listPost");
			request.getSession().removeAttribute("listVideo");
			try { 
				PostDAO.updatePost(Integer.parseInt(request.getParameter("id")), GlobalConstants.DELETED);
				Post post = PostDAO.selectPostById(request.getParameter("id"));
				Notify.createNotify("Thông báo","<strong><i>"+post.getTitle()+" </i></strong> đã bị xóa trước ngày hết hạn!", "warning","false", request, response);
			}catch(Exception e) {
			}
			response.sendRedirect("/Prince/MyListPost");
		}	
		}catch(Exception e) {
			e.getStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
