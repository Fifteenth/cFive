package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.SystemAccess;

public interface SystemAccessMapper extends SqlMapper {
	
	public int getCount();

	public void saveSystemAccess(SystemAccess systemAccess);

	public SystemAccess getLastSystemAccess();
	
	public List<SystemAccess> getLast10SystemAccess();
	
}
