<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%@ page language="java" contentType="text/html; charset=UTF-8" %>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Kaptcha Example</title>
		
		
		<script type="text/javascript"	src="javascript/jquery.js"></script>
		<script type="text/javascript">
			function alertKaptch(){
				$.post( "myServlet.servlet", function( data ) {
					alert(data);
				});
			}
		</script>
	</head>
	<body>
	
		Enter in the <a href="http://code.google.com/p/kaptcha/">Kaptcha</a> to see if it matches what is stored in the session attributes.
		
		<table>
			<tr>
				<td><img src="kaptcha.servlet"></td>
				<td valign="top">
					<form method="POST">
						<br>sec code:<input type="text" name="kaptchafield"><br/>
						<input type="submit" name="submit">
						
						
						<input type="button" name="submit" value="alert" onclick="alertKaptch()">
					</form>
				</td>
			</tr>
		</table>	

		<br /><br /><br /><br />
		
		<%
			String c = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			String parm = (String) request.getParameter("kaptchafield");
			
			System.out.println("Parameter: " + parm + " ? Session Key: " + c + " : ");
			
			if (c != null && parm != null) {
				if (c.equals(parm)) {
					System.out.println("<b>true</b>");
				} else {
					System.out.println("<b>false</b>");
				}
			}
		%>

	</body>
</html>
