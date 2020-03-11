package servlet;

import static util.SampleConstants.clientID;
import static util.SampleConstants.clientSecret;
import static util.SampleConstants.mode;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.paypal.api.payments.Currency;
import com.paypal.api.payments.Payout;
import com.paypal.api.payments.PayoutBatch;
import com.paypal.api.payments.PayoutItem;
import com.paypal.api.payments.PayoutSenderBatchHeader;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import beans.Transaction;
import beans.TransactionDAO;
import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;
import util.ResultPrinter;

/**
 * Servlet implementation class RedeemPointsServlet
 */
@WebServlet("/RedeemPointsServlet")
public class RedeemPointsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(RedeemPointsServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RedeemPointsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get redeem points
		
		String emailNguoiNhan = request.getParameter("sandboxaccount");
		System.out.println(emailNguoiNhan);
		int sodiem = Integer.parseInt(request.getParameter("index"));
		System.out.println(sodiem);
		 DecimalFormat format = new DecimalFormat("#.##");
		String sotien = format.format((sodiem * 100)/23220);

		// get user
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		UserAccount ua = UserDAO.selectUserById(userId);

		int score = ua.getSCORE();
		if (score < sodiem) {
			String lw_error = "RẤT TIẾC BẠN KHÔNG ĐỦ ĐIỂM";
			request.setAttribute("lw_err", lw_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/classes/redeempoints.jsp");
			rd.forward(request, response);
		} else {
			System.out.println("hohoooooooooooooooooooooooooooooooooooo");

			UserAccount user = UserDAO.updateScore(userId, score -= sodiem);
			// tao lich su giao dich
			Transaction tran = new Transaction();
			tran.setTransaction_name("Đổi "+sodiem+" điểm thành "+sotien+" $");
			tran.setScore(sodiem);
			tran.setUser_id((int) request.getSession().getAttribute(GlobalConstants.USER_ID));
			tran.setStatus(GlobalConstants.SUCCESS);
			tran.setCreate_time(Timestamp.valueOf(LocalDateTime.now()));
			TransactionDAO.insertRow(tran);
			//
			System.out.println("sssssssssssssssssss" + user.getSCORE());
			HttpSession session = request.getSession();
			session.setAttribute("score", user.getSCORE());
			createBatchPayout(request, response, emailNguoiNhan, sotien);

			ServletContext context = getServletContext();
			RequestDispatcher rd;

			String lw_error = "THANH TOÁN THÀNH CÔNG, HÃY KIỂM TRA TÀI KHOẢN CỦA BẠN!";
			request.setAttribute("lw_err", lw_error);
			rd = context.getRequestDispatcher("/WEB-INF/classes/home.jsp");
			rd.forward(request, response);

		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public PayoutBatch createBatchPayout(HttpServletRequest req, HttpServletResponse resp, String emailNguoiNhan,
			String soTien) {
		String a = "sb-xcf3f792452@business.example.com";
		String emailReceiver = emailNguoiNhan;
		String money = soTien;
		Payout payout = new Payout();

		PayoutSenderBatchHeader senderBatchHeader = new PayoutSenderBatchHeader();

		Random random = new Random();
		senderBatchHeader.setSenderBatchId(new Double(random.nextDouble()).toString())
				.setEmailSubject("You have a Payment!");

		Currency amount1 = new Currency();
		amount1.setValue(money).setCurrency("USD");

		PayoutItem senderItem1 = new PayoutItem();
		senderItem1.setRecipientType("Email").setNote("Thanks for your patronage").setReceiver(emailReceiver)
				.setSenderItemId("201404324234").setAmount(amount1);
		List<PayoutItem> items = new ArrayList<PayoutItem>();
		items.add(senderItem1);

		payout.setSenderBatchHeader(senderBatchHeader).setItems(items);

		PayoutBatch batch = null;

		try {
			APIContext apiContext = new APIContext(clientID, clientSecret, mode);
			batch = payout.create(apiContext, new HashMap<String, String>());
			System.out.println(batch);
			LOGGER.info("Payout Batch With ID: " + batch.getBatchHeader().getPayoutBatchId());
			ResultPrinter.addResult(req, resp, "Payout Batch Create", Payout.getLastRequest(), Payout.getLastResponse(),
					null);
		} catch (PayPalRESTException e) {
			ResultPrinter.addResult(req, resp, "Payout Batch Create", Payout.getLastRequest(), null, e.getMessage());
		}

		return batch;
	}
}
