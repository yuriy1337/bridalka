
(function($) {
    var $c, dir, id, loadedc, special = {
		rv:[],
		rh:[],
		v:[],
		h:[],
		o:[]
	    };

    $.fn.tn3SkinCSSInspector = function(dr, lid) {

	dir = dr;
	id = lid;
	$this = $(this);
	$this.empty();
	$this.css("visibility", "none");
	loadCSS(dir + id + ".css");
	return this;
    };
    
    function loadCSS(p) {
	$.ajax({
		url:p,
		success:function(data){
			if (loadedc !== undefined) $('link[href="' + loaded + '"]').empty();
			loadedc = p;
			var head = document.getElementsByTagName('head')[0]; 
			$(document.createElement('link')) 
			    .attr({type: 'text/css', href: p, rel: 'stylesheet'}) 
			    .appendTo(head);
			loadSkin();
		}
	});
    };	
    function loadSkin() {
	$.ajax({
	    url:dir + id + ".html",
	    dataType:'html',
	    success:function(data){
		data = parseLayout(data);
		$this.css("visibility", "visible");
		$c = $this.append(data);
		$c.css("position", "relative");
		init();
	    },
	    dataFilter:function(raw,typ) {
		raw = raw.substring(raw.indexOf('<body>')+6, raw.lastIndexOf('</body>'));
		return raw;
	    },
	    error:function(XMLHttpRequest, textStatus, errorThrown) {
		$.log(arguments);
	    }
	})
    };
    
    function parseLayout(html) {
	// prepend layout directory path to image paths
	var ipath, ie, ib = html.indexOf("<img src=");
	while (ib != -1) {
	    ib += 10;
	    ie = html.indexOf("\"", ib);
	    ipath = dir + html.substring(ib, ie);
	    html = html.substr(0, ib) + ipath + html.substr(ie);
	    ib = html.indexOf("<img src=", ib);
	}
	var $html = $(html);
	$html.find("div[class^='" + id + "-']").each(function (index) {
	    el = this.className.split(" ")[0].substr(id.length+1);
	    if (this.className.indexOf("tn3_") != -1) {
		addSpecial(el, this.className);
		this.className = this.className.split(" ")[0];
	    }
	});
	return $html.get(0);
    }
    function addSpecial(el, cattr) {
	var a = cattr.split(" "), b;
	for (var i = 0; i < a.length; i++) {
	    b = a[i].split("_");
	    if (b[0] == "tn3") {
		special[b[1]].push(el);
	    }
	}
    }

    function init() {
	var rules = getCSSRules(document.styleSheets);
	if (!rules) {
	    setTimeout(function(){init()}, 100);
	    return;
	}
	// center
	$.each(special.v, function(i, v) {
	    $el = $c.find("." + id + "-" + v);
	    $el.css("top", ($el.parent().height() - $el.height()) / 2);
	});
	$.each(special.h, function(i, v) {
	    $el = $c.find("." + id + "-" + v);
	    $el.css("left", ($el.parent().width() - $el.width()) / 2);
	});

	var $out = $c.append('<div class="out"></div>').find(":last");
	var $gal = $c.find("." + id + "-gallery");
	// fix for outerWidth(true) margin problem in webkit
	$gal.css("display", "inline-block");
	var cssRules = {};
	$.each(rules, function(i, val) {
	    if (val.selectorText != undefined) {
		var etxt = ($.browser.msie)? val.style.cssText : val.cssText.substring(val.cssText.indexOf("{") + 2, val.cssText.indexOf("}") - 1);
		etxt = "&nbsp;&nbsp;" + etxt.split("; ").join("<br/>&nbsp;&nbsp;");
		var nme = val.selectorText.substr(1);
		cssRules[nme] = "<b>" + nme + "</b><br/>" + etxt;
	    }
	});
	$c.find("div[class^='" + id + "-']").each(function (index) {
	    $(this).css("border", "1px solid red");
	    $(this).mouseover(function(e) {
		e.stopPropagation();
		var cls = this.className;
		$out.html(cssRules[cls]);
		//$.log(cssRules[cls]);
	    }).mouseout( function(e) {
		//$.log("leave");
	    });
	});
	$gal.mouseout(function(e) {
	    $out.empty();
	});
	$c.find("div[class^='" + id + "-album']").each(function (index) {
	    $(this).hide();
	});
	$("." + id + "-album-title").show();
    }

    function getCSSRules(ss) {
	for (var i = 0; i < ss.length; i++ ) {
	    if (ss[i].href && ss[i].href.substr(ss[i].href.lastIndexOf("/") + 1) == id + ".css") {
		if (!$.browser.msie) return ss[i].cssRules;
		return ss[i].rules;
	    }
	}
	return null;
    }


})(jQuery);
