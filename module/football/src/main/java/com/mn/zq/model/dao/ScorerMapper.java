package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.Scorer;

public interface ScorerMapper extends SqlMapper {
	
	public List<Scorer> getScorers();
	
	public void saveScorer(Scorer scorer);
	
}
