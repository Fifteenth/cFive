package com.mn.zq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mn.zq.model.League;
import com.mn.zq.model.Scorer;
import com.mn.zq.service.ILeagueService;
import com.mn.zq.service.IScorersService;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/league")
public class LeagueController {
	
	@Autowired
	private ILeagueService leagueService;
	@Autowired
	private IScorersService scorersService;
	
	@RequestMapping(value = "/xc", method = RequestMethod.GET)
	public String showPlayerPage(HttpServletRequest request){
		List<League> list = leagueService.getLeague();
		JSONArray array = JSONArray.fromObject(list);
		
		int lastRound = leagueService.getLastRound();
		
		request.setAttribute("lastRound", lastRound);
		request.setAttribute("array", array);
		return "leagueXC";
	}
	
	@RequestMapping(value = "/leagueXCStandings", method = RequestMethod.GET)
	public String leagueXCStandings(HttpServletRequest request){
		List<League> list = leagueService.getLeague();
		
		JSONArray array = JSONArray.fromObject(list);
		
		int lastRound = leagueService.getLastRound();
		
		request.setAttribute("lastRound", lastRound);
		request.setAttribute("array", array);
		return "leagueXCStandings";
	}

	@RequestMapping(value = "/leagueXCScorers", method = RequestMethod.GET)
	public String leagueXCScorers(HttpServletRequest request){
		List<Scorer> list = scorersService.getScorers();
		
		JSONArray array = JSONArray.fromObject(list);
		int lastRound = leagueService.getLastRound();
		
		request.setAttribute("lastRound", lastRound);
		request.setAttribute("array", array);
		return "leagueXCScorers";
	}
	
	@RequestMapping(value = "/xc/test", method = RequestMethod.GET)
	public String showPlayerPageTest(HttpServletRequest request){
		return "leagueXCTest";
	}
	
	@RequestMapping(value = "/getLeague", method = RequestMethod.GET)
	public @ResponseBody
	List<League> getLeague(HttpServletRequest request){
		return leagueService.getLeague();
	}
	
	@RequestMapping(value = "/getScorers", method = RequestMethod.GET)
	public @ResponseBody
	List<Scorer> getScorers(HttpServletRequest request){
		return scorersService.getScorers();
	}
	
}
