package com.mn.zq.service;

import java.util.List;

import com.mn.zq.model.Player;


public interface IPlayerService {
	
	public List<Player> getPlayer(Player player);
	
	public Player getPlayerByName();
	
	/**
	 * register player
	 */
	public void registerPayer(Player player);
	
	public void updatePlayer(Player player);
	
	public void deletePlayer(String number);
	
}
