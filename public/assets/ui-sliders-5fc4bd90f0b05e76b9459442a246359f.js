var UISliders=function(){var i=function(){$("#slider_example_1").rangeSlider(),$("#slider_example_2").editRangeSlider(),$("#slider_example_3").dateRangeSlider({bounds:{min:new Date(2014,3,13),max:new Date(2016,1,18)},defaultValues:{min:new Date(2014,4,19),max:new Date(2014,2,31)}}),$("#slider_example_4").rangeSlider({valueLabels:"change",delayOut:1e3}),$("#slider_example_5").rangeSlider({valueLabels:"change",durationIn:1e3,durationOut:1e3}),$("#slider_example_6").rangeSlider({enabled:!1}),$("#slider_example_7").rangeSlider({range:{min:10,max:40}}),$("#slider_example_8").rangeSlider({step:10})},t=function(){$(".knob").knob({draw:function(){if("tron"==this.$.data("skin")){var i,t=this.angle(this.cv),e=this.startAngle,s=this.startAngle,n=s+t,a=!0;return this.g.lineWidth=this.lineWidth,this.o.cursor&&(s=n-.3)&&(n+=.3),this.o.displayPrevious&&(i=this.startAngle+this.angle(this.value),this.o.cursor&&(e=i-.3)&&(i+=.3),this.g.beginPath(),this.g.strokeStyle=this.previousColor,this.g.arc(this.xy,this.xy,this.radius-this.lineWidth,e,i,!1),this.g.stroke()),this.g.beginPath(),this.g.strokeStyle=a?this.o.fgColor:this.fgColor,this.g.arc(this.xy,this.xy,this.radius-this.lineWidth,s,n,!1),this.g.stroke(),this.g.lineWidth=2,this.g.beginPath(),this.g.strokeStyle=this.o.fgColor,this.g.arc(this.xy,this.xy,this.radius-this.lineWidth+1+2*this.lineWidth/3,0,2*Math.PI,!1),this.g.stroke(),!1}}});var i,t=0,e=0,s=0,n=$("div.idir"),a=$("div.ival"),h=function(){s++,n.show().html("+").fadeOut(),a.html(s)},r=function(){s--,n.show().html("-").fadeOut(),a.html(s)};$("input.infinite").knob({min:0,max:20,stopper:!1,change:function(){i>this.cv?t?(r(),t=0):(t=1,e=0):i<this.cv&&(e?(h(),e=0):(e=1,t=0)),i=this.cv}})};return{init:function(){i(),t()}}}();