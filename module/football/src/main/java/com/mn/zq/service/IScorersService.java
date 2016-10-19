package com.mn.zq.service;

import java.util.List;

import com.mn.zq.model.Scorer;


public interface IScorersService {
	

	public List<Scorer> getScorers();
	
	public void saveScorer(Scorer Scorer);
}
