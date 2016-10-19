package com.mn.zq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mn.zq.base.Constant;
import com.mn.zq.model.Player;
import com.mn.zq.model.PlayerWithPlayerRecordJSon;
import com.mn.zq.service.IPlayerRecordService;
import com.mn.zq.service.IPlayerService;
import com.mn.zq.model.PlayerRecord;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/player")
public class PlayerController {
	
	final int PLAYER_LIST_INDEX_0 = 0;
	
	@Autowired
	private IPlayerService playerService;
	
	@Autowired
	private IPlayerRecordService playerRecordService;
	
	@RequestMapping(value = "/showPlayerList", method = RequestMethod.GET)
	public String showPlayerList(HttpServletRequest request){
		request.setAttribute("message", "message is added");  
		Player player = new Player();
		player.setIdCard("07");
		request.setAttribute("player", player);  
		return "showPlayerListPage";
	}
	
	@RequestMapping(value = "/showPlayerPage", method = RequestMethod.GET)
	public String showPlayerPage(HttpServletRequest request){
		return "showPlayerPage";
	}
	
	@RequestMapping(value = "/getPlayer/{idCard}", method = RequestMethod.GET)
	public @ResponseBody
	JSONObject getPlayer(HttpServletRequest request,@PathVariable("idCard") String idCard){
		PlayerRecord playerRecord = new PlayerRecord();
		Player player = new Player();
		player.setIdCard(idCard);
		List<Player> playerList = playerService.getPlayer(player);
		if(playerList.size() == PLAYER_LIST_INDEX_0){
			JSONObject returnJson = new JSONObject();
			returnJson.put(Constant.RESULT, Constant.RESULT_ERROR_CAN_NOT_FIND_PLAYER_INFO);
			return returnJson;
		}
		
		player = playerList.get(PLAYER_LIST_INDEX_0);
		
		playerRecord.setIdCard(idCard);
		List<PlayerRecord> playerRecordList = playerRecordService.getPlayerRecord(playerRecord);
		
		PlayerWithPlayerRecordJSon playerWhtherPlayerRecord = new PlayerWithPlayerRecordJSon(player,playerRecordList);
		return playerWhtherPlayerRecord.getPlayerWithPlayerRecordJSon();
	}
	
	@RequestMapping(value = "/registerPlayer", method = RequestMethod.GET)
	public String registerPlayerPage(HttpServletRequest request){
		return "registerPlayerPage";
	}
	
	@RequestMapping(value = "/registerPlayer", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject registerPlayer(HttpServletRequest request){
		String playerNumber = (String) request.getParameter("playerNumber");
		String playerName = (String) request.getParameter("playerName");
		String club = (String) request.getParameter("club");
		Player player = new Player();
		player.setIdCard('0'+playerNumber);
		player.setNumber(playerNumber);
		player.setName(playerName);
		player.setClub(club);
		
		playerService.registerPayer(player);
		
		JSONObject json = new JSONObject();
		json.put(Constant.RESULT, Constant.RESULT_OK);
		return json;
	}
	
	@RequestMapping(value = "/addPlayer", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject addPlayer(HttpServletRequest request){
		String playerNumber = (String) request.getParameter("playerNumber");
		String playerName = (String) request.getParameter("playerName");
		String club = (String) request.getParameter("club");
		Player player = new Player();
		player.setIdCard('0'+playerNumber);
		player.setNumber(playerNumber);
		player.setName(playerName);
		player.setClub(club);
		
		playerService.registerPayer(player);
		
		JSONObject json = new JSONObject();
		json.put("result", "OK");
		return json;
	}
	
	@RequestMapping(value = "/updatePlayer", method = RequestMethod.PUT)
	public @ResponseBody
	JSONObject updatePlayer(HttpServletRequest request){
		String playerNumber = (String) request.getParameter("playerNumber");
		String playerName = (String) request.getParameter("playerName");
		String club = (String) request.getParameter("club");
		Player player = new Player();
		player.setIdCard('0' + playerNumber);
		player.setNumber(playerNumber);
		player.setName(playerName);
		player.setClub(club);
		
		playerService.updatePlayer(player);
		
		JSONObject json = new JSONObject();
		json.put("result", "OK");
		return json;
	}
	
	@RequestMapping(value = "/deletePlayer/{id}", method = RequestMethod.DELETE)
	public @ResponseBody
	JSONObject deletePlayer(HttpServletRequest request,@PathVariable("id") String id){
		String playerNumber = (String) request.getParameter("playerNumber");
		String playerName = (String) request.getParameter("playerName");
		String club = (String) request.getParameter("club");
		
		playerNumber = id;
		
		playerService.deletePlayer(playerNumber);
		
		JSONObject json = new JSONObject();
		json.put("result", "OK");
		return json;
	}
	
	@RequestMapping(value = "/listPlayer", method = RequestMethod.GET)
	public String listPlayer(HttpServletRequest request){
		
		return "showPlayerListPage";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/create", method = RequestMethod.PUT)
	public @ResponseBody
	Object playerCreate(HttpServletRequest request) {
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		
		 int n = 512;    
		 byte buffer[] = new byte[n];   
		 
		 try {
			while ((request.getInputStream().read(buffer, 0, n) != -1) && (n > 0)) {    
			     System.out.print(new String(buffer));  
			 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   

		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "删除人员信息成功");
		return jsonObject;
	}
	
	@RequestMapping(value = "/read/{id:\\d+}", method = RequestMethod.GET)
	public @ResponseBody
	Object playerRead(@PathVariable("id") int id) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "删除人员信息成功");
		return jsonObject;
	}
	
	
	@RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
	public @ResponseBody
	Object playerUpdate(HttpServletRequest request,@PathVariable("id") int id) {
		
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "删除人员信息成功");
		return jsonObject;
	}

	@RequestMapping(value = "/delete/{id:\\d+}", method = RequestMethod.DELETE)
	public @ResponseBody
	Object playerDelete(@PathVariable("id") int id) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "删除人员信息成功");
		return jsonObject;
	}
}
