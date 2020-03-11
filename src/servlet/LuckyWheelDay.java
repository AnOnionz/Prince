package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LuckyWheel;
import beans.LuckyWheelDAO;
import beans.UserAccount;
import beans.UserDAO;
import util.GlobalConstants;

/**
 * Servlet implementation class LuckyWheelDay
 */
@WebServlet("/LuckyWheelDay")
public class LuckyWheelDay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LuckyWheelDay() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// lay userid cua session
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		beans.LuckyWheel lw = LuckyWheelDAO.selectLuckyWheel(userId.toString());
		// doi ngay gio de tinh toan

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeLuckyWheelSql = lw.getDate_luckywheel();
		
		if (timeLuckyWheelSql == null) {
			request.getRequestDispatcher("/WEB-INF/classes/LuckyWheel.jsp").forward(request, response);

		} else {
			java.util.Date timeAttendance = null;
			try {
				timeAttendance = formatter.parse(timeLuckyWheelSql);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int day = beans.Attendance.tinhNgay(timeAttendance);
			if (day ==0) {
				String lw_error = "HÔM NAY BẠN ĐÃ QUAY RỒI, HÃY QUAY LẠI VÀO NGÀY MAI NHÉ";
				request.setAttribute("lw_err", lw_error);
				LuckyWheelDAO.updateDateLuckyWheel(userId);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/classes/home.jsp");
				rd.forward(request, response);
			} else {

				request.getRequestDispatcher("/WEB-INF/classes/LuckyWheel.jsp").forward(request, response);

			}
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

}
