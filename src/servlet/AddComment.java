package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Comment;
import beans.CommentDAO;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/Comment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("delId"));
		CommentDAO.deleteCMT(id);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String content = null; // noi dung cmt
		int postId = 0;    // id bai viet chua cmt
		int userId = 0;   // id nguoi cmt
		int rootId = 0;  // id cmt goc
		int replyId = 0; //id cmt dang tra loi
		
		try {
			content = request.getParameter("content");
			postId = Integer.parseInt(request.getParameter("postId"));
			userId = Integer.parseInt(request.getParameter("userId"));
			rootId = Integer.parseInt(request.getParameter("rootId"));
			replyId = Integer.parseInt(request.getParameter("replyId"));
			
		} catch (Exception e) {

		}
		Comment cmt = new Comment();
		cmt.setContent(content);
		cmt.setPost_id(postId);
		cmt.setCreate_time(Timestamp.valueOf(LocalDateTime.now()));
		cmt.setUser_id(userId);
		cmt.setRoot_id(rootId);
		cmt.setReply_id(replyId);
		if(cmt.getRoot_id()!=0) {
			CommentDAO.insertSubCmt(cmt);
		}else {
		CommentDAO.insertCmt(cmt);
		}
		ArrayList parentCmt = CommentDAO.selectParentComment(String.valueOf(postId));
		request.getSession().setAttribute("listCMT", parentCmt);
		
		
	}

}
