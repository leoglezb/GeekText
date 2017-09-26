<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Zoowaa. Photo profile</title>
<link rel="stylesheet" type="text/css" href="resources/css/custom.css"/>
<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
<link href="resources/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css"/>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<link rel="stylesheet" href="resources/css/font-awesome.min.css"/>
<!--[if IE 7]>
    <link rel="stylesheet" href="assets/resources/css/font-awesome-ie7.min.css">
    <![endif]-->
<!--- Tag it Styles -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png"/>
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png"/>
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png"/>
<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png"/>
<link rel="shortcut icon" href="resources/ico/favicon.png" />
</head>
<body>
<!-- Facebook Like Code -->
<div id="fb-root"></div>
<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<!-- Facebook Like Code -->


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
      <div class="logo-z"> <img src="resources/img/logo-z.png"/> </div>
		<a><h4 style="padding-top:11px!important">Hello ${userdetails.name}</h4></a>
	 </div>
	 <!-- /small blue header end --> 
  </div>
  <!-- /header --> 

<div id="wrapper">
<div id="left_content" style="float:left;width:158px;height:auto;">

<div id="profile_pic">
	<img src="resources/profiles/${userdetails.username}-profile.jpg?v=${currentTimestamp}" alt="" id="thumb" style="width:155px;height:155px"/>
</div>
<br/>

<strong>W : </strong><input type="text" id="w1" name="w1" style="width:30px;" disabled="true"/>
&nbsp;
<strong>H : </strong><input type="text" id="h1" name="h1" style="width:30px;" disabled="true"/>
<br/><br/>
<a href="myaccount" class="btn" style="margin-left:10px;">Back to Account</a>
</div>
<div style="float:right;width:804px;">
<h1>Change Profile Picture</h1>
<div class="file_field">
	<form id="uploadphotoprofile" enctype="multipart/form-data" method='post' action="uploadphotoprofile">
		<strong>Select An Image: </strong>
		<input type="file" style="width:220px;" id="image_file" name="image_file"/>&#160;&#160;
		<input type="submit" value="Upload"/>
	</form>
	<form id="upload_form" enctype="multipart/form-data" method="post" action="changephotoprofile" style="display:none">
		<input type="hidden" id="w" name="w" />
	    <input type="hidden" id="h" name="h" />
	    <input type="hidden" id="x1" name="x1" />
	    <input type="hidden" id="y1" name="y1" />
	    <input type="hidden" id="x2" name="x2" />
	    <input type="hidden" id="y2" name="y2" />
		<input id="upload_button" type="submit" value="Upload" />
	</form>
</div>
<br/>
<!-- div class="error" ></div-->
<br/>
<div id="image_div">
<img id="load_img" src="" style="display: none;"/>
<br/>

</div>
</div>

<div style="clear: both"></div>
</div>
<!-- FOOTER --><hr>
<footer>
  <p class="pull-right"><a href="#">Back to top</a></p>
  <p>&copy; 2013 Zoowaa.com &middot; <a href=".">Home</a> &middot; <a href="#">About</a>&middot; <a href="#">Contact us</a>  &middot;<a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
<script src="resources/js/jquery.min.1.7.2.js"></script>
<script src="resources/js/jquery.Jcrop.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script>
$(document).ready(function(){
	var jcrop_api, boundx=10, boundy=10,
	xsize = $('#thumb').width(),
	ysize = $('#thumb').height();
	$('#uploadphotoprofile').ajaxForm({
		dataType: "html",
        beforeSubmit: function(a,f,o) {

        },
        success: function(html) {
			d = new Date();
		    $("#load_img").show("fast");
			$("#load_img").attr("src",$(html).attr("src")+"?"+d.getTime())
			.load(function() {
	            selectImgWidth = this.naturalWidth; //set the global image width
	        	selectImgHeight = this.naturalHeight;//set the global image height
				$("#thumb").attr("src",$(html).attr("src")+"?"+d.getTime());
		    });
		    if (typeof jcrop_api != 'undefined') jcrop_api.destroy();
		    $("#load_img").Jcrop({
	            minSize: [32, 32], // min crop size
	             aspectRatio : 1, // keep aspect ratio 1:1
	             bgFade: true, // use fade effect
	             bgOpacity: .3, // fade opacity
	             onChange: updatePreview,
	             onSelect: updatePreview
			},function(){
			      // Use the API to get the real image size
			      var bounds = this.getBounds();
			      boundx = bounds[0];
			      boundy = bounds[1];
			      jcrop_api = this;
			      //$preview.appendTo(jcrop_api.ui.holder);
			 });
		    $("#uploadphotoprofile").hide("fast");
		    $("#upload_form").show("fast");
        },
        error:function(x,e){
            if(x.status==0){
                alert('You are offline!!\n Please Check Your Network.');
            }else if(x.status==404){
                alert('Requested URL not found.');
            }else if(x.status==500){
                alert('Internel Server Error.');
            }else if(e=='parsererror'){
                alert('Error.\nParsing JSON Request failed.');
            }else if(e=='timeout'){
                alert('Request Time out.');
            }else {
                alert('Unknow Error.\n'+x.responseText);
            }
        }
    });
	function updatePreview(c){
		  if (parseInt(c.w) > 0) {
		    var rx = xsize / c.w;
		    var ry = ysize / c.h;
			$('#w').val(c.w);
		    $('#h').val(c.h);
		    $('#w1').val(c.w);
		    $('#h1').val(c.h);
		    $('#x1').val(c.x);
		    $('#y1').val(c.y);
		    $('#x2').val(c.x2);
		    $('#y2').val(c.y2);
		    $('#thumb').css({
		      width: Math.round(rx * boundx) + 'px',
		      height: Math.round(ry * boundy) + 'px',
		      marginLeft: '-' + Math.round(rx * c.x) + 'px',
		      marginTop: '-' + Math.round(ry * c.y) + 'px'
		    });
		  }
	};
});

</script>    
</body>
</html>