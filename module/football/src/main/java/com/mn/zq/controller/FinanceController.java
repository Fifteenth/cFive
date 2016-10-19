package com.mn.zq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mn.zq.model.Finance;
import com.mn.zq.service.IFinanceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class FinanceController {
	
	@Autowired
	private IFinanceService financeService;

	@RequestMapping(value = "/finance", method = RequestMethod.GET)
	public @ResponseBody
	String playerRead1(HttpServletRequest request) {
		
		List<Finance> list = financeService.getFinance();
		return "1234567890";
	}
}
