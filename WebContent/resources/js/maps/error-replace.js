function wrapError(error,element,className) {
	var hoverPopup = $('<div class="jazz-ui-HoverPopup"/>');
	var wrapper = $('<div class="wrapper"/>');
	hoverPopup.append(wrapper);
	wrapper.append($('<div class="vert-trim1"/>'));
	wrapper.append($('<div class="vert-trim2"/>'));
	wrapper.append($('<div class="vert-trim3"/>'));
	var rightoutline = $('<div class="right-outline"/>');
	wrapper.append(rightoutline);
	var leftoutline = $('<div class="left-outline"/>');
	rightoutline.append(leftoutline);
	var sidetrim=$('<div class="side-trim"/>');
	leftoutline.append(sidetrim);
	var contentwrapper=$('<div class="content-wrapper"/>');
	sidetrim.append(contentwrapper);
	var content=$('<div class="content"/>');
	contentwrapper.append(content);
	content.append(error);
	wrapper.append($('<div class="vert-trim3"/>'));
	wrapper.append($('<div class="vert-trim2"/>'));
	wrapper.append($('<div class="vert-trim1"/>'));
	wrapper.append($('<div class="top-right corner"/>'));
	wrapper.append($('<div class="top-left corner"/>'));
	wrapper.append($('<div class="bottom-right corner"/>'));
	wrapper.append($('<div class="bottom-left corner"/>'));
	wrapper.append($('<div/>').addClass(className));
	return hoverPopup;
}

