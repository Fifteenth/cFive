package com.example.back.controller;

import com.example.bean.Developer;
import com.example.service.DeveloperService;
import com.example.service.UserService;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * 用户请求处理器
 * Created by admin on 16/8/6.
 */
@Controller
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private DeveloperService developerService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String showHomePage(HttpServletRequest request) {
        try {
            List<Developer> fList = developerService.selectIDeveloper();
            JSONArray fArray = JSONArray.fromObject(fList);
            request.setAttribute("fArray",fArray);
        }catch (Exception e){
            logger.error(e.getLocalizedMessage(), e);
        }
        return "/main/main";
    }
}
