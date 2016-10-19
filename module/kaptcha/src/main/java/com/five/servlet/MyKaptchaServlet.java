package com.five.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class MyKaptchaServlet extends com.google.code.kaptcha.servlet.KaptchaServlet{
	
	
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		
		
//		super.service(request, response);//
		
		String kaptchaExpected = (String)((HttpServletRequest)request).getSession()
			    .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String kaptchafield = request.getParameter("kaptchafield");
		
		boolean result;
		if(kaptchaExpected != null && kaptchaExpected.equals(kaptchafield)){
			result = true;
		}else{
			result = false;
		}
		
		if(!result){
			super.service(request, response);
		}
		
//		if(kaptchaReceived == null){
//			super.service(request, response);
//			return;
//		}
//		String result = "";
//		if(!kaptchaExpected.equals(kaptchaReceived)){
//			result = "failure";
//		}else{
//			result = "success";
//		}
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.append(result);
//		out.close();
	}

}
