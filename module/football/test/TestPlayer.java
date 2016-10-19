package test;


import mn.zq.model.Player;
import mn.zq.service.IPlayerService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
public class TestPlayer {

	@Autowired
	private IPlayerService playerService;
	
	@Test
	public void testGetPlayer() {
		System.out.println("");
//		playerService.getPlayerByName();
		
		Player player = new Player();
		player.setIdCard("015");
		playerService.getPlayer(player);
		System.out.println("");
	}
	
	@Test
	public void testSavePlayer() {
//		Player player = new Player();
//		player.setId("015");
//		player.setNumber("15");
//		player.setName("曹五");
//		player.setBirthDay("1987-04-11");
//		player.setClub("码农");
//		playerService.registerPayer(player);
		
		Player player = new Player();
		player.setIdCard("115");
		player.setNumber("#15");
		player.setName("曹五");
		player.setBirthDay("1987-04-11");
		player.setClub("码农");
		playerService.registerPayer(player);
	}
	
	
	@Test
	public void testUpdatePlayer() {
		Player player = new Player();
		player.setNumber("#15");
		player.setName("15-1");
		player.setClub("码农-1");
		playerService.updatePlayer(player);
	}
	
	
	@Test
	public void deletePlayer() {
		playerService.deletePlayer("#15");
	}
}
