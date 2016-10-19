package com.mn.zq.model.dao;

import java.util.List;

import com.mn.menu.model.BaseModule;

public interface BaseModuleMapper extends SqlMapper {
	
	public List<BaseModule> getBaseModuleList(BaseModule baseModule);

}
