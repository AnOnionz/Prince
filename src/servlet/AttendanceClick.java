package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.AttendanceDAO;
import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class AttendanceClick
 */
@WebServlet("/AttendanceClick")
public class AttendanceClick extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AttendanceClick() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		toDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		toDo(request, response);
	}

	private void toDo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// get day click
		int day = Integer.parseInt(request.getParameter("day"));

		// get user
	
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		UserAccount ua = UserDAO.selectUserById(userId);


		// get score
		int score;
		score = ua.getSCORE();
		System.out.println(score);

		// get attendance
		beans.Attendance ace = AttendanceDAO.selectAttendance(userId.toString());
		int countAce = ace.getCount_attendance();
		// get severvlet
		ServletContext context = getServletContext();
		RequestDispatcher rd;
		switch (day) {
		case 1:
			// update score
			UserDAO.updateScore(userId, (score += 28));
			// update count Attendance
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			System.out.println("qqqqqqqq");
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 2:
			UserDAO.updateScore(userId, (score += 38));
			// update count Attendance
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 3:
			UserDAO.updateScore(userId, (score += 48));
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 4:
			UserDAO.updateScore(userId, (score += 188));
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 5:
			UserDAO.updateScore(userId, (score += 28));
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 6:
			UserDAO.updateScore(userId, (score += 38));
			countAce += 1;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		case 7:
			UserDAO.updateScore(userId, (score += 318));
			countAce = 0;
			AttendanceDAO.updateCountAttendance(userId, countAce);
			// update date Attendance
			AttendanceDAO.updateDateAttendance(userId);
			rd = context.getRequestDispatcher("/Attendance");
			rd.forward(request, response);
			break;
		default:
			System.out.println("loi");
			break;
		}
	}

}
