// 注意：一般清空下所有checkbox的name值都必须一样

// 全局Action，应用于以下方法
var actionValue;
// 全局Form，应用于以下方法
var formNameValue;
// 初始化当前页面的Action，Form
function doLoad(action, form) {
	actionValue = action;
	formNameValue = form;
}

/*
 * 打开新窗口，actionValue已在doLoad方法中初始化
 * param:链接地址中method部分
 * name:窗口的名称
 * width:窗口的宽度
 * height:窗口的高度
 * scrollbars:窗口是否有滚动条，1：有滚动条；0：没有滚动条
 */
function openWin(param, name, width, height, scrollbars) {
	sb = scrollbars == "1" ? "1" : "0";
	l = (screen.width - width) / 2;
	t = (screen.height - height) / 2;
	sFeatures = "left=" + l + ",top=" + t + ",height=" + height + ",width=" + width + ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0,resizable=1";
	var url = actionValue + "?" + param;
	openwin = window.open(url, name, sFeatures);
	if (!openwin.opener) {
		openwin.opener = self;
	}
	openwin.focus();
	return openwin;
}

/*
 * 打开新窗口，与上面的openWin实现同样的功能，但是链接地址形成的方式不一样
 * url:链接地址
 * name:窗口的名称
 * width:窗口的宽度
 * height:窗口的高度
 * scrollbars:窗口是否有滚动条，1：有滚动条；0：没有滚动条
 */
function openWinByURL(url, name, width, height, scrollbars) {
	sb = scrollbars == "1" ? "1" : "0";
	l = (screen.width - width) / 2;
	t = (screen.height - height) / 2;
	sFeatures = "left=" + l + ",top=" + t + ",height=" + height + ",width=" + width + ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0,resizable=1";
	openwin = window.open(url, name, sFeatures);
	if (!openwin.opener) {
		openwin.opener = self;
	}
	openwin.focus();
	return openwin;
}

/* 获取被选中的第一个checkbox
 * checkboxName checkbox的name值 
 * 如果选中的多条记录，则将value赋值为many
 */
function getFirstCheckedBox(checkboxName) {
	var value = "";
	var count = 0;
	var elements = document.getElementsByName(checkboxName);
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].checked) {
			value = elements[i].value;
			count = count + 1;
			//break;
		}
	}
	
	if (count>1) {
		value = "many";
	}
	return value;
}

/* 弹出修改页面
 * 其中method方法已固定为showEdit
 */
function edit(width, height, scrollbars) {
	var checkboxId = getFirstCheckedBox("checkbox");
	if (checkboxId == "") {
		alert("请您选中要修改的记录！");
	} else if (checkboxId == "many"){
		alert("一次只能修改一条记录！");
	} else {
		openWin("method=showEdit&checkbox=" + checkboxId, "修改", width, height, scrollbars);
	}
}

/* 删除记录，用于进入Action中的删除方法
 * 其中method方法已固定为delete
 */
function confirmDelete() {
	var checkboxId = getFirstCheckedBox("checkbox");
	if (checkboxId == "") {
		alert("请选择您要删除的记录！");
	} else {
		var del = confirm("您确认要删除吗?");
		if (del == true) {
			eval("document." + formNameValue).action = actionValue;
			eval("document." + formNameValue).method.value = "delete";
			eval("document." + formNameValue).submit();
		}
	}
}

/* 全选/取消全选 
* formName 所在form的name值 
* checkboxName checkbox的name值 
* 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
*/
var select;
function selectAll(check) {
	if(check) {
		select = true;
	} else {
		select = false;
	}
}

/* 检查是否有checkbox被选中 
* formName 所在form的name值 
* checkboxName checkbox的name值 
* 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
*/
function checkAll(checkboxName) {
	var elements = document.getElementsByName(checkboxName);
	var temp = document.getElementById("all");	
	
	if(select) {
		temp.checked = true;
 		for(var i=0; i<elements.length; i++) {
 			elements[i].checked = true;
 		}
 	} else {
	 	temp.checked = false;
 		for(var i=0; i<elements.length; i++) {
 			elements[i].checked = false;
 		}
	}
}

/*
 * 清空所有的查询输入框
 */
function doClear(formNameValue) {
	for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		var element = eval("document." + formNameValue + ".elements[" + i + "]");
		if (element.type == "text") { //清空所有输入框
			element.value = "";
		}
		
		if (element.type == "select") {
			element.selectedIndex = 0;
		}
	}
}

//删除字符串中所有的空格
function ignoreSpaces(string) {
	var temp = "";
	string = '' + string;
	splitstring = string.split(" ");
	for(i = 0; i < splitstring.length; i++) {
		temp += splitstring[i];
	}
	return temp;
}
			
//删除字符串中左右两端的空格
function trim(str){ 
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

// 精确到小数点后2位小数
function formatNum(srcStr) {
	var srcStr;
	var nAfterDot=2;
	var resultStr,nTen;
	srcStr = ""+srcStr+"";
	strLen = srcStr.length;
	dotPos = srcStr.indexOf(".",0);
	if (dotPos == -1) {
		resultStr = srcStr+".";
		for (i=0;i<nAfterDot;i++) {
			resultStr = resultStr+"0";
		}
	}else{
		if ((strLen - dotPos - 1) >= nAfterDot){
			nAfter = dotPos + nAfterDot + 1;
			nTen =1;
			for(j=0;j<nAfterDot;j++){
				nTen = nTen*10;
			}
			resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
		}else{
			resultStr = srcStr;
			for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
				resultStr = resultStr+"0";
			}
		}
	}
	
	return resultStr;
} 

// 用于选择每页显示的记录数
function selectPagesize(field){
 	document.location.href = document.all.firstpageurl.href + "&pagesize="+field.value;
}