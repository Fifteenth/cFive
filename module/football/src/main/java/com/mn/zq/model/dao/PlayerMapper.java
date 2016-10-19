package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.Player;

import org.apache.ibatis.annotations.Select;



public interface PlayerMapper extends SqlMapper {
	
	
	
	public List<Player> getPlayer(Player player);

	@Select("select * from FOOTBALL_PLAYER where ID = #{id}")
	public Player getPlayerByName(String name);
	
	public void savePlayer(Player player);
	
	public void updatePlayer(Player player);
	
	public void deletePlayer(String number);

}
