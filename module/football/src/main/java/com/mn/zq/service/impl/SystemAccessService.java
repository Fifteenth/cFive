package com.mn.zq.service.impl;


import java.util.List;

import com.mn.zq.model.SystemAccess;
import com.mn.zq.model.dao.SystemAccessMapper;
import com.mn.zq.service.ISystemAccessService;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("systemAccessService")
public class SystemAccessService implements ISystemAccessService {
	
	@Inject
	private SystemAccessMapper mapper;

	@Override
	public int getCount() {
		return mapper.getCount();
	}

	@Override
	public void saveSystemAccess(SystemAccess systemAccess) {
		mapper.saveSystemAccess(systemAccess);
	}
	
	public SystemAccess getLastSystemAccess(){
		return mapper.getLastSystemAccess();
	}
	
	public List<SystemAccess> getLast10SystemAccess(){
		return mapper.getLast10SystemAccess();
	}
}
