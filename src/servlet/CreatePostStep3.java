package servlet;

import static util.SampleConstants.clientID;
import static util.SampleConstants.clientSecret;
import static util.SampleConstants.mode;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import beans.Notify;
import beans.Post;
import beans.PostDAO;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class CreatePostStep3
 */
@WebServlet("/Payment")
public class CreatePostStep3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	// ##Create
	// Sample showing to create a Payment using PayPal
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			createPayment(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Notify.createNotify("Thanh toán thành công","chuyển đến danh sách quảng cáo của bạn", "success","false", req, resp);
		resp.sendRedirect("/Prince/MyListPost");
	}
	public Payment createPayment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Payment createdPayment = null;
		ArrayList<Post> listPayment = (ArrayList<Post>) req.getSession().getAttribute("listPayment");
		APIContext apiContext = new APIContext(clientID, clientSecret, mode);
		if (req.getParameter("PayerID") != null) {
			Payment payment = new Payment();
			payment.setId(req.getParameter("paymentId"));
			PaymentExecution paymentExecution = new PaymentExecution();
			paymentExecution.setPayerId(req.getParameter("PayerID"));
			try {
				createdPayment = payment.execute(apiContext, paymentExecution);
				req.getSession().setAttribute("stepcompleted", 0);
				for(Post post:listPayment) {
					if(post.getExtend()!=0) {
						PostDAO.updatePost(post, GlobalConstants.ACTIVE);
					}else {
						if(post.getFormat() == 1) {
							PostDAO.insertOption1(post);
						}else {
							if(post.getFormat() == 2) {
							PostDAO.insertOption2(post);
							}
						}
					}
				}
				UserDAO.updateRole(String.valueOf(req.getSession().getAttribute(GlobalConstants.USER_ID)),GlobalConstants.CREATER);
				req.getSession().removeAttribute("listPayment");
				req.getSession().removeAttribute("countPayment");
			} catch (PayPalRESTException e) {
				
			}
		} else {
		}
		return createdPayment;
	}

}
