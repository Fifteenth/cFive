package test;


import mn.zq.model.PlayerRecord;
import mn.zq.service.IPlayerRecordService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
public class TestPlayerRecord {

	@Autowired
	private IPlayerRecordService playerRecordService;
	
	@Test
	public void testGetPlayerRecord() {
		System.out.println("");
//		playerService.getPlayerByName();
		
		PlayerRecord playerRecord = new PlayerRecord();
		playerRecord.setIdCard("1");
		playerRecordService.getPlayerRecord(playerRecord);
		System.out.println("");
	}
}
	
