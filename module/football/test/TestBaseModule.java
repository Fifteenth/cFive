package test;


import mn.menu.model.BaseModule;
import mn.menu.service.IBaseModuleService;
import mn.zq.model.Player;
import mn.zq.service.IPlayerService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
public class TestBaseModule {

	@Autowired
	private IBaseModuleService baseModuleService;
	
	@Test
	public void testGetBaseModuleList() {
		System.out.println("");

		BaseModule baseModule = new BaseModule();
		baseModule.setHead("1");
		baseModuleService.getBaseModuleList(baseModule);
		System.out.println("");
	}
	
}
