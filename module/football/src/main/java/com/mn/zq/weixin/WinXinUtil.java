package com.mn.zq.weixin;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;


public class WinXinUtil {

	public static ReceiveXmlEntity getReceiveXmlEntity(InputStream inputStream) throws Exception{
		
		StringBuffer sb = new StringBuffer();  
        InputStreamReader isr = new InputStreamReader(inputStream, "UTF-8");  
        BufferedReader br = new BufferedReader(isr);  
        String s = "";  
        while ((s = br.readLine()) != null) {  
            sb.append(s);  
        }  
        String message = sb.toString(); //次即为接收到微信端发送过来的xml数据  
        
        System.out.println("message:" + message);
        
        ReceiveXmlEntity receiveXmlEntity = new ReceiveXmlProcess().getMsgEntity(message); 
        
        return receiveXmlEntity;
	}
	
}
