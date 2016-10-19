// ע�⣺һ�����������checkbox��nameֵ������һ��

// ȫ��Action��Ӧ�������·���
var actionValue;
// ȫ��Form��Ӧ�������·���
var formNameValue;
// ��ʼ����ǰҳ���Action��Form
function doLoad(action, form) {
	actionValue = action;
	formNameValue = form;
}

/*
 * ���´��ڣ�actionValue����doLoad�����г�ʼ��
 * param:���ӵ�ַ��method����
 * name:���ڵ�����
 * width:���ڵĿ��
 * height:���ڵĸ߶�
 * scrollbars:�����Ƿ��й�������1���й�������0��û�й�����
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
 * ���´��ڣ��������openWinʵ��ͬ���Ĺ��ܣ��������ӵ�ַ�γɵķ�ʽ��һ��
 * url:���ӵ�ַ
 * name:���ڵ�����
 * width:���ڵĿ��
 * height:���ڵĸ߶�
 * scrollbars:�����Ƿ��й�������1���й�������0��û�й�����
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

/* ��ȡ��ѡ�еĵ�һ��checkbox
 * checkboxName checkbox��nameֵ 
 * ���ѡ�еĶ�����¼����value��ֵΪmany
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

/* �����޸�ҳ��
 * ����method�����ѹ̶�ΪshowEdit
 */
function edit(width, height, scrollbars) {
	var checkboxId = getFirstCheckedBox("checkbox");
	if (checkboxId == "") {
		alert("����ѡ��Ҫ�޸ĵļ�¼��");
	} else if (checkboxId == "many"){
		alert("һ��ֻ���޸�һ����¼��");
	} else {
		openWin("method=showEdit&checkbox=" + checkboxId, "�޸�", width, height, scrollbars);
	}
}

/* ɾ����¼�����ڽ���Action�е�ɾ������
 * ����method�����ѹ̶�Ϊdelete
 */
function confirmDelete() {
	var checkboxId = getFirstCheckedBox("checkbox");
	if (checkboxId == "") {
		alert("��ѡ����Ҫɾ���ļ�¼��");
	} else {
		var del = confirm("��ȷ��Ҫɾ����?");
		if (del == true) {
			eval("document." + formNameValue).action = actionValue;
			eval("document." + formNameValue).method.value = "delete";
			eval("document." + formNameValue).submit();
		}
	}
}

/* ȫѡ/ȡ��ȫѡ 
* formName ����form��nameֵ 
* checkboxName checkbox��nameֵ 
* ע�⣺����checkbox��nameֵ������һ�����������ܴﵽȫѡ��Ч�� 
*/
var select;
function selectAll(check) {
	if(check) {
		select = true;
	} else {
		select = false;
	}
}

/* ����Ƿ���checkbox��ѡ�� 
* formName ����form��nameֵ 
* checkboxName checkbox��nameֵ 
* ע�⣺����checkbox��nameֵ������һ�����������ܴﵽȫѡ��Ч�� 
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
 * ������еĲ�ѯ�����
 */
function doClear(formNameValue) {
	for (var i = 0; i < eval("document." + formNameValue + ".elements").length; i++) {
		var element = eval("document." + formNameValue + ".elements[" + i + "]");
		if (element.type == "text") { //������������
			element.value = "";
		}
		
		if (element.type == "select") {
			element.selectedIndex = 0;
		}
	}
}

//ɾ���ַ��������еĿո�
function ignoreSpaces(string) {
	var temp = "";
	string = '' + string;
	splitstring = string.split(" ");
	for(i = 0; i < splitstring.length; i++) {
		temp += splitstring[i];
	}
	return temp;
}
			
//ɾ���ַ������������˵Ŀո�
function trim(str){ 
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

// ��ȷ��С�����2λС��
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

// ����ѡ��ÿҳ��ʾ�ļ�¼��
function selectPagesize(field){
 	document.location.href = document.all.firstpageurl.href + "&pagesize="+field.value;
}