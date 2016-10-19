package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.PlayerRecord;

public interface PlayerRecordMapper extends SqlMapper {
	
	
	public List<PlayerRecord> getPlayerRecord(PlayerRecord playerRecord);

}
