!function(){var p=null;window.PR_SHOULD_USE_CONTINUATION=!0;
(function(){function S(b){function c(e){var b=e.charCodeAt(0);if(b!==92)return b;var a=e.charAt(1);return(b=q[a])?b:"0"<=a&&a<="7"?parseInt(e.substring(1),8):a==="u"||a==="x"?parseInt(e.substring(2),16):e.charCodeAt(1)}function g(e){if(e<32)return(e<16?"\\x0":"\\x")+e.toString(16);e=String.fromCharCode(e);return e==="\\"||e==="-"||e==="]"||e==="^"?"\\"+e:e}function d(e){var b=e.substring(1,e.length-1).match(/\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\[0-3][0-7]{0,2}|\\[0-7]{1,2}|\\[\S\s]|[^\\]/g),e=[],a=
b[0]==="^",d=["["];a&&d.push("^");for(var a=a?1:0,f=b.length;a<f;++a){var h=b[a];if(/\\[bdsw]/i.test(h))d.push(h);else{var h=c(h),l;a+2<f&&"-"===b[a+1]?(l=c(b[a+2]),a+=2):l=h;e.push([h,l]);l<65||h>122||(l<65||h>90||e.push([Math.max(65,h)|32,Math.min(l,90)|32]),l<97||h>122||e.push([Math.max(97,h)&-33,Math.min(l,122)&-33]))}}e.sort(function(e,a){return e[0]-a[0]||a[1]-e[1]});b=[];f=[];for(a=0;a<e.length;++a)h=e[a],h[0]<=f[1]+1?f[1]=Math.max(f[1],h[1]):b.push(f=h);for(a=0;a<b.length;++a)h=b[a],d.push(g(h[0])),
h[1]>h[0]&&(h[1]+1>h[0]&&d.push("-"),d.push(g(h[1])));d.push("]");return d.join("")}function x(e){for(var a=e.source.match(/\[(?:[^\\\]]|\\[\S\s])*]|\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\\d+|\\[^\dux]|\(\?[!:=]|[()^]|[^()[\\^]+/g),b=a.length,c=[],f=0,h=0;f<b;++f){var l=a[f];l==="("?++h:"\\"===l.charAt(0)&&(l=+l.substring(1))&&(l<=h?c[l]=-1:a[f]=g(l))}for(f=1;f<c.length;++f)-1===c[f]&&(c[f]=++u);for(h=f=0;f<b;++f)l=a[f],l==="("?(++h,c[h]||(a[f]="(?:")):"\\"===l.charAt(0)&&(l=+l.substring(1))&&l<=h&&
(a[f]="\\"+c[l]);for(f=0;f<b;++f)"^"===a[f]&&"^"!==a[f+1]&&(a[f]="");if(e.ignoreCase&&m)for(f=0;f<b;++f)l=a[f],e=l.charAt(0),l.length>=2&&e==="["?a[f]=d(l):e!=="\\"&&(a[f]=l.replace(/[A-Za-z]/g,function(a){a=a.charCodeAt(0);return"["+String.fromCharCode(a&-33,a|32)+"]"}));return a.join("")}for(var u=0,m=!1,j=!1,k=0,a=b.length;k<a;++k){var i=b[k];if(i.ignoreCase)j=!0;else if(/[a-z]/i.test(i.source.replace(/\\u[\da-f]{4}|\\x[\da-f]{2}|\\[^UXux]/gi,""))){m=!0;j=!1;break;}}for(var q={b:8,t:9,n:10,v:11,
f:12,r:13},n=[],k=0,a=b.length;k<a;++k){i=b[k];if(i.global||i.multiline)throw Error(""+i);n.push("(?:"+x(i)+")")}return RegExp(n.join("|"),j?"gi":"g")}function T(b,c){function g(b){var a=b.nodeType;if(a==1){if(!d.test(b.className)){for(a=b.firstChild;a;a=a.nextSibling)g(a);a=b.nodeName.toLowerCase();if("br"===a||"li"===a)x[j]="\n",m[j<<1]=u++,m[j++<<1|1]=b}}else if(a==3||a==4)a=b.nodeValue,a.length&&(a=c?a.replace(/\r\n?/g,"\n"):a.replace(/[\t\n\r ]+/g," "),x[j]=a,m[j<<1]=u,u+=a.length,m[j++<<1|1]=
b)}var d=/(?:^|\s)nocode(?:\s|$)/,x=[],u=0,m=[],j=0;g(b);return{a:x.join("").replace(/\n$/,""),d:m}}function H(b,c,g,d){c&&(b={a:c,e:b},g(b),d.push.apply(d,b.g))}function U(b){for(var c=void 0,g=b.firstChild;g;g=g.nextSibling);var d=g.nodeType,c=d===1?c?b:g:d===3?V.test(g.nodeValue)?b:c:c;return c===b?void 0:c}function C(b,c){function g(b){for(var j=b.e,k=[j,"pln"],a=0,i=b.a.match(x)||[],q={},n=0,e=i.length;n<e;++n){var z=i[n],w=q[z],s=void 0,f;if(typeof w==="string")f=!1;else{var h=d[z.charAt(0)];
if(h)s=z.match(h[1]),w=h[0];else{for(f=0;f<u;++f)if(h=c[f],s=z.match(h[1])){w=h[0];break;}s||(w="pln")}if((f=w.length>=5&&"lang-"===w.substring(0,5))&&!(s&&typeof s[1]==="string"))f=!1,w="src";f||(q[z]=w)}h=a;a+=z.length;if(f){f=s[1];var l=z.indexOf(f),B=l+f.length;s[2]&&(B=z.length-s[2].length,l=B-f.length);w=w.substring(5);H(j+h,z.substring(0,l),g,k);H(j+h+l,f,I(w,f),k);H(j+h+B,z.substring(B),g,k)}else k.push(j+h,w)}b.g=k}var d={},x;(function(){for(var g=b.concat(c),j=[],k={},a=0,i=g.length;a<i;++a){var q=
g[a],n=q[3];if(n)for(var e=n.length;--e>=0;)d[n.charAt(e)]=q;q=q[1];n=""+q;k.hasOwnProperty(n)||(j.push(q),k[n]=p)}j.push(/[\S\s]/);x=S(j)})();var u=c.length;return g}function v(b){var c=[],g=[];b.tripleQuotedStrings?c.push(["str",/^(?:'''(?:[^'\\]|\\[\S\s]|''?(?=[^']))*(?:'''|$)|"""(?:[^"\\]|\\[\S\s]|""?(?=[^"]))*(?:"""|$)|'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$))/,p,"'\""]):b.multiLineStrings?c.push(["str",/^(?:'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$)|`(?:[^\\`]|\\[\S\s])*(?:`|$))/,
p,"'\"`"]):c.push(["str",/^(?:'(?:[^\n\r'\\]|\\.)*(?:'|$)|"(?:[^\n\r"\\]|\\.)*(?:"|$))/,p,"\"'"]);b.verbatimStrings&&g.push(["str",/^@"(?:[^"]|"")*(?:"|$)/,p]);var d=b.hashComments;d&&(b.cStyleComments?(d>1?c.push(["com",/^#(?:##(?:[^#]|#(?!##))*(?:###|$)|.*)/,p,"#"]):c.push(["com",/^#(?:(?:define|e(?:l|nd)if|else|error|ifn?def|include|line|pragma|undef|warning)\b|[^\n\r]*)/,p,"#"]),g.push(["str",/^<(?:(?:(?:\.\.\/)*|\/?)(?:[\w-]+(?:\/[\w-]+)+)?[\w-]+\.h(?:h|pp|\+\+)?|[a-z]\w*)>/,p])):c.push(["com",
/^#[^\n\r]*/,p,"#"]));b.cStyleComments&&(g.push(["com",/^\/\/[^\n\r]*/,p]),g.push(["com",/^\/\*[\S\s]*?(?:\*\/|$)/,p]));b.regexLiterals&&g.push(["lang-regex",/^(?:^^\.?|[+-]|[!=]={0,2}|#|%=?|&&?=?|\(|\*=?|[+-]=|->|\/=?|::?|<<?=?|>{1,3}=?|[,;?@[{~]|\^\^?=?|\|\|?=?|break|case|continue|delete|do|else|finally|instanceof|return|throw|try|typeof)\s*(\/(?=[^*/])(?:[^/[\\]|\\[\S\s]|\[(?:[^\\\]]|\\[\S\s])*(?:]|$))+\/)/]);(d=b.types)&&g.push(["typ",d]);b=(""+b.keywords).replace(/^ | $/g,"");b.length&&g.push(["kwd",
RegExp("^(?:"+b.replace(/[\s,]+/g,"|")+")\\b"),p]);c.push(["pln",/^\s+/,p," \r\n\t\u00a0"]);g.push(["lit",/^@[$_a-z][\w$@]*/i,p],["typ",/^(?:[@_]?[A-Z]+[a-z][\w$@]*|\w+_t\b)/,p],["pln",/^[$_a-z][\w$@]*/i,p],["lit",/^(?:0x[\da-f]+|(?:\d(?:_\d+)*\d*(?:\.\d*)?|\.\d\+)(?:e[+-]?\d+)?)[a-z]*/i,p,"0123456789"],["pln",/^\\[\S\s]?/,p],["pun",/^.[^\s\w"$'./@\\`]*/,p]);return C(c,g)}function J(b,c,g){function d(a){var b=a.nodeType;if(b==1&&!u.test(a.className))if("br"===a.nodeName)x(a),a.parentNode&&a.parentNode.removeChild(a);
else for(a=a.firstChild;a;a=a.nextSibling)d(a);else if((b==3||b==4)&&g){var c=a.nodeValue,i=c.match(m);if(i)b=c.substring(0,i.index),a.nodeValue=b,(c=c.substring(i.index+i[0].length))&&a.parentNode.insertBefore(j.createTextNode(c),a.nextSibling),x(a),b||a.parentNode.removeChild(a)}}function x(b){function c(a,b){var d=b?a.cloneNode(!1):a,e=a.parentNode;if(e){var e=c(e,1),g=a.nextSibling;e.appendChild(d);for(var i=g;i;i=g)g=i.nextSibling,e.appendChild(i)}return d}for(;!b.nextSibling;)if(b=b.parentNode,
!b)return;for(var b=c(b.nextSibling,0),d;(d=b.parentNode)&&d.nodeType===1;)b=d;a.push(b)}for(var u=/(?:^|\s)nocode(?:\s|$)/,m=/\r\n?|\n/,j=b.ownerDocument,k=j.createElement("li");b.firstChild;)k.appendChild(b.firstChild);for(var a=[k],i=0;i<a.length;++i)d(a[i]);c===(c|0)&&a[0].setAttribute("value",c);var q=j.createElement("ol");q.className="linenums";for(var c=Math.max(0,c-1|0)||0,i=0,n=a.length;i<n;++i)k=a[i],k.className="L"+(i+c)%10,k.firstChild||k.appendChild(j.createTextNode("\u00a0")),q.appendChild(k);
b.appendChild(q)}function r(b,c){for(var g=c.length;--g>=0;){var d=c[g];F.hasOwnProperty(d)?D.console&&console.warn("cannot override language handler %s",d):F[d]=b}}function I(b,c){if(!b||!F.hasOwnProperty(b))b=/^\s*</.test(c)?"default-markup":"default-code";return F[b]}function K(b){var c=b.h;try{var g=T(b.c,b.i),d=g.a;b.a=d;b.d=g.d;b.e=0;I(c,d)(b);var x=/\bMSIE\s(\d+)/.exec(navigator.userAgent),x=x&&+x[1]<=8,c=/\n/g,u=b.a,m=u.length,g=0,j=b.d,k=j.length,d=0,a=b.g,i=a.length,q=0;a[i]=m;var n,e;for(e=
n=0;e<i;)a[e]!==a[e+2]?(a[n++]=a[e++],a[n++]=a[e++]):e+=2;i=n;for(e=n=0;e<i;){for(var r=a[e],w=a[e+1],s=e+2;s+2<=i&&a[s+1]===w;)s+=2;a[n++]=r;a[n++]=w;e=s}a.length=n;var f=b.c,h;if(f)h=f.style.display,f.style.display="none";try{for(;d<k;){var l=j[d+2]||m,B=a[q+2]||m,s=Math.min(l,B),A=j[d+1],G;if(A.nodeType!==1&&(G=u.substring(g,s))){x&&(G=G.replace(c,"\r"));A.nodeValue=G;var L=A.ownerDocument,o=L.createElement("span");o.className=a[q+1];var v=A.parentNode;v.replaceChild(o,A);o.appendChild(A);g<l&&
(j[d+1]=A=L.createTextNode(u.substring(s,l)),v.insertBefore(A,o.nextSibling))}g=s;g>=l&&(d+=2);g>=B&&(q+=2)}}finally{if(f)f.style.display=h}}catch(t){D.console&&console.log(t&&t.stack||t)}}var D=window,y=["break,continue,do,else,for,if,return,while"],E=[[y,"auto,case,char,const,default,double,enum,extern,float,goto,inline,int,long,register,short,signed,sizeof,static,struct,switch,typedef,union,unsigned,void,volatile"],"catch,class,delete,false,import,new,operator,private,protected,public,this,throw,true,try,typeof"],
M=[E,"alignof,align_union,asm,axiom,bool,concept,concept_map,const_cast,constexpr,decltype,delegate,dynamic_cast,explicit,export,friend,generic,late_check,mutable,namespace,nullptr,property,reinterpret_cast,static_assert,static_cast,template,typeid,typename,using,virtual,where"],N=[E,"abstract,assert,boolean,byte,extends,final,finally,implements,import,instanceof,interface,null,native,package,strictfp,super,synchronized,throws,transient"],O=[N,"as,base,by,checked,decimal,delegate,descending,dynamic,event,fixed,foreach,from,group,implicit,in,internal,into,is,let,lock,object,out,override,orderby,params,partial,readonly,ref,sbyte,sealed,stackalloc,string,select,uint,ulong,unchecked,unsafe,ushort,var,virtual,where"],
E=[E,"debugger,eval,export,function,get,null,set,undefined,var,with,Infinity,NaN"],P=[y,"and,as,assert,class,def,del,elif,except,exec,finally,from,global,import,in,is,lambda,nonlocal,not,or,pass,print,raise,try,with,yield,False,True,None"],Q=[y,"alias,and,begin,case,class,def,defined,elsif,end,ensure,false,in,module,next,nil,not,or,redo,rescue,retry,self,super,then,true,undef,unless,until,when,yield,BEGIN,END"],W=[y,"as,assert,const,copy,drop,enum,extern,fail,false,fn,impl,let,log,loop,match,mod,move,mut,priv,pub,pure,ref,self,static,struct,true,trait,type,unsafe,use"],
y=[y,"case,done,elif,esac,eval,fi,function,in,local,set,then,until"],R=/^(DIR|FILE|vector|(de|priority_)?queue|list|stack|(const_)?iterator|(multi)?(set|map)|bitset|u?(int|float)\d*)\b/,V=/\S/,X=v({keywords:[M,O,E,"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END",P,Q,y],hashComments:!0,cStyleComments:!0,multiLineStrings:!0,regexLiterals:!0}),F={};r(X,["default-code"]);r(C([],
[["pln",/^[^<?]+/],["dec",/^<!\w[^>]*(?:>|$)/],["com",/^<\!--[\S\s]*?(?:--\>|$)/],["lang-",/^<\?([\S\s]+?)(?:\?>|$)/],["lang-",/^<%([\S\s]+?)(?:%>|$)/],["pun",/^(?:<[%?]|[%?]>)/],["lang-",/^<xmp\b[^>]*>([\S\s]+?)<\/xmp\b[^>]*>/i],["lang-js",/^<script\b[^>]*>([\S\s]*?)(<\/script\b[^>]*>)/i],["lang-css",/^<style\b[^>]*>([\S\s]*?)(<\/style\b[^>]*>)/i],["lang-in.tag",/^(<\/?[a-z][^<>]*>)/i]]),["default-markup","htm","html","mxml","xhtml","xml","xsl"]);r(C([["pln",/^\s+/,p," \t\r\n"],["atv",/^(?:"[^"]*"?|'[^']*'?)/,
p,"\"'"]],[["tag",/^^<\/?[a-z](?:[\w-.:]*\w)?|\/?>$/i],["atn",/^(?!style[\s=]|on)[a-z](?:[\w:-]*\w)?/i],["lang-uq.val",/^=\s*([^\s"'>]*(?:[^\s"'/>]|\/(?=\s)))/],["pun",/^[/<->]+/],["lang-js",/^on\w+\s*=\s*"([^"]+)"/i],["lang-js",/^on\w+\s*=\s*'([^']+)'/i],["lang-js",/^on\w+\s*=\s*([^\s"'>]+)/i],["lang-css",/^style\s*=\s*"([^"]+)"/i],["lang-css",/^style\s*=\s*'([^']+)'/i],["lang-css",/^style\s*=\s*([^\s"'>]+)/i]]),["in.tag"]);r(C([],[["atv",/^[\S\s]+/]]),["uq.val"]);r(v({keywords:M,hashComments:!0,
cStyleComments:!0,types:R}),["c","cc","cpp","cxx","cyc","m"]);r(v({keywords:"null,true,false"}),["json"]);r(v({keywords:O,hashComments:!0,cStyleComments:!0,verbatimStrings:!0,types:R}),["cs"]);r(v({keywords:N,cStyleComments:!0}),["java"]);r(v({keywords:y,hashComments:!0,multiLineStrings:!0}),["bash","bsh","csh","sh"]);r(v({keywords:P,hashComments:!0,multiLineStrings:!0,tripleQuotedStrings:!0}),["cv","py","python"]);r(v({keywords:"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END",
hashComments:!0,multiLineStrings:!0,regexLiterals:!0}),["perl","pl","pm"]);r(v({keywords:Q,hashComments:!0,multiLineStrings:!0,regexLiterals:!0}),["rb","ruby"]);r(v({keywords:E,cStyleComments:!0,regexLiterals:!0}),["javascript","js"]);r(v({keywords:"all,and,by,catch,class,else,extends,false,finally,for,if,in,is,isnt,loop,new,no,not,null,of,off,on,or,return,super,then,throw,true,try,unless,until,when,while,yes",hashComments:3,cStyleComments:!0,multilineStrings:!0,tripleQuotedStrings:!0,regexLiterals:!0}),
["coffee"]);r(v({keywords:W,cStyleComments:!0,multilineStrings:!0}),["rc","rs","rust"]);r(C([],[["str",/^[\S\s]+/]]),["regex"]);var Y=D.PR={createSimpleLexer:C,registerLangHandler:r,sourceDecorator:v,PR_ATTRIB_NAME:"atn",PR_ATTRIB_VALUE:"atv",PR_COMMENT:"com",PR_DECLARATION:"dec",PR_KEYWORD:"kwd",PR_LITERAL:"lit",PR_NOCODE:"nocode",PR_PLAIN:"pln",PR_PUNCTUATION:"pun",PR_SOURCE:"src",PR_STRING:"str",PR_TAG:"tag",PR_TYPE:"typ",prettyPrintOne:D.prettyPrintOne=function(b,c,g){var d=document.createElement("div");
d.innerHTML="<pre>"+b+"</pre>";d=d.firstChild;g&&J(d,g,!0);K({h:c,j:g,c:d,i:1});return d.innerHTML},prettyPrint:D.prettyPrint=function(b,c){function g(){for(var d=D.PR_SHOULD_USE_CONTINUATION?a.now()+250:Infinity;i<u.length&&a.now()<d;i++){for(var c=u[i],j=h,k=c;k=k.previousSibling;){var m=k.nodeType,o=(m===7||m===8)&&k.nodeValue;if(o?!/^\??prettify\b/.test(o):m!==3||/\S/.test(k.nodeValue))break;if(o){j={};o.replace(/\b(\w+)=([\w%+\-.:]+)/g,function(a,b,c){j[b]=c});break;}}k=c.className;if((j!==h||
e.test(k))&&!v.test(k)){m=!1;for(o=c.parentNode;o;o=o.parentNode)if(f.test(o.tagName)&&o.className&&e.test(o.className)){m=!0;break;}if(!m){c.className+=" prettyprinted";m=j.lang;if(!m){var m=k.match(n),y;if(!m&&(y=U(c))&&s.test(y.tagName))m=y.className.match(n);m&&(m=m[1])}if(w.test(c.tagName))o=1;else var o=c.currentStyle,t=r.defaultView,o=(o=o?o.whiteSpace:t&&t.getComputedStyle?t.getComputedStyle(c,p).getPropertyValue("white-space"):0)&&"pre"===o.substring(0,3);t=j.linenums;if(!(t=t==="true"||+t))t=
(t=k.match(/\blinenums\b(?::(\d+))?/))?t[1]&&t[1].length?+t[1]:!0:!1;t&&J(c,t,o);q={h:m,c:c,j:t,i:o};K(q)}}}i<u.length?setTimeout(g,250):"function"===typeof b&&b()}for(var d=c||document.body,r=d.ownerDocument||document,d=[d.getElementsByTagName("pre"),d.getElementsByTagName("code"),d.getElementsByTagName("xmp")],u=[],m=0;m<d.length;++m)for(var j=0,k=d[m].length;j<k;++j)u.push(d[m][j]);var d=p,a=Date;a.now||(a={now:function(){return+new Date;}});var i=0,q,n=/\blang(?:uage)?-([\w.]+)(?!\S)/,e=/\bprettyprint\b/,
v=/\bprettyprinted\b/,w=/pre|xmp/i,s=/^code$/i,f=/^(?:pre|code|xmp)$/i,h={};g()}};typeof define==="function"&&define.amd&&define("google-code-prettify",[],function(){return Y})})();}()
