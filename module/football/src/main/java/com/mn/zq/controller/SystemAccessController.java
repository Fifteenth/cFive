package com.mn.zq.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mn.zq.model.League;
import com.mn.zq.model.Scorer;
import com.mn.zq.model.SystemAccess;
import com.mn.zq.service.ILeagueService;
import com.mn.zq.service.IScorersService;
import com.mn.zq.service.ISystemAccessService;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("system")
public class SystemAccessController {

	@Autowired
	private ISystemAccessService systemAccessService;
	@Autowired
	private ILeagueService leagueService;
	@Autowired
	private IScorersService scorersService;
	
	@RequestMapping(value = "/getAccessCount", method = RequestMethod.GET)
	public @ResponseBody
	int getAccessCount(){
		return systemAccessService.getCount();
	}
	
	@RequestMapping(value = "/getLastSystemAccess", method = RequestMethod.GET)
	public @ResponseBody
	SystemAccess getLastSystemAccess(){
		return systemAccessService.getLastSystemAccess();
	}
	
	@RequestMapping(value = "/getLast10SystemAccess", method = RequestMethod.GET)
	public @ResponseBody
	List <SystemAccess> getLast10SystemAccess(){
		List <SystemAccess> systemAccessList = systemAccessService.getLast10SystemAccess();
//		int count = systemAccessService.getCount();
//		
//		JSONObject resultJson = new JSONObject();
//		resultJson.put("count", count);
//		resultJson.put("jsonArray", systemAccessList);
//		
//		String result = resultJson.toString();
//		
//		JSONObject json = JSONObject.fromObject(result);
//		count = (Integer)(json.get("count"));
//		JSONArray jsonArray = (JSONArray)json.get("jsonArray");
		
		return systemAccessList;
	}
	
	@RequestMapping(value = "/exportLeagueData", method = RequestMethod.POST)
	public @ResponseBody
	String exportLeagueData(HttpServletRequest request){

		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;  
		
		MultipartFile file = mulRequest.getFile("excelLeague");
		String filename = file.getOriginalFilename();
		if (filename == null 
				|| "".equals(filename)
				|| (!filename.endsWith(".xls") && (!filename.endsWith(".xlsx"))))
		{
			return "fail upload!";
		}
		try
		{
			InputStream input = file.getInputStream();
			if(filename.endsWith(".xls")){
				HSSFWorkbook wookbook = new HSSFWorkbook(input);
				HSSFSheet sheet0 = wookbook.getSheetAt(0);
				if (sheet0 != null){
					
					// 1
					List<League> listLeague = new ArrayList<League>();
					
					for (int i = 3; i < sheet0.getLastRowNum(); i++){
						System.out.println("i:" + i);
						
						HSSFRow row = sheet0.getRow(i);
						
						if(row == null){
							break;
						}
						
						HSSFCell cell0 = row.getCell(0);
						HSSFCell cell1 = row.getCell(1);
						HSSFCell cell2 = row.getCell(2);
						HSSFCell cell3 = row.getCell(3);
						HSSFCell cell4 = row.getCell(4);
						HSSFCell cell5 = row.getCell(5);
						HSSFCell cell6 = row.getCell(6);
						HSSFCell cell7 = row.getCell(7);
						HSSFCell cell8 = row.getCell(8);
						HSSFCell cell9 = row.getCell(9);
						HSSFCell cell10 = row.getCell(10);
						HSSFCell cell11 = row.getCell(11);
						
						int cellStr0 = (int) cell0.getNumericCellValue();
						String cellStr1 = cell1.toString();
						int cellStr2 = (int) cell2.getNumericCellValue();
						int cellStr3 = (int) cell3.getNumericCellValue();
						int cellStr4 = (int) cell4.getNumericCellValue();
						int cellStr5 = (int) cell5.getNumericCellValue();
						int cellStr6 = (int) cell6.getNumericCellValue();
						int cellStr7 = (int) cell7.getNumericCellValue();
						int cellStr8 = (int) cell8.getNumericCellValue();
						int cellStr9 = (int) cell9.getNumericCellValue();
						int cellStr10 = (int) cell10.getNumericCellValue();
						int cellStr11 = (int) cell11.getNumericCellValue();
						League league = new League();
						league.setSeason("2015A");
						league.setNumber(Integer.valueOf(cellStr0));
						league.setClub(cellStr1);
						league.setWin(Integer.valueOf(cellStr2));
						league.setDraw(Integer.valueOf(cellStr3));
						league.setLose(Integer.valueOf(cellStr4));
						league.setGoalEnter(Integer.valueOf(cellStr5));
						league.setGoalLose(Integer.valueOf(cellStr6));
						league.setGoalDifference(Integer.valueOf(cellStr7));
						league.setIntegration(Integer.valueOf(cellStr8));
						league.setCardYellow(Integer.valueOf(cellStr9));
						league.setCardRed(Integer.valueOf(cellStr10));
						league.setRound(Integer.valueOf(cellStr11));
						
						listLeague.add(league);
					}
					
					
					
					for(int i=0;i<listLeague.size();i++){
						leagueService.saveLeague(listLeague.get(i));
					}
					
				}
				
				HSSFSheet sheet1 = wookbook.getSheetAt(1);
				if (sheet1 != null){
					
					// 2
					List<Scorer> listScorers = new ArrayList<Scorer>();
					
					for (int i = 3; i < sheet1.getLastRowNum(); i++){
						System.out.println("i:" + i);
						
						HSSFRow row = sheet1.getRow(i);
						
						if(row == null){
							break;
						}
						
						HSSFCell cell0 = row.getCell(0);
						HSSFCell cell1 = row.getCell(1);
						HSSFCell cell2 = row.getCell(2);
						HSSFCell cell3 = row.getCell(3);
						HSSFCell cell4 = row.getCell(4);
						
						int cellStr0 = (int) cell0.getNumericCellValue();
						String cellStr1 = cell1.toString();
						int cellStr2 = (int) cell2.getNumericCellValue();
						int cellStr3 = (int) cell3.getNumericCellValue();
						String cellStr4 =  cell4.toString();
						
						Scorer scorer = new Scorer();
						scorer.setSeason("2015A");
						scorer.setRanking(cellStr0);
						scorer.setClub(cellStr1);
						scorer.setNumber(Integer.valueOf(cellStr2));
						scorer.setCount(Integer.valueOf(cellStr3));
						scorer.setName(cellStr4);
						listScorers.add(scorer);
					}
					
					for(int i=0;i<listScorers.size();i++){
						scorersService.saveScorer(listScorers.get(i));
					}
				}
				wookbook.close();
				
				return "xls upload successed";
			}else if(filename.endsWith(".xlsx")){
				XSSFWorkbook wookbook = new XSSFWorkbook(input);
				XSSFSheet sheet = wookbook.getSheetAt(0);
				if (sheet != null)
				{
					for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++)
					{
						XSSFRow row = sheet.getRow(i);
						for (int j = 0; j < row.getPhysicalNumberOfCells(); j++)
						{
							XSSFCell cell = row.getCell(j);
							String cellStr = cell.toString();
							System.out.print("【"+cellStr+"】 ");
						}
						System.out.println();
					}
					wookbook.close();
				}
				return "xlsx upload successed";
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "upload failed";
	}
	
	
}
