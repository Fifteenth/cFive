package test;


import mn.zq.model.Scorer;
import mn.zq.service.IScorersService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
@ContextConfiguration(locations = { "../spring.xml", "../applicationContext.xml"})
public class TestScorers {

	@Autowired
	private IScorersService scorersService;
	
	@Test
	public void testGetScorers() {
		scorersService.getScorers();
	}
	
	@Test
	public void testSaveScorer() {
		Scorer scorer = new Scorer();
		scorer.setSeason("2015b");
		scorer.setRound(1);
		scorer.setNumber(1);
		scorer.setClub("aa");
		scorer.setCount(11);
		scorer.setName("aa");
		scorersService.saveScorer(scorer);
	}
	
}
	
