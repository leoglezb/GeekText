$(function() {
	$('.more').live("click", function() {
		var ID = $(this).attr("id");
		if (ID) {
			$("#more" + ID).html('<img src="moreajax.gif" />');

			$.ajax({
				type : "POST",
				url : "ajax_more.php",
				data : "lastmsg=" + ID,
				cache : false,
				success : function(html) {
					$("ol#updates").append(html);
					$("#more" + ID).remove(); // removing old more button
				}
			});
		} else {
			$(".morebox").html('The End');// no results
		}

		return false;
	});
});
