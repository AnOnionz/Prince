package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserAccount;
import util.DBUtils;

/**
 * Servlet Filter implementation class authentic
 */
@WebFilter("/*")
public class Authen implements Filter {

    /**
     * Default constructor. 
     */
    public Authen() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
	     HttpServletResponse resp = (HttpServletResponse) response;
	     String servletPath = req.getServletPath();
	     
	     String identify = DBUtils.getCookie(req, "identify");
	     UserAccount user = DBUtils.getLoginedUser(req);
	     if(servletPath.equals("/Login")||servletPath.equals("/Logout")||servletPath.equals("/RegisterEmail")||servletPath.equals("/VerifyRegisteredEmailHash")
	    		 ||servletPath.equals("/Resetpass")||servletPath.equals("/Register")||servletPath.equals("/ForgotPassword")
	    		 ||servletPath.equals("/ChangePassword")) {
	            chain.doFilter(req, resp);
	            return;
	      }else{
	    	  if(identify == null|| user == null) {
		    		 resp.sendRedirect("/Prince/Logout");
		    		 return;
		     }else {
		    	 if(user.getROLE_ID()==1 && servletPath.equals("/MyListPost")) {
			    	 resp.sendRedirect("/Prince/Create?step=1");
			    	 return;
			     }
		     }  
	      }
	          
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

}
