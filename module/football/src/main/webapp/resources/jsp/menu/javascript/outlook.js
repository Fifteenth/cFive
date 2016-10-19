
/*--------------------------------------------------|
| Copyright (c) 2009 haibo zhou              |
|                                                   |
|--------------------------------------------------*/

// Node object
function Node(id, pid, name, url, title, target, icon, iconOpen, open) {
	this.id = id;
	this.pid = pid;
	this.name = name;
	this.url = url;
	this.title = title;
	this.target = target;
	this.icon = icon;
	this.iconOpen = iconOpen;
	this._io = true || false;
	this._is = false;
	this._ls = false;
	this._hc = false;  //have children
	this._ai = 0;
	this._p;    // parent
}

// Tree object
function dTree(objName) {
	this.config = {target:null, folderLinks:true, useSelection:true, useCookies:false, useLines:true, useIcons:false, useStatusText:false, closeSameLevel:false, inOrder:false};
	this.icon = {empty:"../resources/jsp/menu/images/outlook/empty.jpg", line:"../resources/jsp/menu/images/outlook/line.jpg", join:"../resources/jsp/menu/images/outlook/join.jpg", joinBottom:"../resources/jsp/menu/images/outlook/joinbottom.jpg", plus:"../resources/jsp/menu/images/outlook/plus.jpg", plusBottom:"../resources/jsp/menu/images/outlook/plusbottom.jpg", minus:"../resources/jsp/menu/images/outlook/minus.jpg", minusBottom:"../resources/jsp/menu/images/outlook/minusbottom.jpg", nlPlus:"../resources/jsp/menu/images/outlook/nolines_plus.gif", nlMinus:"../resources/jsp/menu/images/outlook/nolines_minus.gif"};
	this.obj = objName;
	this.aNodes = [];
	this.aIndent = [];
	this.root = new Node(0);
	this.selectedNode = null;
	this.selectedFound = false;
	this.completed = false;
}

// Adds a new node to the node array
dTree.prototype.add = function (id, pid, name, url, title, target, icon, iconOpen, open) {

	this.aNodes[this.aNodes.length] = new Node(id, pid, name, url, title, target, icon, iconOpen, open);
};

// Open/close all nodes
dTree.prototype.openAll = function () {
	this.oAll(true);
};
dTree.prototype.closeAll = function () {
	this.oAll(false);
};

// Outputs the tree to the page
dTree.prototype.toString = function () {
	var str = "<div class=\"dtree\">\n";
	if (document.getElementById) {
		if (this.config.useCookies) {
			this.selectedNode = this.getSelected();
		}
		str += this.addNode(this.root);
	} else {
		str += "Browser not supported.";
	}
	str += "</div>";
	if (!this.selectedFound) {
		this.selectedNode = null;
	}
	this.completed = true;

	return str;
};

// Creates the tree structure
dTree.prototype.addNode = function (pNode) {

	var str = "";
	var n = 0;
	if (this.config.inOrder) {

		n = pNode._ai;
	}

	for (n; n < this.aNodes.length; n++) {
		if (this.aNodes[n].pid == pNode.id) {
			var cn = this.aNodes[n];
			cn._p = pNode;
			cn._ai = n;
			this.setCS(cn);
			if (!cn.target && this.config.target) {
				cn.target = this.config.target;
			}
			if (cn._hc && !cn._io && this.config.useCookies) {
				cn._io = this.isOpen(cn.id);
			}
			if (!this.config.folderLinks && cn._hc) {
				cn.url = null;
			}
			if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {
				cn._is = true;
				this.selectedNode = n;
				this.selectedFound = true;
			}
			str += this.node(cn, cn.id);
			if (cn._ls) {
				break;
			}
		}
	}
	return str;
};

// Creates the node icon, url and text
dTree.prototype.node = function (node, nodeId) {

//	alert(nodeId+":"+node.id+":"+node.pid+":"+node.name+":"+node._ai);

	var str = "";
	if (this.root.id == node.pid) {
		str += "<div class=\"left_menues\">" + this.indent(node, nodeId);
	}else{
		str += "<div class=\"\">" + this.indent(node, nodeId);

		if (this.config.useIcons) {
		
			if (!node.icon) {
				if (this.root.id != node.pid) {
					node.icon = (node._hc) ? this.icon.folder : this.icon.node;
				}
			}
			
			if (!node.iconOpen) {
				node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;
			}
			
			if (this.root.id != node.pid) {
				str += "<img id=\"i" + this.obj + nodeId + "\" src=\"" + ((node._io) ? node.iconOpen : node.icon) + "\" alt=\"\" />";
			}
		
		}
	}

	if (node.url) {
		str += "<a id=\"s" + this.obj + nodeId + "\" class=\"" + ((this.config.useSelection) ? ((node._is ? "nodeSel" : "node")) : "node") + "\" href=\"" + node.url + "\"";
		if (node.title) {
			str += " title=\"" + node.title + "\"";
		}
		if (node.target) {
			str += " target=\"" + node.target + "\"";
		}
		if (this.config.useStatusText) {
			str += " onmouseover=\"window.status='" + node.name + "';return true;\" onmouseout=\"window.status='';return true;\" ";
		}
		if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc)) {
			str += " onclick=\"javascript: " + this.obj + ".s(" + nodeId + ");\"";
		}
		str += ">";
	} else {
		if ((!this.config.folderLinks || !node.url) && node._hc) {

			
			str += "<a href=\"javascript: " + this.obj + ".o(" + nodeId + ");\" class=\"node\">";
		}
	}
	if(node.pid==this.root.id){
		str += "<div class=\"left_menue_words\"><span  style='cursor:hand'>"+node.name+"</span></div>";
	}else{
		str += node.name;
	}
	
	if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) {
		str += "</a>";
	}
	str += "</div>";
	if (node._hc) {
		str += "<div id=\"d" + this.obj + nodeId + "\" class=\"clip\" style=\"display:" + ((this.root.id == node.pid || node._io) ? "block" : "none") + ";\">";
		str += this.addNode(node);
		str += "</div>";
	}
	this.aIndent.pop();
	return str;
};

// Adds the empty and line icons
dTree.prototype.indent = function (node, nodeId) {
	var str = "";
	if (this.root.id != node.pid) {
		for (var n = 0; n < this.aIndent.length; n++) {
			str += "<img src=\"" + ((this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty) + "\" alt=\"\" />";
		}
		(node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);
		if (node._hc) {
			str += "<a href=\"javascript: " + this.obj + ".o(" + nodeId + ");\"><img id=\"j" + this.obj + nodeId + "\" src=\"";
			if (!this.config.useLines) {
				str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;
			} else {
				str += ((node._io) ? ((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) : ((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus));
			}
			str += "\" alt=\"\" /></a>";
		} else {
			str += "<img src=\"" + ((this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join) : this.icon.empty) + "\" alt=\"\" />";
		}
	}

	return str;
};

// Checks if a node has any children and if it is the last sibling
dTree.prototype.setCS = function (node) {
	var lastId;
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.id) {
			node._hc = true;
		}
		if (this.aNodes[n].pid == node.pid) {
			lastId = this.aNodes[n].id;
		}
	}
	if (lastId == node.id) {
		node._ls = true;
	}
};

// Returns the selected node
dTree.prototype.getSelected = function () {
	var sn = this.getCookie("cs" + this.obj);
	return (sn) ? sn : null;
};

// Highlights the selected node
dTree.prototype.s = function (id) {
	
	if (!this.config.useSelection) {
		return;
	}
	var cn = this.getNodeById(id);
	if (cn._hc && !this.config.folderLinks) {
		return;
	}
	if (this.selectedNode != id) {
		if (this.selectedNode || this.selectedNode == 0) {
			eOld = document.getElementById("s" + this.obj + this.selectedNode);
			eOld.className = "node";
		}
		eNew = document.getElementById("s" + this.obj + id);
		eNew.className = "nodeSel";
		this.selectedNode = id;
		if (this.config.useCookies) {
			this.setCookie("cs" + this.obj, cn.id);
		}
	}
};

// Toggle Open or close
dTree.prototype.o = function (id) {
	var cn = this.getNodeById(id);

//alert(cn.id+":"+cn.name+":"+cn._io);

	this.nodeStatus(cn._io, id, cn._ls);

	cn._io = !cn._io;

	if (this.config.closeSameLevel) {
		this.closeLevel(cn);
	}
	if (this.config.useCookies) {
		this.updateCookie();
	}
};

// Open or close all nodes
dTree.prototype.oAll = function (status) {
	
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n]._hc) {
			this.nodeStatus(!status, this.aNodes[n].id, this.aNodes[n]._ls);
			this.aNodes[n]._io = status;
		}
	}
	if (this.config.useCookies) {
		this.updateCookie();
	}
};

// Opens the tree to a specific node
dTree.prototype.openTo = function (nId, bSelect, bFirst) {	
	if (!bFirst) {
		for (var n = 0; n < this.aNodes.length; n++) {
			if (this.aNodes[n].id == nId) {
				nId = n;
				break;
			}
		}
	}
	var cn = this.aNodes[nId];
	if (cn.pid == this.root.id || !cn._p) {
		return;
	}
	cn._io = true;
	cn._is = bSelect;
	if (this.completed && cn._hc) {
		this.nodeStatus(true, cn._ai, cn._ls);
	}
	if (this.completed && bSelect) {
		this.s(cn._ai);
	} else {
		if (bSelect) {
			this._sn = cn._ai;
		}
	}
	this.openTo(cn._p._ai, false, true);
};

// Closes all nodes on the same level as certain node
dTree.prototype.closeLevel = function (node) {
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {
			this.nodeStatus(false, n, this.aNodes[n]._ls);
			this.aNodes[n]._io = false;
			this.closeAllChildren(this.aNodes[n]);
		}
	}
};

// Closes all children of a node
dTree.prototype.closeAllChildren = function (node) {
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {
			if (this.aNodes[n]._io) {
				this.nodeStatus(false, n, this.aNodes[n]._ls);
			}
			this.aNodes[n]._io = false;
			this.closeAllChildren(this.aNodes[n]);
		}
	}
};

// Change the status of a node(open or closed)
dTree.prototype.nodeStatus = function (status, id, bottom) {

	eDiv = document.getElementById("d" + this.obj + id);
	eJoin = document.getElementById("j" + this.obj + id);

	if (this.config.useIcons) {
		eIcon = document.getElementById("i" + this.obj + id);
		eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon;
	}
	if(eJoin!=null){
		eJoin.src = (this.config.useLines) ? ((status) ? ((bottom) ? this.icon.minusBottom : this.icon.minus) : ((bottom) ? this.icon.plusBottom : this.icon.plus)) : ((status) ? this.icon.nlMinus : this.icon.nlPlus);
	}

	var cn = this.getNodeById(id);

	//alert(status+":"+cn.name+":"+eDiv.style.display);

	if(cn.pid==this.root.id){
		var n = 0;
		for (n; n < this.aNodes.length; n++) {
			if((this.aNodes[n].pid == this.root.id) && (this.aNodes[n].id != id)) {
				div = document.getElementById("d" + this.obj + this.aNodes[n].id);
				
				div.style.display="none";
				this.aNodes[n]._io=false;
			}
		}
	}

	eDiv.style.display = (status) ? "none":"block";
};


// [Cookie] Clears a cookie
dTree.prototype.clearCookie = function () {
	var now = new Date();
	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);
	this.setCookie("co" + this.obj, "cookieValue", yesterday);
	this.setCookie("cs" + this.obj, "cookieValue", yesterday);
};

// [Cookie] Sets value in a cookie
dTree.prototype.setCookie = function (cookieName, cookieValue, expires, path, domain, secure) {
	document.cookie = escape(cookieName) + "=" + escape(cookieValue) + (expires ? "; expires=" + expires.toGMTString() : "") + (path ? "; path=" + path : "") + (domain ? "; domain=" + domain : "") + (secure ? "; secure" : "");
};

// [Cookie] Gets a value from a cookie
dTree.prototype.getCookie = function (cookieName) {
	var cookieValue = "";
	var posName = document.cookie.indexOf(escape(cookieName) + "=");
	if (posName != -1) {
		var posValue = posName + (escape(cookieName) + "=").length;
		var endPos = document.cookie.indexOf(";", posValue);
		if (endPos != -1) {
			cookieValue = unescape(document.cookie.substring(posValue, endPos));
		} else {
			cookieValue = unescape(document.cookie.substring(posValue));
		}
	}
	return (cookieValue);
};

// [Cookie] Returns ids of open nodes as a string
dTree.prototype.updateCookie = function () {
	var str = "";
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {
			if (str) {
				str += ".";
			}
			str += this.aNodes[n].id;
		}
	}
	this.setCookie("co" + this.obj, str);
};

// [Cookie] Checks if a node id is in a cookie
dTree.prototype.isOpen = function (id) {
	var aOpen = this.getCookie("co" + this.obj).split(".");
	for (var n = 0; n < aOpen.length; n++) {
		if (aOpen[n] == id) {
			return true;
		}
	}
	return false;
};

// If Push and pop is not implemented by the browser
if (!Array.prototype.push) {
	Array.prototype.push = function array_push() {
		for (var i = 0; i < arguments.length; i++) {
			this[this.length] = arguments[i];
		}
		return this.length;
	};
}
if (!Array.prototype.pop) {
	Array.prototype.pop = function array_pop() {
		lastElement = this[this.length - 1];
		this.length = Math.max(this.length - 1, 0);
		return lastElement;
	};
}

//add by haibo zhou
dTree.prototype.getNodeById = function (id) {
	for (var n = 0; n < this.aNodes.length; n++) {
		if (this.aNodes[n].id == id) {
			return this.aNodes[n];
		}
	}
	return null;
}

//Extend
function getRootId(root) {
	return root.aNodes[0].id;
}
function getRootName(root) {
	return root.aNodes[0].name;
}
function getSelectedId(root) {
	return root.aNodes[root.selectedNode].id;
}
function getSelectedNode(root) {
	alert(root.aNodes[root.selectedNode].name + "--" + root.aNodes[root.selectedNode].id);
	alert(root.selectedNode);
}
function getParentId(root) {
	return root.aNodes[root.selectedNode].pid;
}
function isSomeNodeSelected(root) {
	return (root.selectedNode == null || root.selectedNode == "undefined");
}
function forwardDeleteDep(root) {
	if (isSomeNodeSelected(root)) {
		alert("\u8bf7\u9009\u62e9\u8981\u5220\u9664\u7684\u90e8\u95e8");
		return;
	} else {
		var url = "dep_tree.do?method=del&id=" + getSelectedId(root);
		if (openDeleteDialog(url, "\u8bf7\u786e\u8ba4\u662f\u5426\u771f\u7684\u8981\u5220\u9664")) {
			//location.href = "dep_tree.do";
		}
	}
}
function forwardDeleteOrg(root) {
	if (isSomeNodeSelected(root)) {
		alert("\u8bf7\u9009\u62e9\u8981\u5220\u9664\u7684\u673a\u6784");
		return;
	} else {
		var url = "org_tree.do?method=del&id=" + getSelectedId(root);
		if (openDeleteDialog(url, "\u8bf7\u786e\u8ba4\u662f\u5426\u771f\u7684\u8981\u5220\u9664")) {
			//location.href = "org_tree.do";
		}
	}
}
function forwardDeleteModule(root) {
	if (isSomeNodeSelected(root)) {
		alert("请�??�择要删除的模块");
		return;
	} else {
		var url = "modules.do?method=del&id=" + getSelectedId(root);
		if (openDeleteDialog(url, "\u8bf7\u786e\u8ba4\u662f\u5426\u771f\u7684\u8981\u5220\u9664")) {
		}
	}
}
function forwardAddOrg(root) {
	if (isSomeNodeSelected(root)) {
		url = "org_tree.do?method=addInput";
	} else {
		url = "org_tree.do?method=addInput&parentId=" + getSelectedId(root);
	}
	openWin(url, "window123", 600, 300, 1);  
}
function forwardAddDep(root) {
	if (isSomeNodeSelected(root)) {
		url = "dep_tree.do?method=addInput";
	} else {
		url = "dep_tree.do?method=addInput&parentId=" + getSelectedId(root);
	}
	openWin(url, "window123", 600, 300, 1);  
}
function forwardAddModule(root) {
	if (isSomeNodeSelected(root)) {
		url = "modules.do?method=addInput";
	} else {
		url = "modules.do?method=addInput&parentId=" + getSelectedId(root);
	}
	openWin(url, "window123", 600, 300, 1);  
}
function forwardUpdateModule(root) {
	if (isSomeNodeSelected(root)) {
		alert("请�??�择要修改的模块");
		return;
	} else {
		url = "modules.do?method=updateInput&id=" + getSelectedId(root);
	}
	openWin(url, "window123", 600, 300, 1);  
}
function forwardDetail(root) {
	if (isSomeNodeSelected(root)) {
		alert("Selet the to update");
		return;
	}
	forwardUrl = "tree.detail.do?rootid=" + getRootId(root) + "&rootname=" + getRootName(root) + "&id=" + getSelectedId(root);
	parent.main.location.href = forwardUrl;
}

