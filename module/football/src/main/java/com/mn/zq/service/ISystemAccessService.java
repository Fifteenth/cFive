package com.mn.zq.service;

import java.util.List;

import com.mn.zq.model.SystemAccess;


public interface ISystemAccessService {
	

	public int getCount();
	
	public void saveSystemAccess(SystemAccess systemAccess);
	
	public SystemAccess getLastSystemAccess();
	
	public List<SystemAccess> getLast10SystemAccess();
}
