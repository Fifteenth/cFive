
var formNameValue;
/*��ʼ״̬*/
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
/*�����ɹ�ʱ*/
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
/*�������*/
function Clear() {
	doLoadInput(formNameValue);
		for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		  var element = eval("document." + formNameValue + ".elements[" + i + "]");
		  if(element.type == "text") //������������
		  {
		  	element.value="";
		  }
	}
}
/*��������*/
function Cnew() {
	doLoadInput(formNameValue);//�ָ�����ʼ��״̬
}
/*�޸�*/
function Modify() {
	doLoadInput(formNameValue);
	eval("document." + formNameValue).state.value = "modify";//��״̬���Ϊ���޸ġ�״̬
}

/*���ھ��������е��޸İ�ť*/
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
