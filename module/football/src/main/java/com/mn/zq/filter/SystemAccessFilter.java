package com.mn.zq.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mn.zq.model.SystemAccess;
import com.mn.zq.service.impl.SystemAccessService;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;


public class SystemAccessFilter implements Filter {
	private ServletContext  servletContext;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		
		try{
			// 从Spring容器中得到
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
			SystemAccessService systemAccessService = (SystemAccessService)ctx.getBean("systemAccessService");
			
			 HttpServletRequest request = (HttpServletRequest)  (HttpServletRequest)servletRequest;
			 String uri = request.getRequestURI();
			 String ip = request.getRemoteAddr();
			 if(!uri.contains("system")
					 &&!uri.contains("/league/get")
					 &&(!uri.contains(".")||uri.endsWith(".jsp")||uri.endsWith(".html")||uri.endsWith(".htm"))
					 &&!ip.equals("120.25.127.139")	//服务器
					 &&!ip.equals("218.4.149.28")	//公司远程电脑
					 &&!ip.equals("114.217.239.138")//漕湖
					 ){
				 UUID uuid = UUID.randomUUID(); 
				 SystemAccess systemAccess = new SystemAccess();
				 systemAccess.setIp(ip);
				 systemAccess.setUuid(uuid.toString());
				 systemAccess.setUri(uri);
				 systemAccess.setAccessDateTime(new Date());
				 systemAccessService.saveSystemAccess(systemAccess);
			 }
			 
		}catch(Exception e){
			e.printStackTrace();
		}
		chain.doFilter(servletRequest, servletResponse);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		  servletContext  =config.getServletContext();
	}

}
