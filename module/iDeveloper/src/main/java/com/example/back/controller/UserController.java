package com.example.back.controller;

import com.example.bean.Developer;
import com.example.service.DeveloperService;
import com.example.service.UserService;
import net.sf.json.JSONArray;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


/**
 * 用户请求处理器
 * Created by admin on 16/8/6.
 */
@Controller
public class UserController {
//    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private DeveloperService developerService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String showHomePage(HttpServletRequest request) {
        try {
            List<Developer> fList = developerService.selectIDeveloper(null);
            List<String> fMenuItemList = new ArrayList<String>();
            for(int i=0;i<fList.size();i++){
                String fMenuItemName = fList.get(i).getTitle1();
                if(!fMenuItemList.contains(fMenuItemName)){
                    fMenuItemList.add(fMenuItemName);
                }
            }
            JSONArray fArray = JSONArray.fromObject(fList);
            JSONArray fMenuItemArray = JSONArray.fromObject(fMenuItemList);
            request.setAttribute("fArray",fArray);
            request.getSession().setAttribute("fMenuItemArray",fMenuItemArray);
        }catch (Exception e){
            logger.error(e.getLocalizedMessage(), e);
        }
        logger.debug("**************** Test ****************");
        return "/main/main1";
    }
}
