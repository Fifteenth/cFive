package com.mn.zq.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mn.zq.model.Finance;
import com.mn.zq.service.IFinanceService;
import com.mn.zq.weixin.FormatXmlProcess;
import com.mn.zq.weixin.ReceiveXmlEntity;
import com.mn.zq.weixin.WinXinUser;
import com.mn.zq.weixin.WinXinUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WinXinController {
	@Autowired
	private IFinanceService financeService;
	private Map<String,WinXinUser> WinXinUserMap;
	
	@RequestMapping(value = "/weixin", method = RequestMethod.GET)
	public @ResponseBody
	String playerRead1(HttpServletRequest request) {
		String echostr = request.getParameter("echostr");  
		if(echostr == null){
			return "123456";
		}
		return echostr;
	}
	
	@RequestMapping(value = "/weixin", method = RequestMethod.POST)
	public @ResponseBody
	void playerRead2(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String result = null;
		String resultContext = null;
		ReceiveXmlEntity receiveXmlEntity = null;
		try {
			// Get ReceiveXmlEntity
			receiveXmlEntity = WinXinUtil.getReceiveXmlEntity(request.getInputStream());
			
			WinXinUser winXinUser;
			String userName = receiveXmlEntity.getFromUserName();
			if(WinXinUserMap == null){
				WinXinUserMap = new HashMap<String,WinXinUser>();
			}
			if(WinXinUserMap.containsKey(userName)){
				winXinUser = (WinXinUser)WinXinUserMap.get(userName);
			}else{
				winXinUser = new WinXinUser();
				winXinUser.setUserId(userName);
				WinXinUserMap.put(userName,winXinUser);
			}
			
			setSessionPosition(winXinUser, receiveXmlEntity);
			
			// Log:show action
			System.out.println("Action:"+winXinUser.getAction());
			
			// Get Result
			resultContext = getResult(winXinUser);
			// 
					
			result = new FormatXmlProcess().formatXmlAnswer(
							receiveXmlEntity.getFromUserName(),receiveXmlEntity.getToUserName(), resultContext);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

//		System.out.println("-------:" + result);
		
//		result = 
//					"<xml>" + 				  
//					    "<ToUserName><![CDATA[oCxcIuNAKEqp0CT06GUiGnggLB90]]></ToUserName>" + 
//					    "<FromUserName><![CDATA[gh_6f2f20b6acf4]]></FromUserName>" + 
//					    "<CreateTime>1428238127277</CreateTime>" + 
//					    "<MsgType><![CDATA[event]]></MsgType>" + 
//					    "<Event><![CDATA[scancode_push]]></Event>" + 
//					    "<EventKey><![CDATA[rselfmenu_0_1]]></EventKey>" + 
//					    "<ScanCodeInfo>" + 
//					        "<ScanType><![CDATA[qrcode]]></ScanType>" + 
//					        "<ScanResult><![CDATA[http://weixin.qq.com/r/pUNnf4HEX9wgrcUc9xa3]]></ScanResult>" + 
//					        "<EventKey><![CDATA[rselfmenu_0_1]]></EventKey>" + 
//					    "</ScanCodeInfo>" + 
//					"</xml>";
		
		
		result = 
				"<xml>" + 
			    "<ToUserName><![CDATA[oCxcIuNAKEqp0CT06GUiGnggLB90]]></ToUserName>" + 
			    "<FromUserName><![CDATA[ojpX_jig-gh_6f2f20b6acf4]]></FromUserName>" + 
			    "<CreateTime>1412075435</CreateTime>" + 
			    "<MsgType><![CDATA[event]]></MsgType>" + 
			    "<Event><![CDATA[scancode_waitmsg]]></Event>" + 
			    "<EventKey><![CDATA[rselfmenu_0_0]]></EventKey>" + 
			    "<ScanCodeInfo>" + 
			        "<ScanType><![CDATA[qrcode]]></ScanType>" + 
			        "<ScanResult><![CDATA[http://weixin.qq.com/r/pUNnf4HEX9wgrcUc9xa3]]></ScanResult>" + 
			        "<EventKey><![CDATA[rselfmenu_0_0]]></EventKey>" + 
			    "</ScanCodeInfo>" + 
			"</xml>";
		
		result = 
				"<xml>" +
					"<ToUserName><![CDATA[oCxcIuNAKEqp0CT06GUiGnggLB90]]></ToUserName>" +
					"<FromUserName><![CDATA[gh_6f2f20b6acf4]]></FromUserName>" +
					"<CreateTime>1428239264511</CreateTime>" +
					"<MsgType><![CDATA[text]]></MsgType>" +
//					"<Content><![CDATA[导航提示：\n1.查询病人信息\n2.登记病人信息\n3.入院管理\n4.出院管理]]></Content>" +
//					"<Content><![CDATA[扫描成功，数据已提交]]></Content>" +
					"<Content><![CDATA[请输入病例号：]]></Content>" +
					"<FuncFlag>0</FuncFlag>" +
				"</xml>";
		
		// Out Put Result
		try {
			OutputStream os = response.getOutputStream();
			os.write(result.getBytes("UTF-8"));
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getResult(WinXinUser winXinUser){
		String action = winXinUser.getAction();
		
		// 
//		String result = "";
		String contentResutl = "";
		if(action.equals("A") || action.equals("a")){
			contentResutl = "1.AC米兰\n" + 
					"2.国际米兰\n" + 
					"3.皇家马德里\n" + 
					"4.巴塞罗那\n" + 
					"5.拜仁慕尼黑\n" + 
					"6.码农\n" + 
					"7.朝九晚五\n" + 
					"8.高次元" ;
		}else if(action.equals("B") || action.equals("b")){
			contentResutl = "周日    12:00     码农 VS 朝九晚五";
		}else if(action.equals("C") || action.equals("c")){
			contentResutl = "+1 参加\n" +
					"-1 缺席\n" + 
					"请确认?";
		}else if(action.equals("D") || action.equals("d")){
			contentResutl = "2014.02.01 缴费：50\n" + 
					"2014.02.01 缴费：50\n" +
					"2014.03.01 缴费：50\n" +
					"2014.04.01 缴费：50\n" +
					"2014.05.01 缴费：50\n" +
					"2014.06.01 缴费：50\n" +
					"2014.07.01 缴费：50\n" +
					"剩余队费：150";
		}else if(action.equals("E") || action.equals("e")){
			contentResutl = "请入金额：";
		}else if((action.startsWith("E->")||action.startsWith("e->"))){
			if(action.equals("E->N")||
					action.equals("E->n")||
					action.equals("e->n")||
					action.equals("e->N")){
				contentResutl = "已退出";
				winXinUser.setAction(null);
			}else{
				String actionArray[] = action.split("->");
				String amountString = actionArray[1];
				try{
					Integer.valueOf(amountString);
					contentResutl = "已确认完成";
					winXinUser.setAction(null);
					
					//
					Finance financeTO = new Finance();
					financeTO.setNumber("15");
					financeTO.setAmount(amountString);
					financeTO.setCurrentTime("");
					financeTO.setDescripition("缴费");
					financeTO.setName("曹五");
					financeTO.setType("+");
					financeService.saveFinance(financeTO);
				}catch(Exception e){
					contentResutl = "请输入数字...\n"+
							"退出输入【N】";
					winXinUser.setAction(actionArray[0]);
				}
			}
		}
		else{
			contentResutl = "【A】 查看联赛信息\n" +
					"【B】 查看本周比赛时间\n" +
					"【C】 比赛报名\n" +
					"【D】 查看队费\n" +
					"【E】 确认缴队费";
			
			// 重置
			winXinUser.setAction(null);
		}	
		return contentResutl;
	}
	
	
	public static void setSessionPosition(WinXinUser winXinUser,ReceiveXmlEntity receiveXmlEntity){
		String actionNew = receiveXmlEntity.getContent();
		String actionOld = winXinUser.getAction();
		if(actionOld == null){
			winXinUser.setAction(actionNew);
		}else{
			winXinUser.setAction(actionOld + "->" + actionNew);
		}
	}

}
