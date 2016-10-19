package com.mn.zq.service;

import java.util.List;

import com.mn.zq.model.Finance;


public interface IFinanceService {
	
	public List<Finance> getFinance();
	
	public List<Finance> getFinanceById(String id);

	public void saveFinance(Finance finance);
	
	public void deleteFinance(String number);
	
	public void updateFinance(Finance finance);
}
