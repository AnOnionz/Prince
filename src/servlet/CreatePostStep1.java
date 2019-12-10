package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import beans.CategoryDAO;
import beans.Notify;
import beans.Post;
import beans.PostDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet({"/CreatePostStep1","/Create"})
public class CreatePostStep1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatePostStep1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String step = null;
		try {
		//xoa che do gia han;
		step = request.getParameter("step");
		String stepcompleted = String.valueOf(request.getSession().getAttribute("stepcompleted"));
		if(request.getSession().getAttribute("extend")!=null) {
			Post post = (Post) request.getSession().getAttribute("post");
		}else {
		Post post = new Post();
		post = (Post) request.getSession().getAttribute("post");
		}
		
			switch (step) {
			case "1":
				Notify.createNotify("Lưu ý","nhấn <i class=\"fas fa-window-close\" style=\"color: red;\"></i> nếu muốn hủy quảng cáo!", "warning","true", request, response);				request.getSession().removeAttribute("extend");
				if((Post)request.getSession().getAttribute("post")==null) {
					request.getSession().setAttribute("stepcompleted", 0);
					RequestDispatcher dispatcher1 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
					dispatcher1.forward(request, response);
					break;
				}
				switch (stepcompleted) {
				case "1":
					RequestDispatcher dispatcher2 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep2.jsp");
					dispatcher2.forward(request, response);
					break;
				case "2":
					RequestDispatcher dispatcher3 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
					dispatcher3.forward(request, response);
					break;
				default:
					RequestDispatcher dispatcher4 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
					dispatcher4.forward(request, response);
					break;
				}
			case "2":
				if((Post)request.getSession().getAttribute("post")==null) {
					request.getSession().setAttribute("stepcompleted", 0);
				
					Notify.createNotify("Quá lâu rồi","hãy bắt đầu lại!", "warning","false", request, response);
					RequestDispatcher dispatcher5 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
					dispatcher5.forward(request, response);
					break;
				}
				switch (stepcompleted) {
				case "1":
					Notify.createNotify("Lưu ý","nhấn <i class=\"fas fa-window-close\" style=\"color: red;\"></i> nếu muốn hủy quảng cáo!", "warning","true", request, response);			
					RequestDispatcher dispatcher6 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep2.jsp");
					dispatcher6.forward(request, response);
					break;
				case "2":
					RequestDispatcher dispatcher7 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep3.jsp");
					dispatcher7.forward(request, response);
					break;
				default:
					if(request.getSession().getAttribute("extend")=="open") {
						RequestDispatcher dispatcher8 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep3.jsp");
						dispatcher8.forward(request, response);
						break;
					}else {
						Notify.createNotify("Lưu ý","nhấn <i class=\"fas fa-window-close\" style=\"color: red;\"></i> nếu muốn hủy quảng cáo!", "warning","true", request, response);
					RequestDispatcher dispatcher9 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
					dispatcher9.forward(request, response);
					break;
					}
				}
				break;
			case "3":
				
					RequestDispatcher dispatcher10 = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep3.jsp");
					dispatcher10.forward(request, response);
					break;
			case "cancle":
				request.getSession().removeAttribute("stepcompleted");
				Notify.createNotify("Tiếc thật","tạo quảng cáo không thành công!", "warning","true", request, response);
				response.sendRedirect("/Prince/Home");
				break;
			default:
				response.sendRedirect("/Prince/Create?step=1");
			
				break;
			}
//			if(step.equalsIgnoreCase("1") && stepcompleted == "0") {
//			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
//			dispatcher.forward(request, response);
//			}if(step.equalsIgnoreCase("2")&& (stepcompleted) == "1") {
//			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep2.jsp");
//			dispatcher.forward(request, response);
//			}if(step.equalsIgnoreCase("3")&& (stepcompleted) == "2") {
//				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/uppoststep3.jsp");
//				dispatcher.forward(request, response);
//			
//			}
//		}else {
//			response.sendError(404);
		
		}catch(Exception e) {
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			session.removeAttribute("post");
			Post post = new Post();
			int categoryId = Integer.parseInt(request.getParameter("category"));
			String sDate = request.getParameter("startDate");
			String dDate = request.getParameter("endDate");
			int format = Integer.parseInt(request.getParameter("gridRadios"));
			int cost = Integer.parseInt(request.getParameter("inputCost"));
			double cpc = Double.parseDouble(request.getParameter("inputCostPerClick"));
			int author_id = (int) request.getSession().getAttribute(GlobalConstants.USER_ID);
			post.setStatus(GlobalConstants.ACTIVE);
			post.setCategory_id(categoryId);
			post.setAuthor_id(author_id);
			post.setStartDate(Date.valueOf(sDate));
			post.setEndDate(Date.valueOf(dDate));
			post.setCost(cost);
			post.setCostPerClick(cpc);
			post.setFormat(format);
			post.setClick(0);
			post.setCreated_time(Timestamp.valueOf(LocalDateTime.now()));
			try {
				post.setScore(post.costPerClick());
			} catch (Exception e) {
				
				e.printStackTrace();
			}	
			session.setAttribute("post", post);
			session.setAttribute("stepcompleted", 1);
			session.setMaxInactiveInterval(60*60*24);
			response.sendRedirect("/Prince/Create?step=2");
			
	}
	
}
