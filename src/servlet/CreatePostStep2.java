package servlet;

import static util.SampleConstants.clientID;
import static util.SampleConstants.clientSecret;
import static util.SampleConstants.mode;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

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
import util.Utils;

/**
 * Servlet implementation class CreatePostStep2
 */
@WebServlet({"/CreatePostStep2","/deleteOrder"})
public class CreatePostStep2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 10; // 10MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatePostStep2() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		try {
		int index = Integer.parseInt(request.getParameter("index"));
		ArrayList<Post> listPayment = (ArrayList<Post>) request.getSession().getAttribute("listPayment");
		for(int i = 0 ; i< listPayment.size(); i++) {
			if(i==index) {
				listPayment.remove(i);
			}
		}
			session.setAttribute("countPayment", listPayment.size());
			if(listPayment.size()==0) {
				request.getSession().removeAttribute("countPayment");
			}
			session.setAttribute("listPayment", listPayment);
			Notify.createNotify("Thông báo","xóa thành công", "success","false", request, response);
			response.sendRedirect("/Prince/Create?step=3");
		
		//response.sendRedirect("/Prince/Create?step=3");
		
		
	}catch(Exception e) {
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Post> listPayment = null;
		try {
		 listPayment = (ArrayList<Post>) request.getSession().getAttribute("listPayment");
		}catch(Exception e) {
		}
		if(listPayment==null) {
			listPayment = new ArrayList<Post>();
		}
		Post post = (Post) request.getSession().getAttribute("post");
		if (post.getFormat() == 1) {
			Map<Integer, String> listFile = new HashMap<Integer, String>();
			// start upload
			if (!ServletFileUpload.isMultipartContent(request)) {
				PrintWriter writer = response.getWriter();
				writer.println("Request does not contain upload data");
				writer.flush();
				return;
			}

			// configures upload settings
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(THRESHOLD_SIZE);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(MAX_FILE_SIZE);
			upload.setSizeMax(MAX_REQUEST_SIZE);

			// constructs the directory path to store upload file
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
			// creates the directory if it does not exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				int i = 1;
				// parses the request's content to extract file data
				List<?> formItems = upload.parseRequest(request);
				Iterator<?> iter = formItems.iterator();
				// iterates over form's fields
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String file = new File(item.getName()).getName();
						String fileName = renameFile(file);
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						// saves the file on disk
						if (file != "") {
							item.write(storeFile);
							listFile.put(i, "upload/" + fileName);
						}
					}
					if(item.isFormField()) {

						if (i == 1) {
							post.setTitle(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 2) {
							post.setSubTitle1(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 3) {
							post.setContent1(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 4) {
							post.setSubTitle2(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 5) {
							post.setContent2(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 8) {
							post.setFigure1(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 10) {
							post.setFigure2(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 12) {
							post.setFigure3(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 13) {
							post.setUrl(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
					}
					i++;
				}
			} catch (Exception ex) {
				request.setAttribute("message", "There was an error: " + ex.getMessage());
			}

			post.setImage(listFile.get(6));
			post.setImage1(listFile.get(7));
			post.setImage2(listFile.get(9));
			post.setVideo(listFile.get(11));
			//hoan tat buoc 2
		}
		if (post.getFormat() == 2) {
			Map<Integer, String> listFile = new HashMap<Integer, String>();
			// start upload
			if (!ServletFileUpload.isMultipartContent(request)) {
				PrintWriter writer = response.getWriter();
				writer.println("Request does not contain upload data");
				writer.flush();
				return;
			}

			// configures upload settings
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(THRESHOLD_SIZE);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(MAX_FILE_SIZE);
			upload.setSizeMax(MAX_REQUEST_SIZE);

			// constructs the directory path to store upload file
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
			// creates the directory if it does not exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				int i = 1;
				// parses the request's content to extract file data
				List<?> formItems = upload.parseRequest(request);
				Iterator<?> iter = formItems.iterator();
				// iterates over form's fields
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String file = new File(item.getName()).getName();
						String fileName = renameFile(file);
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						// saves the file on disk
						if (file != "") {
							item.write(storeFile);
							listFile.put(i, "upload/" + fileName);
						}
					}
					if (item.isFormField()) {

						if (i == 1) {
							post.setTitle(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
						if (i == 3) {
							post.setUrl(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1),
									StandardCharsets.UTF_8));
						}
					}
					i++;
				}
			} catch (Exception ex) {
				request.setAttribute("message", "There was an error: " + ex.getMessage());
			}

			post.setVideo(listFile.get(2));
			//hoan tat buoc 2
			
		}
			request.getSession(true).setAttribute("stepcompleted", 2);
			//them post vua tao vao danh sach cho thanh toan
			listPayment.add(post);
			request.getSession(true).setAttribute("listPayment", listPayment);
			request.getSession(true).setAttribute("countPayment", listPayment.size());
			Notify.createNotify("Tạo quảng cáo thành công","quảng cáo đang chờ thanh toán", "success","false", request, response);
			response.sendRedirect("/Prince/Create?step=3");
		
	}
	// end step 2

	public static String renameFile(String fileName) {
		return FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
				+ FilenameUtils.getExtension(fileName);
	}

}
