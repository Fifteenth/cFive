package com.mn.zq.service.impl;

import java.util.List;

import com.mn.zq.model.Player;
import com.mn.zq.model.dao.PlayerMapper;
import com.mn.zq.service.IPlayerService;
import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("playerService")
public class PlayerService implements IPlayerService{
	
	@Inject
	private PlayerMapper mapper;
	

	public List<Player> getPlayer(Player player){
		return mapper.getPlayer(player);
	}
	
	public Player getPlayerByName(){
		return mapper.getPlayerByName("1");
	}
	
	
	public void registerPayer(Player player){
		try{
			mapper.savePlayer(player);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updatePlayer(Player player){
		try{
			mapper.updatePlayer(player);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void deletePlayer(String number){
		mapper.deletePlayer(number);
	}

}
