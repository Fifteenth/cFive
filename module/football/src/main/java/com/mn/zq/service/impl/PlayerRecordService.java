package com.mn.zq.service.impl;

import java.util.List;

import com.mn.zq.model.dao.PlayerRecordMapper;
import com.mn.zq.service.IPlayerRecordService;
import com.mn.zq.model.PlayerRecord;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("playerRecordService")
public class PlayerRecordService implements IPlayerRecordService {
	
	@Inject
	private PlayerRecordMapper mapper;
	

	public List<PlayerRecord> getPlayerRecord(PlayerRecord playerRecord){
		return mapper.getPlayerRecord(playerRecord);
	}
	

}
