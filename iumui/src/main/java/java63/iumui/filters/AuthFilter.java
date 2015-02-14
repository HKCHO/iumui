package java63.iumui.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AuthFilter implements Filter {
//	private String auth;
//	private String common;
//	private String fileupload;
//	private String icon;
//	private String js;
//	private String main;
	
  @Override
  public void init(FilterConfig filterConfig) throws ServletException {}

  @Override
  public void doFilter(
      ServletRequest req, 
      ServletResponse resp,
      FilterChain nextFilter) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest)req;
    HttpServletResponse response = (HttpServletResponse)resp;

    System.out.println("2" + request.getServletPath());
    System.out.println("3" + request.getPathTranslated());
    System.out.println("4" + request.getRequestURL());
    
    String path = request.getServletPath();
    if (path.startsWith("/main") || path.startsWith("/common") ) {
    		System.out.println("--------------필터를 통과하였음--------------");
        nextFilter.doFilter(request, response); // Just continue chain.
    } else {
        // business stuff for all paths other than /specialpath.
    	System.out.println("--------------필터에 걸림--------------");
    	
      	if (!request.getServletPath().startsWith("/auth") &&
            request.getSession().getAttribute("loginUser") == null) {
          /*
      	  request.getSession().setAttribute("requestUrl", 
              request.getRequestURL() + "?" + request.getQueryString());
      	  */
          /*
          response.sendRedirect(
              request.getServletContext().getContextPath()
              + "/auth/login.do");
          */
          
          
          request.getSession().setAttribute("IUMUImessage" , "로그인 후 이용해주십시오");
          
          response.sendRedirect("/iumui/main/main.html");

          return;
          
        } else {
          nextFilter.doFilter(request, response);
        }
    }

  }

  @Override
  public void destroy() {}

}










