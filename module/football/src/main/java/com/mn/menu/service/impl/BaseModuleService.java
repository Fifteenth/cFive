package com.mn.menu.service.impl;


import java.util.List;

import com.mn.menu.model.BaseModule;
import com.mn.menu.service.IBaseModuleService;
import com.mn.zq.model.dao.BaseModuleMapper;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service("baseModuleService")
public class BaseModuleService implements IBaseModuleService {
	
	@Inject
	private BaseModuleMapper mapper;

	@Override
	public List<BaseModule> getBaseModuleList(BaseModule baseModule){
		return mapper.getBaseModuleList(baseModule);
	}
	
}
