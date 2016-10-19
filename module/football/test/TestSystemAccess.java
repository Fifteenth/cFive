package test;


import java.util.Date;

import mn.zq.model.SystemAccess;
import mn.zq.service.ISystemAccessService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:applicationContext.xml"})
@ContextConfiguration(locations = { "../spring.xml", "../applicationContext.xml"})
public class TestSystemAccess {

	@Autowired
	private ISystemAccessService systemAccessService;
	
	@Test
	public void testgetCount() {
		systemAccessService.getCount();
		System.out.println("count:" + systemAccessService.getCount());
	}
	
	@Test
	public void testgetLastSystemAccess() {
		systemAccessService.getLastSystemAccess();
	}
	
	
	@Test
	public void testSaveSystemAccess() {
		SystemAccess systemAccess = new SystemAccess();
		systemAccess.setIp("11");
		systemAccess.setUuid("11");
		systemAccess.setAccessDateTime(new Date());
		
		systemAccessService.saveSystemAccess(systemAccess);
		System.out.println(systemAccessService.getCount());
	}
	
	
	
}
	
