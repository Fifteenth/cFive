package com.mn.zq.model;

import java.util.List;

import net.sf.json.JSONObject;


public class PlayerWithPlayerRecordJSon{
	final static String PLAYER = "player";
	final static String PLAYER_RECORD_LIST = "playerRecordList";
	
	JSONObject playerWithPlayerRecordJSon;
	
	public JSONObject getPlayerWithPlayerRecordJSon() {
		return playerWithPlayerRecordJSon;
	}

	public PlayerWithPlayerRecordJSon(Player player,List<PlayerRecord> playerRecordList){
		JSONObject json = new JSONObject();
		json.put(PLAYER, player);
		json.put(PLAYER_RECORD_LIST, playerRecordList);
		this.playerWithPlayerRecordJSon = json;
	}

}
