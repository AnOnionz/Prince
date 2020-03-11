package servlet;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserAccount;
import beans.UserDAO;


@WebServlet("/ChangeInformatonUser")
public class ChangeInformatonUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ChangeInformatonUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			toDo(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			toDo(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void toDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		Integer userId = (Integer) request.getSession().getAttribute("user_id");
		String avatar = request.getParameter("avatar");
		String firstname = (String)request.getParameter("firstname");
		String lastname = (String)request.getParameter("lastname");
		String birthday = (String)request.getParameter("birthday");
		String gender = (String)request.getParameter("gender");
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(birthday);
		
		if(gender.equals("1")) {
			gender = "nam";
		}else {
			gender = "nữ";
		}
		System.out.println("ddasd "+ userId);
		System.out.println(gender);
		UserDAO u = new UserDAO();
		u.updateInformation(userId.toString(), firstname, lastname, birthday, gender,avatar);
		
//		request.getRequestDispatcher("proFileUser.jsp").forward(request, response);
		response.sendRedirect("http://localhost:8080/Prince/userProfile");
	}
}
