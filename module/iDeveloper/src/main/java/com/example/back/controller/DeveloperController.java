package com.example.back.controller;

import com.example.bean.Developer;
import com.example.bean.DeveloperLink;
import com.example.service.DeveloperLinkService;
import com.example.service.DeveloperService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    private DeveloperLinkService developerLinkService;

    @RequestMapping(value = "/addPage", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String showDeveloperAddPage(HttpServletRequest request) {
        return "/developer/addPage";
    }

    @RequestMapping(value = "/query/{type}/{value}", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String showHomePage(HttpServletRequest request,
                               @PathVariable("type") String type,
                               @PathVariable("value") String value) {
        try {
            Developer developer = new Developer();
            if("navigation".equals(type)){
                developer.setTitle1(value);
            }else if("group".equals(type)){
                developer.setTitle2(value);
            }else if("popular".equals(type)){
                developer.setTitle3(value);
            }
            List<Developer> fList = developerService.selectIDeveloper(developer);
            JSONArray fArray = JSONArray.fromObject(fList);
            request.setAttribute("fArray",fArray);
        }catch (Exception e){
        }
        return "/main/main1";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public @ResponseBody
    String developerAdd(HttpServletRequest request) {
        String title1 = request.getParameter("title1");
        String title2 = request.getParameter("title2");
        String title3 = request.getParameter("title3");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String link = request.getParameter("link");
        Developer developer = new Developer();
        developer.setTitle1(title1);
        developer.setTitle2(title2);
        developer.setTitle3(title3);
        developer.setName(name);
        developer.setDescription(description);
        developer.setLink(link);
        developerService.saveIDeveloper(developer);
        return "{\"result\":\"success\"}";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public @ResponseBody
    String developerUpdate(HttpServletRequest request) {
        String id = request.getParameter("id");
        String title1 = request.getParameter("title1");
        String title2 = request.getParameter("title2");
        String title3 = request.getParameter("title3");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String link = request.getParameter("link");
        Developer developer = new Developer();
        developer.setId(id);
        developer.setTitle1(title1);
        developer.setTitle2(title2);
        developer.setTitle3(title3);
        developer.setName(name);
        developer.setDescription(description);
        developer.setLink(link);
        developerService.updateDeveloper(developer);
        return "{\"result\":\"success\"}";
    }

    @RequestMapping(value = "/viewPage/{iDeveloperId}", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String viewPage(HttpServletRequest request, @PathVariable("iDeveloperId") String iDeveloperId) {
        try {
            Developer fModel = developerService.selectIDeveloperById(iDeveloperId);
            request.setAttribute("fModel",fModel);

        }catch (Exception e){
            e.getStackTrace();
        }
        return "/developer/viewPage";
    }

    @RequestMapping(value = "/viewLink/{iDeveloperId}", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")// isAuthenticated 如果用户不是匿名用户就返回true
    public String viewLink(HttpServletRequest request, @PathVariable("iDeveloperId") String iDeveloperId) {
        try {
            List<DeveloperLink> fList = developerLinkService.selectIDeveloperLinkByIDeveloperiD(iDeveloperId);
            request.setAttribute("fList",fList);

        }catch (Exception e){
            e.getStackTrace();
        }
        return "/developer/viewLink";
    }

}
