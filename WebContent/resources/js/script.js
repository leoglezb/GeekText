//Make global variables for selected image for further usage
var selectImgWidth,selectImgHeight,jcrop_api, boundx, boundy,isError=false,
xsize = $('#thumb').width(),
ysize = $('#thumb').height();

$(document).ready(function(){
    $('#uploadphotoprofile').ajaxForm({
        beforeSubmit: function(a,f,o) {

        },
        success: function(html) {
			d = new Date();
			$("#load_img").attr("src",$(html).attr("src")+"?"+d.getTime())
			.load(function() {
	            selectImgWidth = this.naturalWidth; //set the global image width
	        	selectImgHeight = this.naturalHeight;//set the global image height
				$("#thumb").attr("src",$(html).attr("src")+"?"+d.getTime());
		    });
		    if (typeof jcrop_api != 'undefined') jcrop_api.destroy();
		    $("#load_img").Jcrop({
	            minSize: [32, 32], // min crop size
	            // aspectRatio : 1, // keep aspect ratio 1:1
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
        }
    });
});

	/*
	 	$('#uploadphotoprofile_button').on('click', function(e) {
	    var flag = 0;
	    var selectedImg = $('#image_file')[0].value;
	    //Check the select file is JPG,PNG or GIF image
	    var regex = /^(image\/jpeg|image\/png)$/i;
	    if (! regex.test(selectedImg.type)) {
	        $('.error').html('Please select a valid image file (jpg and png are allowed)').fadeIn(500);
	        flag++;
	        isError = true;
	    }
	    
	    // Check the size of selected image if it is greater than 250 kb or not
	    else if (selectedImg.size > 5 * 1020 * 1024) {
	        $('.error').html('The file you selected is too big. Max file size limit is 5 MB').fadeIn(500);
	        flag++;
	        isError = true;
	    }
	    if(flag==0){
		    isError=false;
		    $('.error').hide(); //if file is correct then hide the error message
		    //uploadAjax();
		}	 
		uploadAjax();
		return false;
	});
	*/

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

function validateForm(){
	if ($('#image_file').val()=='') {
        $('.error').html('Please select an image').fadeIn(500);
        return false;
    }else if(isError){
    	return false;
    }else {
    	return true;
    }
}
function uploadAjax(){
	var inputFileImage = document.getElementById("image_file");
	var file = $('#image_file')[0].value;
	var data = new FormData();
	data.append("image_file",file);
	var url = "uploadphotoprofile";
	$.ajax({
		url:url,
		type:"POST",
		contentType:false,
		data:data,
		processData:false,
		cache:false
	}).done(function(html) {
		d = new Date();
		$("#load_img").attr("src",$(html).attr("src")+"?"+d.getTime())
		.load(function() {
            selectImgWidth = this.naturalWidth; //set the global image width
        	selectImgHeight = this.naturalHeight;//set the global image height
			$("#thumb").attr("src",$(html).attr("src")+"?"+d.getTime());
	    });
	    if (typeof jcrop_api != 'undefined') jcrop_api.destroy();
	    $("#load_img").Jcrop({
            minSize: [32, 32], // min crop size
            // aspectRatio : 1, // keep aspect ratio 1:1
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
	});
}
