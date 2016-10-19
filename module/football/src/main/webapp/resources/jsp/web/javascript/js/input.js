
var formNameValue;
/*初始状态*/
function doLoadInput(formName) {

	formNameValue = formName;
	for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		eval("document." + formNameValue + ".elements[" + i + "]").disabled = false;
	}
	document.all.CyNew.disabled = true;
	document.all.Reset.disabled = true;
	document.all.Edit.disabled = true;
	document.all.Submit.disabled = false;
}
/*操作成功时*/
function doBack(formName) {
	for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		eval("document." + formNameValue + ".elements[" + i + "]").disabled = true;
	}
	document.all.CyNew.disabled = false;
	document.all.Reset.disabled = false;
	document.all.Edit.disabled = false;
	document.all.Submit.disabled = true;
	document.all.Close.disabled = false;
}
/*清空新增*/
function Clear() {
	doLoadInput(formNameValue);
		for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		  var element = eval("document." + formNameValue + ".elements[" + i + "]");
		  if(element.type == "text") //清空所有输入框
		  {
		  	element.value="";
		  }
	}
}
/*复制新增*/
function Cnew() {
	doLoadInput(formNameValue);//恢复到初始化状态
}
/*修改*/
function Modify() {
	doLoadInput(formNameValue);
	eval("document." + formNameValue).state.value = "modify";//讲状态标记为“修改”状态
}

/*用于救助参数中的修改按钮*/
function doModify1() {
	for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		var element = eval("document." + formNameValue + ".elements[" + i + "]");
		if(element.type == "text" || element.type == "hidden" || element.type == "radio") {
		  	element.disabled = false;
		}
	}
	
	if (eval("document." + formNameValue + ".elements[" + 10 + "]").value == "") {
		eval("document." + formNameValue + ".elements[" + 10 + "]").disabled = true;
	}
	
	document.all.CyNew.disabled = true;
	document.all.Reset.disabled = true;
	document.all.Edit.disabled = true;
	document.all.Submit.disabled = false;
	eval("document." + formNameValue).state.value = "modify";
}
