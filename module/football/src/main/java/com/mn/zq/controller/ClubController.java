package com.mn.zq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@RequestMapping(value = "/mtmy", method = RequestMethod.GET)
	public String showPlayerPage(HttpServletRequest request){
		return "leagueXC";
	}
	
}
