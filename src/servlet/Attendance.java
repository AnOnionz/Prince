package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
 * Servlet implementation class Attendance
 */
@WebServlet("/Attendance")
public class Attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			toDo(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			toDo(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void toDo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException, ServletException {
		
		//lay userid cua session
		Integer userId = (Integer) request.getSession().getAttribute(GlobalConstants.USER_ID);
		
		//get attendance duoi database
		beans.Attendance ace = AttendanceDAO.selectAttendance(userId.toString());
		
		// doi ngay gio de tinh toan
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeAttendanceSql = ace.getDate_attendance();
		
		//neu user chua diem danh ngay nao
		if (timeAttendanceSql == null) {
			request.setAttribute("day1", "clicking");
			request.setAttribute("day2", "donotclick");
			request.setAttribute("day3", "donotclick");
			request.setAttribute("day4", "donotclick");
			request.setAttribute("day5", "donotclick");
			request.setAttribute("day6", "donotclick");
			request.setAttribute("day7", "donotclick");
			request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
		
	    
		} else {
			java.util.Date timeAttendance = formatter.parse(timeAttendanceSql);
			int day = beans.Attendance.tinhNgay(timeAttendance);
			if (day == 0) {
				int count = ace.getCount_attendance();
				switch (count) {
				case 0:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicked");
					request.setAttribute("day6", "clicked");
					request.setAttribute("day7", "clicked");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 1:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "donotclick");
					request.setAttribute("day3", "donotclick");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 2:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "donotclick");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 3:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 4:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 5:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicked");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 6:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicked");
					request.setAttribute("day6", "clicked");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				default:
					break;
				}
			}

			if (day == 1) {
				int count = ace.getCount_attendance();
				switch (count) {
				case 0:
					request.setAttribute("day1", "clicking");
					request.setAttribute("day2", "donotclick");
					request.setAttribute("day3", "donotclick");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 1:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicking");
					request.setAttribute("day3", "donotclick");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 2:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicking");
					request.setAttribute("day4", "donotclick");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 3:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicking");
					request.setAttribute("day5", "donotclick");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 4:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicking");
					request.setAttribute("day6", "donotclick");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 5:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicked");
					request.setAttribute("day6", "clicking");
					request.setAttribute("day7", "donotclick");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				case 6:
					request.setAttribute("day1", "clicked");
					request.setAttribute("day2", "clicked");
					request.setAttribute("day3", "clicked");
					request.setAttribute("day4", "clicked");
					request.setAttribute("day5", "clicked");
					request.setAttribute("day6", "clicked");
					request.setAttribute("day7", "clicking");
					request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
					break;
				default:
					break;
				}
			}

			if (day >= 2) {
				AttendanceDAO.updateCountAttendance(userId, 0);
				request.setAttribute("day1", "clicking");
				request.setAttribute("day2", "donotclick");
				request.setAttribute("day3", "donotclick");
				request.setAttribute("day4", "donotclick");
				request.setAttribute("day5", "donotclick");
				request.setAttribute("day6", "donotclick");
				request.setAttribute("day7", "donotclick");
				request.getRequestDispatcher("/WEB-INF/classes/Attendance.jsp").forward(request, response);
			}
		}
	}

}
