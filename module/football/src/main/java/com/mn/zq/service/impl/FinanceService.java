package com.mn.zq.service.impl;

import java.util.List;

import com.mn.zq.model.Finance;
import com.mn.zq.model.dao.FinanceMapper;
import com.mn.zq.service.IFinanceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("financeService")
public class FinanceService implements IFinanceService{
	
	@Autowired   
	private FinanceMapper financeMapper;
	
//	public FinanceMapper getFinanceMapper() {
//		return financeMapper;
//	}
//
//	@Autowired     
//	public void setFinanceMapper(FinanceMapper financeMapper) {
//		this.financeMapper = financeMapper;
//	}

	public List<Finance> getFinance(){
		return financeMapper.getFinance();
	}

	@Override
	public List<Finance> getFinanceById(String number) {
		return financeMapper.getFinanceById(number);
	}
	
	@Override
	public void saveFinance(Finance finance) {
		financeMapper.saveFinance(finance);
	}
	
	@Override
	public void deleteFinance(String number) {
		financeMapper.deleteFinance(number);
	}
	
	@Override
	public void updateFinance(Finance finance){
		financeMapper.updateFinance(finance);
	}
	
}
