package com.mn.menu;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.mn.menu.model.BaseModule;
import com.mn.menu.service.IBaseModuleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private IBaseModuleService baseModuleService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String webIndex(HttpServletRequest request){
		
		BaseModule baseModule = new BaseModule();
		baseModule.setHead("1");
		
		List<BaseModule> list = baseModuleService.getBaseModuleList(baseModule);
		for(int i=0;i<list.size();i++){
			BaseModule baseModuleParent = list.get(i);
			Set<BaseModule> childrenSet = new HashSet<BaseModule>();
			for(int j=0;j<list.size();j++){
				BaseModule baseModuleChild = list.get(j);
				if(baseModuleParent.getId().equals(baseModuleChild.getParentId())){
					childrenSet.add(baseModuleChild);
				}
			}
			baseModuleParent.setChildren(childrenSet);
		}
		
//		List<BaseModule> list = new ArrayList<BaseModule>();
//		BaseModule baseModule1 = new BaseModule();
//		baseModule1.setId(17010525);
//		baseModule1.setParentId(0);
////		baseModule1.setUrl("www.");
//		baseModule1.setName("民政办公系统");
//		
//		BaseModule baseModule11 = new BaseModule();
//		baseModule11.setId(17010560);
//		baseModule11.setParentId(17010525);
////		baseModule11.setUrl("www.");
//		baseModule11.setName("工作流管理");
//		
//		BaseModule baseModule12 = new BaseModule();
//		baseModule12.setId(12);
//		baseModule12.setParentId(17010525);
////		baseModule11.setUrl("www.");
//		baseModule12.setName("12");
//		
//		BaseModule baseModule111 = new BaseModule();
//		baseModule111.setId(17010718);
//		baseModule111.setParentId(17010560);
////		baseModule111.setUrl("www.");
//		baseModule111.setName("17010560");
//		
//		BaseModule baseModule2 = new BaseModule();
//		baseModule2.setId(17010709);
//		baseModule2.setParentId(0);
////		baseModule2.setUrl("www.");
//		baseModule2.setName("民政救助系统");
//		
//		BaseModule baseModule21 = new BaseModule();
//		baseModule21.setId(21);
//		baseModule21.setParentId(17010709);
////		baseModule2.setUrl("www.");
//		baseModule21.setName("21");
//		
//		Set<BaseModule> set1 = new HashSet<BaseModule>();
//		Set<BaseModule> set11 = new HashSet<BaseModule>();
//		Set<BaseModule> set2 = new HashSet<BaseModule>();
//		
//		set1.add(baseModule11);
//		set1.add(baseModule12);
//		set11.add(baseModule111);
//		set2.add(baseModule21);
//		
//		list.add(baseModule1);
//		list.add(baseModule11);
//		list.add(baseModule12);
//		list.add(baseModule111);
//		list.add(baseModule2);
//		list.add(baseModule21);
		
		request.setAttribute("modules", list);
		return "menu/leftmenuscontent";
	}
	
	
	@RequestMapping(value = "/getData", method = RequestMethod.GET)
	public @ResponseBody
	BaseModule getData(){
		
		BaseModule baseModule = new BaseModule();
		
		baseModule.setId(17010525);
		baseModule.setName("民政办公系统");
		
		return baseModule;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request){
		
		return "menu/index";
	}

}