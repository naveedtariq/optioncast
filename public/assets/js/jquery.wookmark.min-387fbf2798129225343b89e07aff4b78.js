/*!
  jQuery Wookmark plugin 0.5
  @name jquery.wookmark.js
  @author Christoph Ono (chri@sto.ph or @gbks)
  @version 0.5
  @date 3/19/2012
  @category jQuery plugin
  @copyright (c) 2009-2012 Christoph Ono (www.wookmark.com)
  @license Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) license.
*/

$.fn.wookmark=function(a){if(!this.wookmarkOptions){this.wookmarkOptions=$.extend({container:$("body"),offset:2,autoResize:false,itemWidth:$(this[0]).outerWidth(),resizeDelay:50},a)}else if(a){this.wookmarkOptions=$.extend(this.wookmarkOptions,a)}if(!this.wookmarkColumns){this.wookmarkColumns=null;this.wookmarkContainerWidth=null}this.wookmarkLayout=function(){var a=this.wookmarkOptions.itemWidth+this.wookmarkOptions.offset;var b=this.wookmarkOptions.container.width();var c=Math.floor((b+this.wookmarkOptions.offset)/a);var d=Math.round((b-(c*a-this.wookmarkOptions.offset))/2);var e=0;if(this.wookmarkColumns!=null&&this.wookmarkColumns.length==c){e=this.wookmarkLayoutColumns(a,d)}else{e=this.wookmarkLayoutFull(a,c,d)}this.wookmarkOptions.container.css("height",e+"px")};this.wookmarkLayoutFull=function(a,b,c){var d=[];while(d.length<b){d.push(0)}this.wookmarkColumns=[];while(this.wookmarkColumns.length<b){this.wookmarkColumns.push([])}var e,f,g,h=0,i=0,j=this.length,k=null,l=null,m=0;for(;h<j;h++){e=$(this[h]);k=null;l=0;for(i=0;i<b;i++){if(k==null||d[i]<k){k=d[i];l=i}}e.css({position:"absolute",top:k+"px",left:l*a+c+"px"});d[l]=k+e.outerHeight()+this.wookmarkOptions.offset;m=Math.max(m,d[l]);this.wookmarkColumns[l].push(e)}return m};this.wookmarkLayoutColumns=function(a,b){var c=[];while(c.length<this.wookmarkColumns.length){c.push(0)}var d=0,e=this.wookmarkColumns.length,f;var g=0,h,i;var j=0;for(;d<e;d++){f=this.wookmarkColumns[d];h=f.length;for(g=0;g<h;g++){i=f[g];i.css({left:d*a+b+"px",top:c[d]+"px"});c[d]+=i.outerHeight()+this.wookmarkOptions.offset;j=Math.max(j,c[d])}}return j};this.wookmarkResizeTimer=null;if(!this.wookmarkResizeMethod){this.wookmarkResizeMethod=null}if(this.wookmarkOptions.autoResize){this.wookmarkOnResize=function(a){if(this.wookmarkResizeTimer){clearTimeout(this.wookmarkResizeTimer)}this.wookmarkResizeTimer=setTimeout($.proxy(this.wookmarkLayout,this),this.wookmarkOptions.resizeDelay)};if(!this.wookmarkResizeMethod){this.wookmarkResizeMethod=$.proxy(this.wookmarkOnResize,this)}$(window).resize(this.wookmarkResizeMethod)}this.wookmarkClear=function(){if(this.wookmarkResizeTimer){clearTimeout(this.wookmarkResizeTimer);this.wookmarkResizeTimer=null}if(this.wookmarkResizeMethod){$(window).unbind("resize",this.wookmarkResizeMethod)}};this.wookmarkLayout();this.show()}
;