package com.mn.zq.service.impl;


import java.util.List;

import com.mn.zq.model.League;
import com.mn.zq.service.ILeagueService;
import com.mn.zq.model.dao.LeagueMapper;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("leagueService")
public class LeagueService implements ILeagueService {
	
	@Inject
	private LeagueMapper mapper;

	@Override
	public List<League> getLeague(){
		return mapper.getLeague();
	}
	
	public int getLastRound(){
		return mapper.getLastRound();
	}
	
	public void saveLeague(League league){
		mapper.saveLeague(league);
	}
}
