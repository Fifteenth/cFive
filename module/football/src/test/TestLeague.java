package test;


import mn.zq.model.League;
import mn.zq.service.ILeagueService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
public class TestLeague {

	@Autowired
	private ILeagueService leagueService;
	
	@Test
	public void getLeague() {
		leagueService.getLeague();
	}
	
	@Test
	public void getLastRound() {
		leagueService.getLastRound();
	}
	
	@Test
	public void getSaveLeague() {
		League league = new League();
		league.setSeason("2015b");
		league.setRound(1);
		league.setNumber(1);
		league.setClub("aa");
		league.setWin(1);
		league.setDraw(1);
		league.setLose(1);
		league.setGoalEnter(1);
		league.setGoalLose(1);
		league.setGoalDifference(0);
		league.setIntegration(1);
		league.setCardYellow(1);
		league.setCardRed(1);
		leagueService.saveLeague(league);
	}
}
	
