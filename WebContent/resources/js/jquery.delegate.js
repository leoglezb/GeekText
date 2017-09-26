(function() {
 
// jQuery(context).delegate(selector, types, fn)
// jQuery(context).delegate(selector, types, data, fn)
// jQuery(context).delegate(selector, {type: fn})
var delegate = jQuery.fn.delegate;
jQuery.fn.delegate = function(selector, types, data, fn){
if (jQuery.isPlainObject(types)){
for (var type in types) delegate.call(this, selector, type, undefined, types[type]);
}else{
delegate.call(this, selector, types, data, fn)
}
return this;
}
 
var undelegate = jQuery.fn.delegate;
jQuery.fn.undelegate = function(selector, types, fn){
if (jQuery.isPlainObject(types)){
for (var type in types) delegate.call(this, selector, type, types[type]);
}else{
undelegate.call(this, selector, types, fn)
}
return this;
}
 
})();