var PagesGallery=function(){var e=function(){$(".group1").colorbox({rel:"group1",transition:"none",width:"100%",height:"100%",retinaImage:!0})},n=function(){$(".wrap-image .chkbox").bind("click",function(){$(this).parent().hasClass("selected")?$(this).parent().removeClass("selected").children("a").children("img").removeClass("selected"):$(this).parent().addClass("selected").children("a").children("img").addClass("selected")})};return{init:function(){e(),n()}}}();