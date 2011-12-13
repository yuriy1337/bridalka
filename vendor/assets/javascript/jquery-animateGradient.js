/*! 
* Copyright (c) 2011 Tom Ellis (http://www.webmuse.co.uk)
* jQuery Gradient Animations v 1.0
* Limitations:
  - Works with jQuery 1.4.3 and higher
  - Works in Firefox 3.6+, Safari 5.1+, Chrome 13+, Opera 11.10+, IE9+ 
* Requires:
  - jQuery Gradient cssHook
  - jQuery Color Animations v2 plugin
* Licensed under the MIT License (LICENSE.txt).
*/
(function(c){c.fn.animateGradient=function(f,g,l){function m(a){a=a;a=a.replace(t,u);a=a.replace(v,w);a=a.replace(/,/g,"|");a=a.replace(/{}/g,",");return a.split("|")}var x=/^(.*?)linear-gradient(.*?)$/i,n=/^(.*?)radial-gradient(.*?)$/i,o=/^(.*?)(:?linear-gradient)(\()(.*)(\))(.*?)$/i,p=/^(.*?)(:?radial-gradient)(\()(.*)(\))(.*?)$/i,t=/(rgb|hsl)\(\s?([0-9]+)\s?,\s?([0-9]+)\s?,\s?([0-9]+)\s?\)/gi,v=/(rgb|hsl)a\(([0-9]+),([0-9]+),([0-9]+),([0-9\.]+)?\)/gi,u="$1($2{}$3{}$4)",w="$1a($2{}$3{}$4{}$5)",
q=/(rgb|hsl)(a?)(\()/i,y=[].push;return this.each(function(){var a=c(this);g||(g=1E3);time=g/10;for(var j=0;j<=time;j+=5)(function(){var r=j,z=r/(g/1E3)/100;a.queue(function(A){var k=a.css("backgroundImage"),b;b=[];var e=[],h=[],d=0,s="linear-gradient",i=false;if(!k||!x.test(f)&&!n.test(f))return false;if(n.test(f)){s="radial-gradient";i=true}b=i?p.exec(k):o.exec(k);b=q.test(c.trim(b[4]))?m(b[4]):c.trim(b[4]).split(",");e=i?p.exec(f):o.exec(f);e=q.test(c.trim(e[4]))?m(e[4]):c.trim(e[4]).split(",");
h=[];if(b.length>2&&!i){d=1;h.push(b[0])}else if(i){d=2;y.call(h,b[0],b[1])}for(d=d;d<=b.length-1;d++){between=c.Color(c.trim(b[d])).transition(c.Color(c.trim(e[d])),z);h.push(between)}a.css("backgroundImage",s+"("+h.join(", ")+")");setTimeout(function(){A()},g/10);r===time&&l&&l.apply(a)})})()})}})(jQuery);
