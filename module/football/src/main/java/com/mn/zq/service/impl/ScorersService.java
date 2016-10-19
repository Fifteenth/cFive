package com.mn.zq.service.impl;


import java.util.List;

import com.mn.zq.model.Scorer;
import com.mn.zq.model.dao.ScorerMapper;
import com.mn.zq.service.IScorersService;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("scorersService")
public class ScorersService implements IScorersService{
	
	@Inject
	private ScorerMapper mapper;

	@Override
	public List<Scorer> getScorers(){
		return mapper.getScorers();
	}
	
	@Override
	public void saveScorer(Scorer scorer){
		mapper.saveScorer(scorer);
	}
}
