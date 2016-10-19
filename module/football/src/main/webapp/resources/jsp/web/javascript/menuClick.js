

/**
 * 
 * 下拉菜单处理事件.
 * 一.如果是只有一个iframe页面的,传递一个参数进来即可,例如:menuClick('depoMedicineDetails.do?method=showHead');
 * 二.两个iframe页面,传递两个页面的action,例如:menuClick('depoMedicineDetails.do?method=showHead','depoMedicineDetails.do?method=showBottom');
 * 三.如需要设置iframe的height,只需要传递修改后的head iframe的height进来即可. 例如:menuClick('depoMedicineDetails.do?method=showHead','depoMedicineDetails.do?method=showBottom',30)
 * 四.这次修改对原先的没有任何影响 
 * 
 * @author chenpeng
 * @param headAction	head的src
 * @param bottomAction  bottom的src
 * @param headHeight 需要调整后的head的高度,bottom的高度会随之而改变
 * 
 */
 function menuClick(headAction,bottomAction,headHeight){
 	
 	
 	//目的是点击当前模块时刷新一次
 	$("#bottom").attr("src","");
 	$("#head").attr("src","");
 	if(bottomAction==null)
 	{
 		$("#head").attr("height","0");
 		$("#bottom").attr("height","305");
 		$("#bottom").attr("src",headAction);
 	}
 	else
 	{
 		
 		if(headHeight==null)
 		{
 			headHeight=30;
 		}
 		$("#head").attr("height",headHeight);
 		$("#bottom").attr("height",305-headHeight);
	 	$("#bottom").attr("src",bottomAction);
	 	$("#head").attr("src",headAction);
 	}
 	
 }
 
