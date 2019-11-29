package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Notify;
import beans.Post;
import beans.PostDAO;

/**
 * Servlet implementation class Extend
 */
@WebServlet("/Extend")
public class Extend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Extend() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int isextend = 0;
		String postId = null;
		int edit = -1;
		HttpSession session = request.getSession();
		try {
			postId = request.getParameter("id");
			edit = Integer.parseInt(request.getParameter("edit"));
		} catch (Exception e) {

		}
		// khong phai che do chinh sua
		if (edit == -1) {
			ArrayList<Post> listPayment = null;
			try {
				listPayment = (ArrayList<Post>) request.getSession().getAttribute("listPayment");
			} catch (Exception e) {
			}
			if (listPayment == null) {
				listPayment = new ArrayList<Post>();
			}
			for (Post item : listPayment) {
				if (item.getPost_id() == Integer.parseInt(postId)) {
					// kiem tra va khong them vao listpayment nua
					isextend=1;
					Notify.createNotify("Rất tiếc","quảng cáo đang chờ gia hạn!", "warning","false", request, response);
					RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/classes/listpost.jsp");
					dispatcher.forward(request, response);
				}
			}
			// gia han = false. nghia la bai viet nay chua duoc them vao gia han
			if(isextend==0) {
			Post post = PostDAO.selectPostById(postId);
			post.setExtend(1);
			listPayment.add(post);
			session.setAttribute("countPayment", listPayment.size());
			session.setAttribute("listPayment", listPayment);
			session.setAttribute("extend", "open");
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/classes/listpost.jsp");
				dispatcher.forward(request, response);
			}
			// che do chinh sua
		} else {
			ArrayList<Post> list = (ArrayList<Post>) session.getAttribute("listPayment");
			Post post = new Post();
			for (int i = 0; i < list.size(); i++) {
				if (i == edit) {
					// lay bai viet tu listpayment de chinh sua
					post = PostDAO.selectPostById(String.valueOf(list.get(i).getPost_id()));
				}
			}
			session.setAttribute("post", post);
			session.setAttribute("extend", "open");
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/classes/uppoststep1.jsp");
			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Post post = (Post) request.getSession().getAttribute("post");
		String sDate = request.getParameter("startDate");
		String dDate = request.getParameter("endDate");
		int cost = Integer.parseInt(request.getParameter("inputCost"));
		double cpc = Double.parseDouble(request.getParameter("inputCostPerClick"));
		// lay danh sach bai viet sau
		ArrayList<Post> list = (ArrayList<Post>) request.getSession().getAttribute("listPayment");
		for (int i = 0; i < list.size(); i++) {
			// neu bai viet da edit trung voi bai viet trong listPayment
			if (list.get(i).getPost_id() == (post.getPost_id())) {
				// update
				list.get(i).setCost(cost);
				list.get(i).setCostPerClick(cpc);
				list.get(i).setStartDate(Date.valueOf(sDate));
				list.get(i).setEndDate(Date.valueOf(dDate));
			}
		}
		// cap nhat lai listPayment
		request.getSession().setAttribute("listPayment", list);
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/WEB-INF/classes/uppoststep3.jsp");
		dispatcher.forward(request, response);

	}

}
