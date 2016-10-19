package com.mn.zq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/web")
public class WebController {

	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String webIndex(HttpServletRequest request){
		
		request.setAttribute("login", "admin");
		return "web/index";
	}
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String webHeader(HttpServletRequest request){
		return "web/header";
	}
	
	@RequestMapping(value = "/bottom", method = RequestMethod.GET)
	public String webBottom(HttpServletRequest request){
		return "web/bottom";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String webAdd(HttpServletRequest request){
		return "web/add";
	}
	
	@RequestMapping(value = "/merge", method = RequestMethod.GET)
	public String webMerge(HttpServletRequest request){
		return "web/merge";
	}
	
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public @ResponseBody
	String getList(HttpServletRequest request){
		
		return "{\"aa\":\"bb\"}";
	}
	
}
