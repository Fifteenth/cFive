﻿<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

    <!-- content type -->
	<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
   
    <!-- viewport -->
    <meta content="width=device-width,initial-scale=1" name="viewport">
       
    <!-- title -->
    <title>程序员宝典</title>
                
    <!-- add css -->
    <link type="text/css" href="<%=basePath%>resources/jsp/book/css/style.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Play:400,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Nunito:400,300">
    
    <!-- add js -->
    <script src="<%=basePath%>resources/jsp/book/js/jquery.js"></script>
    <script src="<%=basePath%>resources/jsp/book/js/turn.js"></script>              
    <script src="<%=basePath%>resources/jsp/book/js/jquery.fullscreen.js"></script>
    <script src="<%=basePath%>resources/jsp/book/js/jquery.address-1.6.min.js"></script>
	<script src="<%=basePath%>resources/jsp/book/js/onload.js"></script>
    

	<style>
    html, body {
        margin: 0;
        padding: 0;
		overflow:auto !important;
    }
    </style> 
      
</head>
 
<body>  
  
<!-- BEGIN FLIPBOOK STRUCTURE -->   
<div data-template="true" data-cat="book7" id="fb7-ajax">  
  <div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>

         
    <!-- BEGIN HTML BOOK -->     
    <div data-current="book7" class="fb7" id="fb7">      
    
        <!-- preloader -->
        <div class="fb7-preloader">
            <div id="wBall_1" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_2" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_3" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_4" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_5" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
        </div>
              
        <!-- background for book -->  
        <div class="fb7-bcg-book"></div>               
      
        <!-- BEGIN CONTAINER BOOK -->
        <div id="fb7-container-book">
     
           <!-- BEGIN deep linking -->  
           <section id="fb7-deeplinking">
             <ul>
                 <li data-address="page1" data-page="1"></li>
                 <li data-address="page2-page3" data-page="2"></li>
                 <li data-address="page2-page3" data-page="3"></li>
                 <li data-address="page4-5" data-page="4"></li>
                 <li data-address="page4-5" data-page="5"></li>
                 <li data-address="page6-page7" data-page="6"></li>
                 <li data-address="page6-page7" data-page="7"></li>
                 <li data-address="page8-page9" data-page="8"></li>
                 <li data-address="page8-page9" data-page="9"></li>
                 <li data-address="end" data-page="10"></li>  
             </ul>
           </section>
           <!-- END deep linking -->  
        
            
           <!-- BEGIN ABOUT -->
		   
           <section id="fb7-about">
                   <h1><strong>>> &nbsp;《程序员宝典》</strong></h1>
                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu tellus ipsum,sit amet fermentum eros. Aliquam eget nulla neque, dignissim consectetur velit.Sed non metus sapien, nec laoreet ipsum.</p>
                   
				   <h1><strong>>> &nbsp;《J2EE》</strong></h1>
                   <p>Ipsum sit amet, consectetur adipiscing elit. Praesent eu tellus ipsum, sit amet fermentum eros. Aliquam eget nulla neque, dignissim consectetur velit. Sed non metus sapien, nec laoreet ipsum.</p>
                   
				   <h1><strong>>> &nbsp;《Rest》</strong></h1>
                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu tellus ipsum, sit amet fermentum eros. Aliquam eget nulla neque, dignissim consectetur velit. Sed non metus sapien, nec laoreet ipsum.</p>
                   
				   <p>&nbsp;</p>
                   <p>&nbsp;</p>
                   <p>&nbsp;</p>
                   <p>&nbsp;</p>
           </section>
		   
           <!-- END ABOUT -->
    
    
            <!-- BEGIN PAGES -->
            <div id="fb7-book">       
              
            
                    <!-- BEGIN PAGE 1 -->          
                    <div style="background-image:url(<%=basePath%>resources/jsp/book/images/1.jpg)" class="fb7-noshadow">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                            <!-- description for page --> 
                            <div class="fb7-page-book">
                        
                            </div> 
                         </div>
                        <!-- end container page book --> 
                            
                    </div>
                    <!-- END PAGE 1 -->
                      
                    
                    
                    <!-- BEGIN PAGE 2 -->         
                    <%@ include file="page/page_maven_1.jsp" %> 
                    <!-- END PAGE 2 -->
                      
                    
                    <!-- BEGIN PAGE 3 -->          
                    <%@ include file="page/page_maven_2.jsp" %> 
                    <!-- END PAGE 3 -->
                      
                    
                    <!-- BEGIN PAGE 4-5 -->       
					<!--
                    <div style="background-image:url()" class="fb7-double fb7-first fb7-noshadow">
					-->
					<div style="background-image:url()">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                    <h1>Web Service</h1>     
                                </div> 
								
								<!-- begin number page  -->                 
                                <div class="fb7-meta">
                                    
                                        <span class="fb7-num">4</span>
                                     
                                </div>
                                <!-- end number page  --> 
                                   
                          </div> 
                          <!-- end container page book --> 
                            
                    </div>
                    
                    <!--       
                    <div style="background-image:url()" class="fb7-double fb7-second fb7-noshadow">
					-->
					<div style="background-image:url()">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                    <h1>数据库</h1> 
                                </div> 
								
								<!-- begin number page  -->                 
                                <div class="fb7-meta">
                                    
                                        <span class="fb7-num">5</span>
                                     
                                </div>
                                <!-- end number page  --> 
                             
                          </div> 
                          <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 4-5 -->
                      
                    
                    <!-- BEGIN PAGE 6 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                    <h1>设计模式</h1>   
                                </div> 
                                                                
                                          
                                <!-- begin number page  -->                 
                                <div class="fb7-meta">
                                    
                                        <span class="fb7-num">6</span>
                                     
                                </div>
                                <!-- end number page  --> 
                          
                          </div>
                          <!-- end container page book --> 
                            
                    </div>
                     <!-- END PAGE 6 -->
                      
                    
                    <!-- BEGIN PAGE 7 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page  --> 
                            <div class="fb7-page-book">
                                        <h1>Spring</h1>
                                        <p>Noluisse constituto reprehendunt his ne. Ea eam eruditi feugait tacimates, ex percipit qualisque dignissim duo. Verterem voluptatum reprimique nec an. No nec utamur verterem. Utamur dolores reprimique cum ne, ei pro ocurreret consequat instructior.</p>
                                        <p>Nihil incorrupte eu has, no vix saepe volumus, sit no iusto deseruisse efficiantur. His ut essent molestie deserunt, nemore laoreet tacimates vix eu. Choro cetero at duo. Ut appetere voluptaria usu, et ius fugit legimus.</p>
                                        <p>Pro idque mucius bonorum in. Natum <a href="javascript:youtube('48I0IHmsuOE','560','315')">youtube</a> dolorum qui et, eum percipitur sadipscing eu. Ex phaedrum mediocrem nec. Nam cu nullam tamquam efficiantur, his quot nobis ut. Id est nihil exerci, paulo aliquando ut his.</p>
                                        <p>Te ius noster alienum, semper feugait voluptatum an mel. Impedit reprimique quo et, at illum alterum admodum vix. Eum hinc lorem ei. Causae bonorum scaevola vix et, alii meliore intellegebat te sit, duis oblique usu te. His an pericula neglegentur, erant oratio an pro, ea nam mentitum mandamus maiestatis. Quot inani nominavi vix ei.</p>
                                        <p>Nihil incorrupte eu has, no vix saepe volumus, sit no iusto deseruisse efficiantur. His ut essent molestie deserunt, nemore laoreet tacimates vix eu. Choro cetero at duo. Ut appetere voluptaria usu, et ius fugit legimus.</p>
                                        <h6>&nbsp;Nam cu nullam tamquam efficiantur:</h6>
                                        <ul>
                                        <li>Natum epicurei comprehensam ex pe</li>
                                        <li>Ridens corrumpit abhorreant nam id</li>
                                        <li>Eu inani eirmod alterum</li>
                                        <li>his ne iudico iuvaret delenit</li>
                                        <li>Choro cetero at duo</li>
                                        <li>Iusto deseruisse efficiantur</li>
                                        <li>His cu utinam appareat</li>
                                        </ul>                  
                            </div> 
                                  
                                  
                                      
                            <!-- begin number page  -->                 
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">7</span>
                                 
                            </div>
                            <!-- end number page  -->  
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 7 -->
                      
                    
                    <!-- BEGIN PAGE 8 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                <h1>缓存</h1>
                                <p>Cu modus putent partiendo duo. Mel id nonumy iisque. Vis ex labitur gloriatur, no qui iusto albucius. Tantas nominavi conceptam ius in, mel posse choro cu.</p>
                                <p>Mel liber everti nostrum ne, illud tincidunt an mea. In debitis feugait deseruisse vim. Duo dicat vocent eu. Sea error tollit denique ne. Vim id postea neglegentur. Mel eu soluta splendide concludaturque.</p>
                                <p>Usu te prompta percipitur. Dictas repudiandae vel ut, sed ad omnium scriptorem, vix consul atomorum petentium no. Prompta eleifend ne eam, mel esse reque theophrastus in. Malis possit an est, ancillae definitiones vix at. Eu magna nihil his, has elitr perfecto nominati ea, quas maiestatis in sed.</p>
                                <p>Error eirmod invidunt in est. Vix ne voluptua accusata sadipscing, pri eu alia legimus facilisi, et quo mnesarchum efficiendi. Duo te labores accusam. An vim case ferri tractatos, habemus voluptaria philosophia ut mei.</p>
                                <p>Regione mentitum sit ad, nihil nominavi consetetur in vel. Semper oportere patrioque duo ne. Ne his option nonumes. Ad sea meis necessitatibus, has iisque fastidii ut, alia quidam ea pro. Eius gloriatur reformidans ne mei, qui impedit mentitum ad.</p>
                                <p>Vis id quas novum. Eos debitis expetendis ea, nullam libris deleniti mei ne. Te tale suas eam, everti fuisset scribentur et vix. Id qui etiam percipit, omnes copiosae eam at. Omnium eleifend interpretaris sea ea, wisi mediocritatem cu vix, qui no sale dicit efficiendi. No his nominavi eleifend, case solet dissentiet duo ad.</p>
                                <p>Sonet accusata quo te, erant munere an mei. Meis soleat fabulas eum ut. Ius iusto volumus recteque cu, libris interesset ea per, usu maluisset dignissim mnesarchum in. Vitae primis vis ei. Pro amet tale falli ad, ei usu adipiscing eloquentiam, ex augue tacimates definiebas qui.</p>
                            
                            </div> 
                                  
                                  
                                      
                            <!-- begin number page -->                
                            <div class="fb7-meta">                        
                                    <span class="fb7-num">8</span>
                                 
                            </div>
                            <!-- end number page --> 
                             
                            
                            
                          </div> 
                          <!-- end container page book -->
                            
                    </div>
                     <!-- END PAGE 8 -->
                      
                    
                    
                    
                    <!-- BEGIN PAGE 9 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                <h1>JQuery</h1>    
                            </div>                           
                                  
                                      
                            <!-- begin number page -->               
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">9</span>
                                 
                            </div>
                            <!-- end number page -->
                            
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                           
                            
                    </div>
                     <!-- END PAGE 9 -->
                      
                    
                    <!-- BEGIN PAGE 10 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page--> 
                                <div class="fb7-page-book">
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <h1 style="padding-left: 150px;">&nbsp;THE END</h1>                    
                                </div> 
                                    
                         </div>
                         <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 10 -->
                                  
           
            
            </div>
            <!-- END PAGES -->
                       
            
            <!-- arrows -->
            <a class="fb7-nav-arrow prev"></a>
            <a class="fb7-nav-arrow next"></a>
                    
            <!-- shadow -->
            <div class="fb7-shadow"></div>
    
        </div>
        <!-- END CONTAINER BOOK -->
    
        <!-- BEGIN FOOTER -->
        <div id="fb7-footer">
        
            <div class="fb7-bcg-tools"></div>
            
            <div class="fb7-menu" id="fb7-center">
                <ul>
                
                    <!-- margin left -->
                    <li></li>
                            
                    <!-- icon download -->
                    <li>
                        <a title="Pdf File Or Zip" class="fb7-download" href="#"></a>
                    </li>
                                            
                    
                    <!-- icon_zoom_in -->                         
                    <li>
                        <a title="Zoom In" class="fb7-zoom-in"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_out -->                 
                    <li>
                        <a title="Zoom Out" class="fb7-zoom-out"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_auto -->
                    <li>
                        <a title="Zoom Auto" class="fb7-zoom-auto"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_original -->
                    <li>
                        <a title="Zoom Original (Scale 1:1)" class="fb7-zoom-original"></a>
                    </li>
                                     
                    <!-- icon_home -->
                    <li>
                        <a title="Show Home Page" class="fb7-home"></a>
                    </li>
                                    
                    <!-- icon fullscreen -->                 
                    <li>
                        <a title="Full / Normal Screen" class="fb7-fullscreen"></a>
                    </li>
                            
                    <!-- margin right -->                 
                    <li></li>
                    
                </ul>
            </div>
            
            <div class="fb7-menu" id="fb7-right">
                <ul>                              
                    <!-- icon page manager -->                 
                    <li class="fb7-goto">
                        <label for="fb7-page-number" id="fb7-label-page-number"></label>
                        <input type="text" id="fb7-page-number">
                        <button type="button">Go</button>
                    </li>
         
                </ul>
            </div>     
                
        </div>
        <!-- END FOOTER -->
    

   </div>
    <!-- END HTML BOOK -->    
    
    
</div>
<!-- END FLIPBOOK STRUCTURE --> 


<!-- CONFIGURATION FLIPBOOK -->    
<script>
jQuery('#fb7-ajax').data('config',
    {
		"page_width":"640",
		"page_height":"920",
		"go_to_page":"Page",
		"gotopage_width":"45",
		"zoom_double_click":"1",
		"zoom_step":"0.06",
		"tooltip_visible":"true",
		"toolbar_visible":"true",
		"deeplinking_enabled":"true",
		"double_click_enabled":"true",
		"rtl":"false"
     })
</script>


</body>
</html>