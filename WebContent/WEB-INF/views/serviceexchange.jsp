<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Zoowaa service exchange</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<style>
[class^=slider] {
display: inline-block;
margin-bottom: 30px;
}
.output {
	color: #888;
	font-size: 14px;
	padding-top: 1px;
	margin-left: 5px;
	vertical-align: top;
}
</style>
<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link href="resources/css/jquery.tagit.css" rel="stylesheet" type="text/css">
<link href="resources/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--[if IE 7]>
    <link rel="stylesheet" href="assets/resources/css/font-awesome-ie7.min.css">
    <![endif]-->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png">
<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
<link rel="shortcut icon" href="resources/ico/favicon.png">
</head>

<body>
<!-- Facebook Like Code -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script> 
<!-- Facebook Like Code -->

<div class="container-fluid max-1200"> 
  <!-- header -->
  <div class="row-fluid">
    <div class="span12 notification pull-right">
      <div class="icon"> <a href="#"><i class="icon-user icon-2x"></i> </a>
        <div class="n-count"> 10</div>
      </div>
      <div class="icon"> <a href="#"><i class="icon-envelope icon-2x"></i></a>
        <div class="n-count"> 999</div>
      </div>
      <div class="icon"> <a href="."><i class="icon-home icon-2x"></i></a> </div>
    </div>
    <!-- /notification --> 
    <!-- small blue header start -->
    <div class="small-header">
      <div class="logo-z"> <img src="resources/img/logo-z.png" alt=""> </div>
      <div class="display-pic"> <img class="img-circle" src="resources/profiles/${userdetails.username}-profile.jpg" alt=""> </div>
      <ul class="nav pull-left">
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <h4> Hello ${userdetails.name} &nbsp;<i class="icon-caret-down"> </i></h4>
          </a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="profilepage"/>">My Profile</a></li>
			<li><a href="<c:url value="myaccount"/>">Account Settings</a></li>
            <li><a href="<c:url value="/signout" />">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /small blue header end --> 
  </div>
  <!-- /header --> 
  <!-- slider -->
  <div class="row-fluid">
    <div class="span12 page-header"> 
      <div class="montage-size2">
		<div class="am-container" id="am-container" style="width:100%;overflow:hidden; margin:0px;"> 
			<a href="#"><img src="resources/img/1.jpg"></img></a>
			<a href="#"><img src="resources/img/2.jpg"></img></a>
			<a href="#"><img src="resources/img/3.jpg"></img></a>
			<a href="#"><img src="resources/img/4.jpg"></img></a>
			<a href="#"><img src="resources/img/5.jpg"></img></a>
			<a href="#"><img src="resources/img/6.jpg"></img></a>
			<a href="#"><img src="resources/img/7.jpg"></img></a>
			<a href="#"><img src="resources/img/8.jpg"></img></a>
			<a href="#"><img src="resources/img/9.jpg"></img></a>
			<a href="#"><img src="resources/img/10.jpg"></img></a>
			<a href="#"><img src="resources/img/11.jpg"></img></a>
			<a href="#"><img src="resources/img/12.jpg"></img></a>
			<a href="#"><img src="resources/img/13.jpg"></img></a>
			<a href="#"><img src="resources/img/14.jpg"></img></a>
			<a href="#"><img src="resources/img/15.jpg"></img></a>
			<a href="#"><img src="resources/img/16.jpg"></img></a>
			<a href="#"><img src="resources/img/17.jpg"></img></a>
			<a href="#"><img src="resources/img/18.jpg"></img></a>
		</div>
	  </div>
	</div>
 </div>
	  
  <!-- /slider --> 
  
  <!-- Content -->
  <div class="row-fluid">
    <div class="span8 pull-left"> 
    <h2>Based on your interest in miami area we found:</h2>
      <hr>
      <div class="dynamic-info">
        <!-- /result -->
		<div class="result">
			<div class="number">566</div>
			<p>
				<a href="serviceexchange">service exchange</a>
			</p>
		</div>
		<!-- /result -->
		<div class="result">
			<div class="number">15</div>
			<p>
				<a href="events">Events & updates</a>
			</p>
		</div>
		<!-- /result -->
		<div class="result">
			<div class="number">45</div>
			<p>
				<a href="communityissues">Community Issues</a>
			</p>
		</div>
		<!-- /result -->
		<div class="result">
			<div class="number">23</div>
			<p>
				<a href="business">Business near by</a>
			</p>
		</div>
		<!-- /result -->
		<div class="result">
			<div class="number">04</div>
			<p>
				<a href="communityhero">Community Heros</a>
			</p>
		</div>
		<!-- /result -->
		<div class="result">
			<div class="number">02</div>
			<p>
				<a href="communityservice">Community Services</a>
			</p>
		</div>
        <!-- /result --> 
      </div>
      <!-- /dynamic-info -->    

      <h2>We  found the below items you can barter near your area:</h2>
      <hr>
      <p>Found total 124 barter deals within 2 mile radius that you can trade with people near you. Use the slider to modify the distance.</p>
      <input class="span3" type="text" data-slider="true">
      <form>
			<p>Click the tag's below to see related result.</p>
			<ul id="readOnlyTags">
			    <li>Tag1</li>
			    <li>Tag2</li>
			</ul>
      </form>
      <!-- /dynamic-Tags -->
     <hr>
		<div id="lista" class="thumb-list">
		<c:forEach items="${list.list}" var="row">
		    <div class="thumb">
		      <div class="pic" ><img src="${photosFolder}${row.id}-thumb.jpg" alt="" onError="this.src='resources/img/marco.gif';"></div>
		      <jsp:element name="div">
				<jsp:attribute name="style">
					<c:choose><c:when test="${row.pic_height==null}">height:120px;</c:when><c:otherwise>height:${row.pic_height}px;</c:otherwise></c:choose>
				</jsp:attribute>
				<jsp:attribute name="class">details</jsp:attribute>
				<jsp:body>
					<div class="details">
					<div class="username"><a href="#"> ${row.title}</a> </div>
					<div class="status">${row.descrip}&#160;<a href="#">read more</a></div>
					<div class="separator"></div>
					<jsp:element name="div"> 
						<jsp:attribute name="style"><c:choose><c:when test="${row.pic_height==null}">top:55px;</c:when><c:otherwise>top:${row.pic_height-66}px;</c:otherwise></c:choose></jsp:attribute>
						<jsp:attribute name="class">pull-bottom</jsp:attribute>
						<jsp:body>
							<a class="btn btn-mini">Make Offer </a>
						</jsp:body>
					</jsp:element>
				</div>
				</jsp:body>
			  </jsp:element>
		    </div>
		</c:forEach>  
		</div>
		<div id="pagination" class="pagination">
		  	<c:if test="${list.pageNext !=null}">
		    <a id="urlnext" href="serviceexchangepag"/></a>
		    <a id="pagenext" href="${list.pageNext}"></a>
		    </c:if>
		</div>
    </div>
    <!-- /content area --> 
    <!-- Sidebar -->
    <div class="span4 pull-right">
     <div class="well">    
   
      <h2> Upload your deal</h2>
      <hr>
     <form id="addForm" method="post" action="addExchange" enctype="multipart/form-data">
	  <fieldset>
		<div class="input-append">
			<label>Upload Image</label>
			<div class="fileupload fileupload-new" data-provides="fileupload">
				<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="resources/img/marco.gif" /></div>
				<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
				<div>
					<span class="btn btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" id= "file" name="file"/></span>
				<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
				</div>
			</div>
		</div>
	    <label>Title of your deal</label>
	    <input class="span10" type="text" placeholder="Type something" id="title" name="title">
	    <label>Enter the description</label>
		<textarea class="span10" rows="3" id="descrip" name="descrip"></textarea>
		<p>Enter tag's to easily find your deal <br>ex:electronic, Service exchange</p>
        <br>
    	<label class="checkbox">
      		<input name="agree" id="agree" type="checkbox"> I agree to <a href="#">Terms &amp; Condition</a>
    	</label>
		<c:choose><c:when test="${userdetails.longitude!=null}"><button type="submit" class="btn">Submit</button></c:when>
		<c:otherwise><a href="myaccount" class="btn" style="margin-left:10px;">Register your address</a></c:otherwise></c:choose>    	
 		
  		</fieldset>
	</form>
     
</div><!-- /well -->      
     
    
     <h2>Your Uploaded Deals</h2>
      <hr>
           
        <div id="myLista" class="thumb-list">
    	<c:forEach items="${myList.list}" var="row">
	        <div class="thumb">
	          <div class="pic" ><img src="${photosFolder}${row.id}-thumb.jpg" alt="" onError="this.src='resources/img/marco.gif';"></div>
	          <div class="username"><a href="#"> ${row.title}</a> </div>
	        </div>
        </c:forEach>
          
         <a class="btn-mini pull-left">Edit Deals  </a>
         <a class="btn-mini pull-right">View More </a> </div>
            
   </div>
     
  </div>
    <!-- /Sidebar --> 
  <!-- FOOTER --><hr>
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2013 Zoowaa.com &middot; <a href=".">Home</a> &middot; <a href="#">About</a>&middot; <a href="#">Contact us</a>  &middot;<a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
  
 </div>
<!-- /Content --> 
<script src="resources/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.custom.js"></script>
<script src="resources/js/jquery-ui.custom.min.js"></script>
<script src="resources/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/tag-it.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/tag-it-function.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/bootstrap-transition.js"></script> 
<script src="resources/js/bootstrap-alert.js"></script> 
<script src="resources/js/bootstrap-modal.js"></script> 
<script src="resources/js/bootstrap-dropdown.js"></script> 
<script src="resources/js/bootstrap-scrollspy.js"></script> 
<script src="resources/js/bootstrap-tab.js"></script> 
<script src="resources/js/bootstrap-tooltip.js"></script> 
<script src="resources/js/bootstrap-popover.js"></script> 
<script src="resources/js/bootstrap-button.js"></script> 
<script src="resources/js/bootstrap-collapse.js"></script> 
<script src="resources/js/bootstrap-carousel.js"></script> 
<script src="resources/js/bootstrap-typeahead.js"></script>
<script src="resources/js/bootstrap-fileupload.js"></script>
<script src="resources/js/simple-slider.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/maps/error-replace.js"></script>
<script src="resources/js/jquery.montage.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	jQuery.validator.addMethod("accept", function(value, element, param) {
		if(value==null || value==""){
			return true;
		}
		var validator =new RegExp(param);
		var result = validator.test(value.toLowerCase());
		return result;
	});	
	$("#addForm").validate({
	    rules: {
			rules : {
				title:{
					required : true,
					email:true
				},
				descrip:{
					required : true
				},
				agree:{
					required : true
				},
				file:{
					accept:'^.*\.(jpg|jpeg|png|gif)$' 
				}
			},
			messages : {
				title: {
					required :"Enter Title of your deal",
					email: "Enter valid email address"
				},
				descrip: "Description of your deal is mandatory",
				agree: "If you do not agree to all the terms and conditions of this Agreement, you shouldn't and aren't permitted to use the Services.",
				file:{
					extension: "File must be JPG, GIF or PNG"
				}
			},
		    errorClass: "error",
		    validClass: "checked",
		    errorPlacement: function(error, element) {
		    	var wrapedError = wrapError(error,element,'leftarrow')
		        wrapedError.insertAfter(element);
		    	var img = $("<div class='errorImage'></div>");
		    	img.insertBefore(wrapedError);
		        wrapedError.css('left',element.offset().left + element.width() + 47);
		        wrapedError.css("top", element.offset().top);
		    },
		    success: function(element) {
		    	$(element).addClass("checked");
		    },
		    highlight: function (element, errorClass, validClass) {
                $(element).addClass(errorClass).removeClass(validClass);
	        },
	        unhighlight: function (element, errorClass, validClass) {
	                $(element).removeClass(errorClass).addClass(validClass);
	        }				
	   }
	});	
	$("#myTags").tagit();
	var isActive = false;
    $(window).scroll(function(){
    	if  (!isActive && ($(window).scrollTop() == $(document).height() - $(window).height())){	         		
    		//console.log('scroll bottom');
        		isActive = true;
        		var url = $('#urlnext').attr('href'),
        			pageNext=$('#pagenext').attr('href');
        		var posting = $.post( url, { page: pageNext });
        		posting.done(function(html) {
				$('#lista').append(html);
				nuevaPag  = $(html).find('#pagenxt').attr('href');
				$('#pagenext').attr('href',nuevaPag);
				if (nuevaPag!="-1"){
					isActive = false;
				}
        		});	         		
        }
    });
	$("[data-slider]").each(function() {
		var input = $(this);
		$("<span>").addClass("output").insertAfter($(this));
	})
	.bind("slider:ready slider:changed", function (event, data) {
		$(this).nextAll(".output:first").html(data.value.toFixed(3));
	});
	$('#showcode').toggle(
			function() {
				$(this).addClass('up').removeClass('down').next().slideDown();
			},
			function() {
				$(this).addClass('down').removeClass('up').next().slideUp();
			}
	);
	$('#panel').toggle(
			function() {
				$(this).addClass('show').removeClass('hide');
				$('#overlay').stop().animate( { left : - $('#overlay').width() + 20 + 'px' }, 300 );
			},
			function() {
				$(this).addClass('hide').removeClass('show');
				$('#overlay').stop().animate( { left : '0px' }, 300 );
			}
	);
	var $container 	= $('#am-container'),
	$imgs		= $container.find('img').hide(),
	totalImgs	= $imgs.length,
	cnt			= 0;

	$imgs.each(function(i) {
		var $img	= $(this);
		$('<img/>').load(function() {
			++cnt;
			if( cnt === totalImgs ) {
				$imgs.show();
				$container.montage({
					fillLastRow				: true,
					alternateHeight			: true,
					alternateHeightRange	: {
						min	: 40,
						max	: 40
					}
				});
				$('#overlay').fadeIn(500);
			}
		}).attr('src',$img.attr('src'));
	});		

});
</script>
</body>
</html>
