package com.five.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;

public class MyServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		
		
		String kaptchaExpected = (String)((HttpServletRequest)request).getSession()
			    .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		
		System.out.println("********" + "kaptchaExpected:" + kaptchaExpected + "********");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(kaptchaExpected);
		out.close();
	}

}
