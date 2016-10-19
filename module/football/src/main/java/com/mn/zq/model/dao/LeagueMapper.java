package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.League;

public interface LeagueMapper extends SqlMapper {
	
	public List<League> getLeague();
	
	public int getLastRound();
	
	public void saveLeague(League league);
}
