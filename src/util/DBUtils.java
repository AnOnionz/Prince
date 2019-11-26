package util;

import java.net.HttpCookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserAccount;
import beans.UserDAO;

public class DBUtils {
	public static void storeUserCookie(HttpServletRequest request, HttpServletResponse response, String identify) {
        System.out.println("Store user cookie");
        
        Cookie cookieUserPass = new Cookie("identify",identify);
        // 1 ngày (Đã đổi ra giây)
        cookieUserPass.setMaxAge(7*24 * 60 * 60);
        response.addCookie(cookieUserPass);
        
    }
 
    public static String getCookie(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    
 
    // Xóa Cookie của người dùng
    public static void deleteUserCookie(HttpServletRequest request, HttpServletResponse response) {
    	Cookie[] cookies = request.getCookies();	
    	if (cookies != null) {
    		for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
               
                response.addCookie(cookie);
            }
    	}
    }
    public static UserAccount getLoginedUser(HttpServletRequest request, HttpSession session) {
    	UserAccount user = new UserAccount();
    	try {
    		user = (UserAccount) session.getAttribute("user");
    	}
    	catch(Exception e) {
    		
    	}
    	return user;
    }
}
