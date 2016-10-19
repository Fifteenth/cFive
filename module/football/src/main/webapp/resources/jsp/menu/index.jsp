<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<SCRIPT LANGUAGE="JavaScript" src="../resources/jsp/menu/javascript/psw.js"></script>
		<title>灵川民政管理系统</title>
		<style type="text/css">
body {
	text-align: center;
}

.words {
	float: left;
	/*height: 100px;*/
	height: 150px;
	/*width: 300px;*/
	width: 260px;
	margin-left: 200px;
}

.words span {
	color: #FFFFFF;
	font: "黑体";
	font-weight: bold;
	font-size: 20px;
}


#bodyPage
{
	background-color:#3399FF;
	text-align: center;
}

#background {
	background: url(../resources/jsp/menu/images/background.gif) no-repeat;
	width: 1000px;
	height: 694px;
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: auto;
}

#center {
	float: left;
	height: 376px;
	margin-top: 107px;
	width: 100%;
}

#login_form { /*margin-top: 200px;*/
	margin-top: 160px;
	margin-left: 20px;
}

input {
	border: none;
	margin-top: 15px;
	width: 150px;
}

#error {
	padding-left: 150px;
	width: 642px;
}

#error span {
	color: #ff0000;
	float: left;
	font: "宋体";
	font-size: 14px;
}

#button {
	background: url(../resources/jsp/menu/images/login_button.gif) no-repeat;
	height: 37px;
	margin-left: 140px;
	margin-top: 15px;
	width: 98px;
}

.copyright {
	/*margin-left: 71px;*/
	margin-left: auto;
	width: 1000px;
}

.copyright_words {
	line-high: 20px;
}

.copyright_words span {
	font-size: 12px;
	color: #FFFFFF;
}

a {
	color: FFFFFF;
	text-decoration: none;
}

a:hover {
	color: #FFFFFF;
	text-decoration: underline;
}

.code {   
    font-family:Arial;   
    font-style:italic;   
    color:Red;   
    border:0;   
    padding:2px 3px;   
    letter-spacing:3px;   
    font-weight:bolder;   
}
</style>
		<script language="javascript">
		function dosubmit() {
			if (!validate ()) {
				return false;
			}
			var psw = document.loginform.psw.value;
	    	document.loginform.action ="login.do";
	    	document.loginform.password.value=MD5(psw);
	      	document.loginform.submit(); 
	  	}
	  	
	  	function onkeydown() { 
  			if(event.keyCode == 13) { 
  			document.getElementById("but_LoginSubmit").click(); 
  			return false; 
  			} 
 		} 
		</script>
	</head>

	<script language="javascript" type="text/javascript">  
       
     var code ; //在全局 定义验证码   
     function createCode()   
     {    
       code = "";   
       var codeLength = 4;//验证码的长度   
       var checkCode = document.getElementById("checkCode");   
       var selectChar = new Array(1,2,3,4,5,6,7,8,9);
       for(var i=0;i<codeLength;i++)   
       {   
        var charIndex = Math.floor(Math.random()*9);   
        code +=selectChar[charIndex];   
       }    
       if(checkCode)   
       {   
         checkCode.className="code";
         checkCode.value = code;
         checkCode.blur();   
       }        
     }     
     function validate ()   {   
       var inputCode = document.getElementById("validCode").value;   
       if(inputCode.length <=0)   
       {   
           alert("请输入验证码！"); 
           return false;  
       }   
       else if(inputCode.toUpperCase() != code )   
       {   
          alert("验证码输入错误！");   
          createCode();//刷新验证码  
          return false;   
       }   
       else   
       { 
         return true;  
       }   
	}   
       
    </script>

	<body class="bodyPage" leftMargin=0 topMargin=0 MARGINHEIGHT="0"
		MARGINWIDTH="0"  onload="createCode()">
		<div id="background">
			<div id="center" style="text-align: center">
				<form action="" method="post" name="loginform" id="login_form">
					<input type="hidden" name="password">
					<div id="error">
						<span>${errorMsg }</span>
					</div>
					<div class="words">
						<span>用户名：</span>
						<input type="text" name="username" tabindex="1" />

						<span>密&#12288;码：</span>
						<input type="password" name="psw" tabindex="2" />

						<span>验证码：</span>
						<input type="text" id="validCode" style="width: 55px"  tabindex="3" />
						<input type="text" name="codePic" readonly="readonly" id="checkCode" onclick="createCode()"
							style="width: 45px; cursor: pointer" />
						<a href="#"><font
							style="color: #258; font-size: 12px; font-weight: bolder" onclick="createCode()">换一个</font>
						</a>

						<input type="button" name="but_LoginSubmit"
							onclick="javascript:dosubmit()" tabindex="4" id="button" />
					</div>
				</form>
			</div>


			<div class="copyright">
				<div class="copyright_words">
					&nbsp;<br/>
					<br/>
					<span> 版权所有：<a href="#">灵川县民政局</a>&nbsp;&nbsp;&brvbar;&nbsp;&nbsp;<a
						href="http://www.guet.edu.cn">桂林电子科技大学</a> <br/>
						地址：广西壮族自治区桂林市灵川县灵南路<br />邮编：541200&nbsp;&nbsp;&brvbar;&nbsp;&nbsp;
						电话：6812516<br /> E-mail：lcmz@163.com<br /> 技术支持：guetse@163.com </span>
				</div>
			</div>
		</div>
	</body>
</html>