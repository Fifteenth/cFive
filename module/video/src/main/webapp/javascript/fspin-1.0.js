function registerEvent(){
	$(window).resize(function() {
		 $("#loading").remove();
		 $("#loadBackground").remove();
		 $("#message").remove();
		 setSpin();
	});

	$(window).scroll(function(){
		 $("#loading").remove();
		 $("#loadBackground").remove();
		 $("#message").remove();
		 setSpin();
	});
}

function setLoadBackgroudAndText(){
	// fix browser resolution
	/*
		$(window).height();   // returns height of browser viewport
		$(document).height(); // returns height of HTML document
		$(window).width();   // returns width of browser viewport
		$(document).width(); // returns width of HTML document
	 */	
	/*fix parameters*/
	var spinHeight = 100;
	var spinWidth = 100;
	var spinXPercentage = 50;
	var spinYPercentage = 50;
	var messageDivWidthPX = 140;
	var messageLabelHeightPX = 20;
	var distanceSpinAndMessage = 40;
	var backgroudPaddingLeftAndRight = 20;
	var backgroudPaddingTopAndBottom = 20;
	
	var distanceSpinDeviation = 8;
	/*fix parameters*/
	/*current parameter*/
	var currentHeight = window.innerHeight;
	var currentWidth = window.innerWidth;
	var currentTopPosition = $(window).scrollTop();
	var currentLeftPosition = $(window).scrollLeft();
	/*current parameter*/
	var spinXPX = spinXPercentage/100 * currentWidth + currentLeftPosition;
	var spinYPX = spinYPercentage/100 * currentHeight + currentTopPosition;
	var messageLabelLeftPX = (spinXPX + distanceSpinDeviation) - messageDivWidthPX/2;
	var messageLabelTopPX = spinYPX + distanceSpinAndMessage;
	var backgroudDivLeftPX = (spinXPX + distanceSpinDeviation) - messageDivWidthPX/2 - backgroudPaddingLeftAndRight;		
	var backgroudDivRightPX = (spinXPX + distanceSpinDeviation) + messageDivWidthPX/2 + backgroudPaddingLeftAndRight;
	var backgroudDivTopPX = spinYPX - backgroudPaddingTopAndBottom - spinHeight/2;
	var backgroudDivBottomPX = messageLabelTopPX + messageLabelHeightPX + backgroudPaddingTopAndBottom;
	var backgroudDivWidth = backgroudDivRightPX - backgroudDivLeftPX;
	var backgroudDivHeight = backgroudDivBottomPX - backgroudDivTopPX;
															
	
	$( "body" ).prepend('<div id="loading"/>');
	$("#loading").css({
	    "position": "absolute", 
	    "width": $(document).width() - 100, // TODO
	    "height": $(document).height() - 100, // TODO
	    "z-index": 9999, 
	   /* "background-color": "#000"*/
	});//.fadeTo(0, 0.2);
	
	$( "body" ).prepend('<div id="loadBackground"/>');
	$("#loadBackground").css({
	    "position": "absolute", 
	    "width": backgroudDivWidth + "px", 
	    "height": backgroudDivHeight + "px",
	    "z-index": 9997, 
	    "background-color": "#000",
	    "top":backgroudDivTopPX + "px",
	    "left":backgroudDivLeftPX + "px",
	    "border": "1px solid",
	    "border-color":"#000",
    	"border-radius": "4px"
	}).fadeTo(0, 0.6);
	$( "body" ).prepend('<div id="message"><label>Loading, please wait...</label></div>');
	$("#message").css({
	    "position": "absolute", 
	    "width":messageDivWidthPX,
	    "height": "10%",
	    "z-index": 9998, 
	    "top":messageLabelTopPX + "px",
	    "left":messageLabelLeftPX + "px",
	    "font-size":"13px",
	    "font-family":"\"Helvetica Neue\", Helvetica, Arial,sans serif",
		"text-align":"center",
	    //"background-color": "#FFF",
	    "color":"#FFF"	    
	});//.fadeTo(0, 0.2);
	
	var spinArray = [];
	spinArray[0] = spinXPX;
	spinArray[1] = spinYPX;
	return spinArray;
}

function setSpin(mode,time){
	var spin = setLoadBackgroudAndText();
	var verticalDirection = 1;
	var horizontalDirection = 0;
	//alert(messageLabelTopPX);
	/*alert($(window).height() + "--" + $(document).height());*/
	var opts = {
			  lines: 13 // The number of lines to draw
			, length: 28 // The length of each line
			, width: 14 // The line thickness
			, radius: 42 // The radius of the inner circle
			, scale: 0.25 // Scales overall size of the spinner
			, corners: 1 // Corner roundness (0..1)
			, color: '#FFF' // #rgb or #rrggbb or array of colors
			, opacity: 0.25 // Opacity of the lines
			, rotate: 0 // The rotation offset
			, direction: 1 // 1: clockwise, -1: counterclockwise
			, speed: 1 // Rounds per second
			, trail: 60 // Afterglow percentage
			, fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
			, zIndex: 2e9 // The z-index (defaults to 2000000000)
			, className: 'spinner' // The CSS class to assign to the spinner
			, top: spin[verticalDirection] + "px" // Top position relative to parent
			, left: spin[horizontalDirection] + "px" // Left position relative to parent
			, shadow: false // Whether to render a shadow
			, hwaccel: true // Whether to use hardware acceleration
			, position: 'absolute' // Element positioning
			}
	var target = document.getElementById('loading')
	
	
	if(mode!=null && mode == 'delay'){
		var delayTime = 500;
		if(time != null){
			delayTime = time;
		}
		setTimeout(function (){
			new Spinner(opts).spin(target);
			//target.appendChild(spinner.el);
		}, delayTime); 
	}else{
		new Spinner(opts).spin(target);
		//target.appendChild(spinner.el);
	}
}

function loadSpin(mode,time){
	setSpin(mode,time);
	registerEvent();
}

function getBrowserType(){
	var ua = navigator.userAgent;
	var browserName  = navigator.appName;
	var nVer = navigator.appVersion;
	var fullVersion  = ''+parseFloat(navigator.appVersion); 
	var majorVer = parseInt(navigator.appVersion,10);
	var nameOffset,verOffset,ix;

	//Google Chrome 
	if ((verOffset=ua.indexOf("Chrome"))!=-1) {
	 browserName = "Chrome";
	 fullVersion = ua.substring(verOffset+7);
	}
	// Opera 15+, 
	else if ((verOffset=ua.indexOf("OPR/"))!=-1) {
	 browserName = "Opera";
	 fullVersion = ua.substring(verOffset+4);
	}

	// older Opera,
	else if ((verOffset=ua.indexOf("Opera"))!=-1) {
	 browserName = "Opera";
	 fullVersion = ua.substring(verOffset+6);
	 if ((verOffset=ua.indexOf("Version"))!=-1) 
	   fullVersion = ua.substring(verOffset+8);
	}
	// Microsoft IE
	else if ((verOffset=ua.indexOf("MSIE"))!=-1) {
	 browserName = "Microsoft Internet Explorer";
	 fullVersion = ua.substring(verOffset+5);
	}

	//Apple Safari 
	else if ((verOffset=ua.indexOf("Safari"))!=-1) {
	 browserName = "Safari";
	 fullVersion = ua.substring(verOffset+7);
	 if ((verOffset=ua.indexOf("Version"))!=-1) 
	   fullVersion = ua.substring(verOffset+8);
	}
	//Firefox 
	else if ((verOffset=ua.indexOf("Firefox"))!=-1) {
	 browserName = "Firefox";
	 fullVersion = ua.substring(verOffset+8);
	}
	//other browsers 
	else if ( (nameOffset=ua.lastIndexOf(' ')+1) < 
	          (verOffset=ua.lastIndexOf('/')) ) 
	{
	 browserName = ua.substring(nameOffset,verOffset);
	 fullVersion = ua.substring(verOffset+1);
	 if (browserName.toLowerCase()==browserName.toUpperCase()) {
	  browserName = navigator.appName;
	 }
	}
	// Browser's fullVersion string including space/semicolon
	if ((ix=fullVersion.indexOf(";"))!=-1)
	   fullVersion=fullVersion.substring(0,ix);
	if ((ix=fullVersion.indexOf(" "))!=-1)
	   fullVersion=fullVersion.substring(0,ix);

	//Get version Integer
	majorVer = parseInt(''+fullVersion,10);
	if (isNaN(majorVer)) {
	 fullVersion  = ''+parseFloat(navigator.appVersion); 
	 majorVer = parseInt(navigator.appVersion,10);
	}

    /*alert('Browser name  = '+browserName+'<br>'
   		 +'Full version  = '+fullVersion+'<br>'
		 +'Major version = '+majorVer+'<br>'
		 +'navigator.appName = '+navigator.appName+'<br>'
		 +'navigator.userAgent = '+navigator.userAgent+'<br>');*/
	
	return browserName;
}