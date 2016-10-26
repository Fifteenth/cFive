package test;


import mn.zq.model.Finance;
import mn.zq.service.IFinanceService;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
public class TestFinance {

	// TODO
	private static final Logger logger = Logger.getLogger(TestFinance.class);

	@Autowired
	private IFinanceService financeService;


	@Test
	public void testGetFinanceAll() {
		logger.info("Logger Info:testGetFinanceAll");
		logger.debug("Logger Debug:testGetFinanceAll");
		financeService.getFinance();
	}
	
	
	@Test
	public void testGetFinanceById() {
		financeService.getFinanceById("15");
	}
	
	@Test
	public void testSaveFinance() {
		Finance finance = new Finance();
		finance.setNumber("17");
		finance.setName("ssss");
		financeService.saveFinance(finance);
	}

	@Test
	public void testDeleteFinance() {
		financeService.deleteFinance("16");
	}
	
	@Test
	public void testUpdateFinance() {
		Finance finance = new Finance();
		finance.setNumber("16");
		finance.setName("dsfdsf");
		financeService.updateFinance(finance);
	}
	
}
