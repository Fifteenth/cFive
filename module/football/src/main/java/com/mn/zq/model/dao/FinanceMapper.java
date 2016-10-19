package com.mn.zq.model.dao;

import java.util.List;

import com.mn.zq.model.Finance;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;



public interface FinanceMapper{
	
	@Select("SELECT * FROM FOOTBALL_FINANCE")
	@ResultMap("financeResultMap")
	public List<Finance> getFinance();
	
	public List<Finance> getFinanceById(String id);
	
//	public void saveFinance(Finance finance);
	
	@Insert("INSERT INTO FOOTBALL_FINANCE(NUMBER,NAME,AMOUNT,DESCRIPITION,CURRENTTIME,TYPE) VALUES(#{number},#{name},#{amount},#{descripition},#{currentTime},#{type})")
	public void saveFinance(Finance finance);
	
	@Delete("DELETE FROM FOOTBALL_FINANCE WHERE NUMBER=#{number}")
	public void deleteFinance(String number);
	
	@Update("UPDATE FOOTBALL_FINANCE SET [NAME]=#{name} WHERE NUMBER=#{number}")
	public void updateFinance(Finance finance);
}
