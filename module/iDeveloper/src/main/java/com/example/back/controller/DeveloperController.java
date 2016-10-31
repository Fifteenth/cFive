package com.example.back.controller;

import com.example.bean.Developer;
import com.example.service.DeveloperService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by hengqiangcao on 30/10/16.
 */
@Controller
public class DeveloperController {

    @Autowired
    private DeveloperService developerService;

    @RequestMapping(value = "/addPage", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String showDeveloperAddPage(HttpServletRequest request) {
        return "/developer/addPage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public @ResponseBody
    String developerAdd(HttpServletRequest request) {
        return "{\"aa\":\"bb\"}";
    }

}
