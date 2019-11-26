package servlet;

import static util.SampleConstants.clientID;
import static util.SampleConstants.clientSecret;
import static util.SampleConstants.mode;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import beans.Post;

/**
 * Servlet implementation class CreatePayment
 */
@WebServlet("/CreatePayment")
public class CreatePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Post> listPayment = (ArrayList<Post>) request.getSession().getAttribute("listPayment");
		try {
			createPayment(request, response, listPayment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect((String) request.getSession().getAttribute("redirectURL"));
	}
	public Payment createPayment(HttpServletRequest request, HttpServletResponse response, ArrayList<Post> listPost)
			throws Exception {
		Payment createdPayment = null;
		APIContext apiContext = new APIContext(clientID, clientSecret, mode);
		Transaction transaction = new Transaction();
		double sum = 0;
		// ### Items
		List<Item> items = new ArrayList<Item>();
		ItemList itemList = new ItemList();
		for (Post onePost : listPost) {
			Item item = new Item();
			
			item.setName(onePost.getTitle()).setQuantity("1").setCurrency("USD").setPrice(""+onePost.getCost());
			sum+=onePost.getCost();
			items.add(item);
		}
		itemList.setItems(items);
		transaction.setItemList(itemList);

		// ###Details
		// Let's you specify details of a payment amount.
		Details details = new Details();
		details.setSubtotal(""+sum);

		// ###Amount
		// Let's you specify a payment amount.
		Amount amount = new Amount();
		amount.setCurrency("USD");
		// Total must be equal to sum of shipping, tax and subtotal.
		// amount.setTotal(String.valueOf(post.getCost()));
		amount.setTotal(""+sum);
		amount.setDetails(details);

		// ###Transaction
		// A transaction defines the contract of a
		// payment - what is the payment for and who
		// is fulfilling it. Transaction is created with
		// a `Payee` and `Amount` types

		transaction.setAmount(amount);
		transaction.setDescription("This is the payment transaction description.");

		// The Payment creation API requires a list of
		// Transaction; add the created `Transaction`
		// to a List
		List<Transaction> transactions = new ArrayList<Transaction>();
		transactions.add(transaction);

		// ###Payer
		// A resource representing a Payer that funds a payment
		// Payment Method
		// as 'paypal'
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		// ###Payment
		// A Payment Resource; create one using
		// the above types and intent as 'sale'
		Payment payment = new Payment();
		payment.setIntent("sale");
		payment.setPayer(payer);
		payment.setTransactions(transactions);

		// ###Redirect URLs
		RedirectUrls redirectUrls = new RedirectUrls();
		String guid = UUID.randomUUID().toString().replaceAll("-", "");
		redirectUrls.setCancelUrl(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath() + "/Home");
		redirectUrls.setReturnUrl(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath() + "/Payment?guid=" + guid);
		payment.setRedirectUrls(redirectUrls);

		// Create a payment by posting to the APIService
		// using a valid AccessToken
		// The return object contains the status;
		try {
			createdPayment = payment.create(apiContext);
			// ###Payment Approval Url
			Iterator<Links> links = createdPayment.getLinks().iterator();
			while (links.hasNext()) {
				Links link = links.next();
				if (link.getRel().equalsIgnoreCase("approval_url")) {
					request.getSession().setAttribute("redirectURL", link.getHref());
				}
			}

		} catch (PayPalRESTException e) {

		}

		return createdPayment;
	}

}
