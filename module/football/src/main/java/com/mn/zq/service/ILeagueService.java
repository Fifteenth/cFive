package com.mn.zq.service;

import java.util.List;

import com.mn.zq.model.League;


public interface ILeagueService {
	

	public List<League> getLeague();
	
	public int getLastRound();
	
	public void saveLeague(League league);
}
