var isIE8=!1,isIE9=!1,$windowWidth,$windowHeight,$pageArea;!function(e,a){var o=function(e,a,o){var i;return function(){function t(){o||e.apply(s,n),i=null}var s=this,n=arguments;i?clearTimeout(i):o&&e.apply(s,n),i=setTimeout(t,a||100)}};jQuery.fn[a]=function(e){return e?this.bind("resize",o(e)):this.trigger(a)}}(jQuery,"clipresize");var Main=function(){var e=function(){if(/MSIE (\d+\.\d+);/.test(navigator.userAgent)){var e=new Number(RegExp.$1);8==e?isIE8=!0:9==e&&(isIE9=!0)}},a=function(){$windowWidth=$(window).width(),$windowHeight=$(window).height(),$pageArea=$windowHeight-$("body > .navbar").outerHeight()-$("body > .footer").outerHeight(),$(".sidebar-search input").removeAttr("style").removeClass("open"),o()},o=function(){mainContainer=$(".main-content > .container"),mainNavigation=$(".main-navigation"),760>$pageArea&&($pageArea=760),mainContainer.outerHeight()<mainNavigation.outerHeight()&&mainNavigation.outerHeight()>$pageArea?mainContainer.css("min-height",mainNavigation.outerHeight()):mainContainer.css("min-height",$pageArea),768>$windowWidth&&mainNavigation.css("min-height",$windowHeight-$("body > .navbar").outerHeight())},i=function(){$(".todo-actions").length&&$(".todo-actions").click(function(){return $(this).find("i").hasClass("fa-square-o")||$(this).find("i").hasClass("icon-check-empty")?($(this).find("i").hasClass("fa")?$(this).find("i").removeClass("fa-square-o").addClass("fa-check-square-o"):$(this).find("i").removeClass("icon-check-empty").addClass("fa fa-check-square-o"),$(this).parent().find("span").css({opacity:.25}),$(this).parent().find(".desc").css("text-decoration","line-through")):($(this).find("i").removeClass("fa-check-square-o").addClass("fa-square-o"),$(this).parent().find("span").css({opacity:1}),$(this).parent().find(".desc").css("text-decoration","none")),!1})},t=function(){$(".tooltips").length&&$(".tooltips").tooltip()},s=function(){$(".popovers").length&&$(".popovers").popover()},n=function(){$(".show-tab").length&&$(".show-tab").bind("click",function(e){e.preventDefault();var a=$(this).attr("href");$(a).length&&$('a[href="'+a+'"]').tab("show")}),f("tabId").length&&$('a[href="#'+f("tabId")+'"]').tab("show")},r=function(){$(".panel-scroll").length&&$(".panel-scroll").perfectScrollbar({wheelSpeed:50,minScrollbarLength:20,suppressScrollX:!0})},l=function(){$(".accordion").length&&$(".accordion .panel-collapse").each(function(){$(this).hasClass("in")||$(this).prev(".panel-heading").find(".accordion-toggle").addClass("collapsed")}),$(".accordion").collapse().height("auto");$(".accordion .accordion-toggle").bind("click",function(){currentTab=$(this),$("html,body").animate({scrollTop:currentTab.offset().top-100},1e3)})},c=function(){$(".navigation-toggler").bind("click",function(){$("body").hasClass("navigation-small")?$("body").removeClass("navigation-small"):$("body").addClass("navigation-small")})},d=function(){$(".panel-tools .panel-expand").bind("click",function(){$(".panel-tools a").not(this).hide(),$("body").append('<div class="full-white-backdrop"></div>'),$(".main-container").removeAttr("style"),backdrop=$(".full-white-backdrop"),wbox=$(this).parents(".panel"),wbox.removeAttr("style"),wbox.hasClass("panel-full-screen")?backdrop.fadeIn(200,function(){$(".panel-tools a").show(),wbox.removeClass("panel-full-screen"),backdrop.fadeOut(200,function(){backdrop.remove()})}):($("body").append('<div class="full-white-backdrop"></div>'),backdrop.fadeIn(200,function(){$(".main-container").css({"max-height":$(window).outerHeight()-$("header").outerHeight()-$(".footer").outerHeight()-100,overflow:"hidden"}),backdrop.fadeOut(200),backdrop.remove(),wbox.addClass("panel-full-screen").css({"max-height":$(window).height(),overflow:"auto"})}))}),$(".panel-tools .panel-close").bind("click",function(e){$(this).parents(".panel").remove(),e.preventDefault()}),$(".panel-tools .panel-refresh").bind("click",function(e){var a=$(this).parents(".panel");a.block({overlayCSS:{backgroundColor:"#fff"},message:'<img src="assets/images/loading.gif" /> Just a moment...',css:{border:"none",color:"#333",background:"none"}}),window.setTimeout(function(){a.unblock()},1e3),e.preventDefault()}),$(".panel-tools .panel-collapse").bind("click",function(e){e.preventDefault();var a=jQuery(this).parent().closest(".panel").children(".panel-body");$(this).hasClass("collapses")?($(this).addClass("expand").removeClass("collapses"),a.slideUp(200)):($(this).addClass("collapses").removeClass("expand"),a.slideDown(200))})},p=function(){$(".main-navigation-menu li.active").addClass("open"),$(".main-navigation-menu > li a").bind("click",function(){$(this).parent().children("ul").hasClass("sub-menu")&&(!$("body").hasClass("navigation-small")||767>$windowWidth||!$(this).parent().parent().hasClass("main-navigation-menu"))&&($(this).parent().hasClass("open")?$(this).parent().hasClass("active")?$(this).parent().parent().children("li.open").removeClass("open").children("ul").slideUp(200,function(){o()}):$(this).parent().parent().children("li.open").not($(".main-navigation-menu > li.active")).removeClass("open").children("ul").slideUp(200,function(){o()}):($(this).parent().addClass("open"),$(this).parent().parent().children("li.open").not($(this).parent()).not($(".main-navigation-menu > li.active")).removeClass("open").children("ul").slideUp(200),$(this).parent().children("ul").slideDown(200,function(){o()})))})},u=function(){$(".go-top").bind("click",function(e){$("html, body").animate({scrollTop:0},"slow"),e.preventDefault()})},h=function(){$(".dropdown-menu.dropdown-enduring").length&&$(".dropdown-menu.dropdown-enduring").click(function(e){e.stopPropagation()})},f=function(e){e=e.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");var a=new RegExp("[\\?&]"+e+"=([^&#]*)"),o=a.exec(location.search);return null==o?"":decodeURIComponent(o[1].replace(/\+/g," "))},b=function(){($('input[type="checkbox"]').length||$('input[type="radio"]').length)&&($('input[type="checkbox"].grey, input[type="radio"].grey').iCheck({checkboxClass:"icheckbox_minimal-grey",radioClass:"iradio_minimal-grey",increaseArea:"10%"}),$('input[type="checkbox"].red, input[type="radio"].red').iCheck({checkboxClass:"icheckbox_minimal-red",radioClass:"iradio_minimal-red",increaseArea:"10%"}),$('input[type="checkbox"].green, input[type="radio"].green').iCheck({checkboxClass:"icheckbox_minimal-green",radioClass:"iradio_minimal-green",increaseArea:"10%"}),$('input[type="checkbox"].teal, input[type="radio"].teal').iCheck({checkboxClass:"icheckbox_minimal-aero",radioClass:"iradio_minimal-aero",increaseArea:"10%"}),$('input[type="checkbox"].orange, input[type="radio"].orange').iCheck({checkboxClass:"icheckbox_minimal-orange",radioClass:"iradio_minimal-orange",increaseArea:"10%"}),$('input[type="checkbox"].purple, input[type="radio"].purple').iCheck({checkboxClass:"icheckbox_minimal-purple",radioClass:"iradio_minimal-purple",increaseArea:"10%"}),$('input[type="checkbox"].yellow, input[type="radio"].yellow').iCheck({checkboxClass:"icheckbox_minimal-yellow",radioClass:"iradio_minimal-yellow",increaseArea:"10%"}),$('input[type="checkbox"].square-black, input[type="radio"].square-black').iCheck({checkboxClass:"icheckbox_square",radioClass:"iradio_square",increaseArea:"10%"}),$('input[type="checkbox"].square-grey, input[type="radio"].square-grey').iCheck({checkboxClass:"icheckbox_square-grey",radioClass:"iradio_square-grey",increaseArea:"10%"}),$('input[type="checkbox"].square-red, input[type="radio"].square-red').iCheck({checkboxClass:"icheckbox_square-red",radioClass:"iradio_square-red",increaseArea:"10%"}),$('input[type="checkbox"].square-green, input[type="radio"].square-green').iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",increaseArea:"10%"}),$('input[type="checkbox"].square-teal, input[type="radio"].square-teal').iCheck({checkboxClass:"icheckbox_square-aero",radioClass:"iradio_square-aero",increaseArea:"10%"}),$('input[type="checkbox"].square-orange, input[type="radio"].square-orange').iCheck({checkboxClass:"icheckbox_square-orange",radioClass:"iradio_square-orange",increaseArea:"10%"}),$('input[type="checkbox"].square-purple, input[type="radio"].square-purple').iCheck({checkboxClass:"icheckbox_square-purple",radioClass:"iradio_square-purple",increaseArea:"10%"}),$('input[type="checkbox"].square-yellow, input[type="radio"].square-yellow').iCheck({checkboxClass:"icheckbox_square-yellow",radioClass:"iradio_square-yellow",increaseArea:"10%"}),$('input[type="checkbox"].flat-black, input[type="radio"].flat-black').iCheck({checkboxClass:"icheckbox_flat",radioClass:"iradio_flat",increaseArea:"10%"}),$('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({checkboxClass:"icheckbox_flat-grey",radioClass:"iradio_flat-grey",increaseArea:"10%"}),$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({checkboxClass:"icheckbox_flat-red",radioClass:"iradio_flat-red",increaseArea:"10%"}),$('input[type="checkbox"].flat-green, input[type="radio"].flat-green').iCheck({checkboxClass:"icheckbox_flat-green",radioClass:"iradio_flat-green",increaseArea:"10%"}),$('input[type="checkbox"].flat-teal, input[type="radio"].flat-teal').iCheck({checkboxClass:"icheckbox_flat-aero",radioClass:"iradio_flat-aero",increaseArea:"10%"}),$('input[type="checkbox"].flat-orange, input[type="radio"].flat-orange').iCheck({checkboxClass:"icheckbox_flat-orange",radioClass:"iradio_flat-orange",increaseArea:"10%"}),$('input[type="checkbox"].flat-purple, input[type="radio"].flat-purple').iCheck({checkboxClass:"icheckbox_flat-purple",radioClass:"iradio_flat-purple",increaseArea:"10%"}),$('input[type="checkbox"].flat-yellow, input[type="radio"].flat-yellow').iCheck({checkboxClass:"icheckbox_flat-yellow",radioClass:"iradio_flat-yellow",increaseArea:"10%"}))},g=function(){{var e=$(".sidebar-search input"),a=$(".sidebar-search button");$(".sidebar-search")}e.attr("data-default",$(e).outerWidth()).focus(function(){$(this).animate({width:200},200)}).blur(function(){""==$(this).val()&&($(this).hasClass("open")?$(this).animate({width:0,opacity:0},200,function(){$(this).hide()}):$(this).animate({width:$(this).attr("data-default")},200))}),a.bind("click",function(){if($(e).is(":hidden"))$(e).addClass("open").css({width:0,opacity:0}).show().animate({width:200,opacity:1},200).focus();else if($(e).hasClass("open")&&""==$(e).val())$(e).removeClass("open").animate({width:0,opacity:0},200,function(){$(this).hide()});else{if(""!=$(e).val())return;$(e).focus()}return!1})},y=function(){$(".style-toggle").bind("click",function(){$(this).hasClass("open")?($(this).removeClass("open").addClass("close"),$("#style_selector_container").hide()):($(this).removeClass("close").addClass("open"),$("#style_selector_container").show())}),k(),m(),x(),v(),C()};$(".drop-down-wrapper").perfectScrollbar({wheelSpeed:50,minScrollbarLength:20,suppressScrollX:!0}),$(".navbar-tools .dropdown").on("shown.bs.dropdown",function(){$(this).find(".drop-down-wrapper").scrollTop(0).perfectScrollbar("update")});var k=function(){$(".icons-color a").bind("click",function(){$(".icons-color img").each(function(){$(this).removeClass("active")}),$(this).find("img").addClass("active"),"stylesheet/less"==$("#skin_color").attr("rel")&&($("#skin_color").next("style").remove(),$("#skin_color").attr("rel","stylesheet")),$("#skin_color").attr("href","assets/css/theme_"+$(this).attr("id")+".css")})},C=function(){$(".boxed-patterns a").bind("click",function(){if($("body").hasClass("layout-boxed")){var e=$("body").attr("class").split(" ").filter(function(e){return-1===e.indexOf("bg_style_")?e:""});$("body").attr("class",e.join(" ")),$(".boxed-patterns img").each(function(){$(this).removeClass("active")}),$(this).find("img").addClass("active"),$("body").addClass($(this).attr("id"))}else alert("Select boxed layout")})},m=function(){$('select[name="layout"]').change(function(){"boxed"==$('select[name="layout"] option:selected').val()?$("body").addClass("layout-boxed"):$("body").removeClass("layout-boxed")})},x=function(){$('select[name="header"]').change(function(){"default"==$('select[name="header"] option:selected').val()?$("body").addClass("header-default"):$("body").removeClass("header-default")})},v=function(){$('select[name="footer"]').change(function(){"fixed"==$('select[name="footer"] option:selected').val()?$("body").addClass("footer-fixed"):$("body").removeClass("footer-fixed")})},w=function(){$(".colorpalette").length&&$(".colorpalette").colorPalette().on("selectColor",function(e){$(this).closest("ul").prev("a").children("i").css("background-color",e.color).end().closest("div").prev("input").val(e.color),_()})},_=function(){$("		.icons-color img").removeClass("active"),"stylesheet"==$("#skin_color").attr("rel")&&($("#skin_color").attr("rel","stylesheet/less").attr("href","assets/less/styles.less"),less.sheets.push($("link#skin_color")[0]),less.refresh()),less.modifyVars({"@base":$(".color-base").val(),"@text":$(".color-text").val(),"@badge":$(".color-badge").val()})},q=function(){$(window).clipresize(function(){a()})},A=function(){$(".save_style").bind("click",function(){var e=new Object;e.rtl=$("body").hasClass("rtl")?!0:!1,$("body").hasClass("layout-boxed")?(e.layoutBoxed=!0,$("body[class]").filter(function(){for(var a=this.className.split(/\s+/),o=0;o<a.length;++o)"bg_style_"===a[o].substr(0,9)&&(e.bgStyle=a[o])})):e.layoutBoxed=!1,e.headerDefault=$("body").hasClass("header-default")?!0:!1,e.footerDefault=$("body").hasClass("footer-fixed")?!1:!0,"stylesheet"==$("#skin_color").attr("rel")?e.useLess=!1:"stylesheet/less"==$("#skin_color").attr("rel")&&(e.useLess=!0,e.baseColor=$(".color-base").val(),e.textColor=$(".color-text").val(),e.badgeColor=$(".color-badge").val()),e.skinClass=$("#skin_color").attr("href"),$.cookie("clip-setting",JSON.stringify(e));var a=$("#style_selector_container");a.block({overlayCSS:{backgroundColor:"#fff"},message:'<img src="assets/images/loading.gif" /> Just a moment...',css:{border:"none",color:"#333",background:"none"}}),window.setTimeout(function(){a.unblock()},1e3)})},F=function(){if($.cookie("clip-setting")){var e=jQuery.parseJSON($.cookie("clip-setting"));e.layoutBoxed&&($("body").addClass("layout-boxed"),$('#style_selector select[name="layout"]').find('option[value="boxed"]').attr("selected","true")),e.headerDefault&&($("body").addClass("header-default"),$('#style_selector select[name="header"]').find('option[value="default"]').attr("selected","true")),e.footerDefault||($("body").addClass("footer-fixed"),$('#style_selector select[name="footer"]').find('option[value="fixed"]').attr("selected","true")),$("#style_selector").length&&(e.useLess?($(".color-base").val(e.baseColor).next(".dropdown").find("i").css("background-color",e.baseColor),$(".color-text").val(e.textColor).next(".dropdown").find("i").css("background-color",e.textColor),$(".color-badge").val(e.badgeColor).next(".dropdown").find("i").css("background-color",e.badgeColor),_()):($(".color-base").val("#FFFFFF").next(".dropdown").find("i").css("background-color","#FFFFFF"),$(".color-text").val("#555555").next(".dropdown").find("i").css("background-color","#555555"),$(".color-badge").val("#007AFF").next(".dropdown").find("i").css("background-color","#007AFF"),$("#skin_color").attr("href",e.skinClass))),$("body").addClass(e.bgStyle)}else H()},S=function(){$(".clear_style").bind("click",function(){$.removeCookie("clip-setting"),$("body").removeClass("layout-boxed header-default footer-fixed"),$("body")[0].className=$("body")[0].className.replace(/\bbg_style_.*?\b/g,""),"stylesheet/less"==$("#skin_color").attr("rel")&&($("#skin_color").next("style").remove(),$("#skin_color").attr("rel","stylesheet")),$(".icons-color img").first().trigger("click"),H()})},H=function(){$('#style_selector select[name="layout"]').val("default"),$('#style_selector select[name="header"]').val("fixed"),$('#style_selector select[name="footer"]').val("default"),$("		.boxed-patterns img").removeClass("active"),$(".color-base").val("#FFFFFF").next(".dropdown").find("i").css("background-color","#FFFFFF"),$(".color-text").val("#555555").next(".dropdown").find("i").css("background-color","#555555"),$(".color-badge").val("#007AFF").next(".dropdown").find("i").css("background-color","#007AFF")};return{init:function(){q(),e(),y(),g(),a(),i(),c(),p(),u(),d(),h(),t(),s(),r(),n(),l(),b(),w(),A(),F(),S()}}}();