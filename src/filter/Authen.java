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
	     if(servletPath.equals("/Login")||servletPath.equals("/Logout")) {
	            chain.doFilter(req, resp);
	            return;
	      }
	     if(identify==null || user == null) {
	    		 resp.sendRedirect("/Prince/Login");
	    		 return;
	     }
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
