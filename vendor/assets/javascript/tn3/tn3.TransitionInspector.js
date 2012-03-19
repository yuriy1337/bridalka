(function($) {

    var T = $.fn.tn3.TransitionInspector = function(c) {
	this.$c = c;
	this.$c.text("Click on the image to preview");
	this.$imgc = this.$c.append("<div></div>").find(":last");
	this.$imgc.width(620).height(378);
	this.img = new $.fn.tn3.Imager(this.$imgc, [
	    {
		img:"images/620x378/2.jpg"
	    },{
		img:"images/620x378/5.jpg"
	    }
	], {});
	this.img.show(0);
	var ins = this;
	this.$imgc.bind("img_click", function(e) {
	    ins.img.show("next");
	});
	this.$out = this.$c.append('<div class="out"></div>').find(":last");
	this.$conc = this.$c.append("<div></div>").find(":last");
	this.$concc = this.$conc.append("<div></div>").find(":last");
	//this.$imgc.css("float", "left");
	//this.$conc.css("float", "left");
	this.$conc.css("margin-top", "20px");
	//this.$concc.css("position", "relative").width(590);
	this.createSelect("type", $.fn.tn3.Transitions.defined, "fade", true);
    };
    T.prototype = {
	$c:null,
	$imgc:null,
	img:null,
	$conc:null,
	$concc:null,
	tobj:{},
	createUI: function(typ) 
	{
	    this.$concc.empty();
	    this.tobj = {};
	    var po = $.fn.tn3.Transitions.prototype[typ + "Config"];
	    this[typ + "Extra"](po);
	    return po;
	},
	createContainer: function(lab)
	{
	    var $mc = this.$concc.append("<div><fieldset></fieldset></div>").find(":last");
	    $mc.append('<legend>' + lab + '</legend>');
	    return $mc.append("<div></div>").find(":last");
	},
	createSlider: function(lab, min, max, def) 
	{
	    var $mc = this.createContainer(lab);
	    //$mc.css("padding", "10px");
	    var $val = $('<div class="value">' + def + '</div>');
	    $val.appendTo($mc.parent());
	    var ins = this;
	    $mc.slider({
		min: min,
		max: max,
		value: def,
		slide: function(e, ui) {
		    $val.text(ui.value);
		    ins.setValue(lab, ui.value);
		}
	    });
	    this.setValue(lab, def);
	},
	createSelect: function(lab, obj, def, outc)
	{
	    if (outc) var $mc = this.$conc.prepend('<select class="combo"></select>').find(":first");
		else var $mc = this.createContainer(lab).append('<select class="combo"></select>').find(":last");
	    $.each(obj, function(val, text) {
		$mc.append($('<option></option>').val($.isArray(obj)? text:val).html(text));
	    });
	    $mc.find("option[value='" + def + "']").attr("selected", "selected");
	    var ins = this;
	    $mc.change(function(e) {
		var v = $(this).find("option:selected").val();
		ins.setValue(lab, v);
	    });
	    this.setValue(lab, def);
	    return $mc;
	},
	createCheck: function(lab, def)
	{
	    var $mc = this.createContainer(lab).append('<input type="checkbox"></input>').find(":last");
	    var ins = this;
	    $mc.change(function(e) {
		ins.setValue(lab, e.target.checked);
	    });
	    $mc.attr("checked", def);
	    this.setValue(lab, def);
	},
	setValue: function(p, v)
	{
	    if (p == "type") {
		this.createUI(v);		
	    }
	    this.tobj[p] = v;
	    this.img.ts.ts = [this.tobj];
	    var a = [];
	    for (var i in this.tobj) {
		a.unshift( "&nbsp;&nbsp;&nbsp;&nbsp;" + i + ": " + this.getQuotes(this.tobj[i]) ); 
	    }
	    this.$out.html("{<br />" + a.join(",<br />") + "<br />}");
	},
	getQuotes: function(val) 
	{
	    if (typeof(val) == "string") return '"' + val + '"';
	    return val;
	},
	noneExtra: function(p)
	{
	},
	fadeExtra: function(p) 
	{
	    this.createSlider("duration", 0, 5000, p.duration);
	    this.createSelect("easing", ease, p.easing);
	},
	slideExtra: function(p) 
	{
	    this.createSlider("duration", 0, 5000, p.duration);
	    this.createSelect("direction", ["left", "right", "top", "bottom", "auto"], p.direction);
	    this.createSelect("easing", ease, p.easing);
	},
	blindsExtra: function(p) 
	{
	    this.createSlider("duration", 0, 5000, p.duration);
	    this.createSelect("direction", ["horizontal", "vertical"], p.direction);
	    this.createSelect("easing", ease, p.easing);
	    this.createSlider("parts", 1, 50, p.parts);
	    this.createSlider("partDuration", 0, 5000, p.partDuration);
	    this.createSelect("partEasing", ease, p.partEasing);
	    this.createSelect("method", ["fade", "scale", "slide"], p.method);
	    this.createSelect("partDirection", ["left", "right", "top", "bottom", "auto"], p.partDirection);
	    this.createCheck("cross", p.cross);
	},
	gridExtra: function(p) 
	{
	    this.createSlider("duration", 0, 5000, p.duration);
	    this.createSelect("easing", ease, p.easing);
	    this.createSlider("gridX", 1, 50, p.gridX);
	    this.createSlider("gridY", 1, 50, p.gridY);
	    this.createSelect("sort", ["flat", "diagonal", "circle", "random"], p.sort);
	    this.createCheck("sortReverse", p.sortReverse);
	    this.createSelect("diagonalStart", {
		tr: "top right",
		tl: "top left",
		br: "bottom right",
		bl: "bottom left"
	    }, p.diagonalStart);
	    this.createSelect("method", ["fade", "scale"], p.method);
	    this.createSlider("partDuration", 0, 5000, p.partDuration);
	    this.createSelect("partEasing", ease, p.partEasing);
	    this.createSelect("partDirection", ["left", "top"], p.partDirection);
	},
	gradientSwapExtra: function(p) 
	{
	    this.createSlider("duration", 0, 5000, p.duration);
	    this.createSelect("easing", ease, p.easing);
	    this.createSelect("direction", ["left", "right", "auto"], p.direction);
	    this.createSlider("spread", 1, 150, p.spread);
	    this.createCheck("radial", p.radial);
	}
    }
    var ease = {
	swing: "swing",
	linear: "linear",
	easeInQuad: "quadIn",
	easeOutQuad: "quadOut",
	easeInOutQuad: "quadInOut",
	easeInCubic: "cubicIn",
	easeOutCubic: "cubicOut",
	easeInOutCubic: "cubicInOut",
	easeInQuart: "quartIn",
	easeOutQuart: "quartOut",
	easeInOutQuart: "quartInOut",
	easeInQuint: "quintIn",
	easeOutQuint: "quintOut",
	easeInOutQuint: "quintInOut",
	easeInSine: "sineIn",
	easeOutSine: "sineOut",
	easeInOutSine: "sineInOut",
	easeInExpo: "expoIn",
	easeOutExpo: "expoOut",
	easeInOutExpo: "expoInOut",
	easeInCirc: "circIn",
	easeOutCirc: "circOut",
	easeInOutCirc: "circInOut",
	easeInElastic: "elasticIn",
	easeOutElastic: "elasticOut",
	easeInOutElastic: "elasticInOut",
	easeInBack: "backIn",
	easeOutBack: "backOut",
	easeInOutBack: "backInOut",
	easeInBounce: "bounceIn",
	easeOutBounce: "bounceOut",
	easeInOutBounce: "bounceInOut" 
    };

})(jQuery);
