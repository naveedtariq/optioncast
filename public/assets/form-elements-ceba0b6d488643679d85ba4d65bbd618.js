var FormElements=function(){var e=function(){$(".limited").inputlimiter({remText:"You only have %n character%s remaining...",remFullText:"Stop typing! You're not allowed any more characters!",limitText:"You're allowed to input %n character%s into this field."})},t=function(){$("textarea.autosize").autosize()},o=function(){$(".search-select").select2({placeholder:"Select a State",allowClear:!0})},n=function(){$.mask.definitions["~"]="[+-]",$(".input-mask-date").mask("99/99/9999"),$(".input-mask-phone").mask("(999) 999-9999"),$(".input-mask-eyescript").mask("~9.99 ~9.99 999"),$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val())}})},i=function(){$(".currency").maskMoney()},r=function(){$(".date-picker").datepicker({autoclose:!0})},a=function(){$(".time-picker").timepicker()},c=function(){$(".date-range").daterangepicker(),$(".date-time-range").daterangepicker({timePicker:!0,timePickerIncrement:15,format:"MM/DD/YYYY h:mm A"})},l=function(){$(".color-picker").colorpicker({format:"hex"}),$(".color-picker-rgba").colorpicker({format:"rgba"}),$(".colorpicker-component").colorpicker()},u=function(){$(".color-palette").colorPalette().on("selectColor",function(e){$("#selected-color1").val(e.color)})},m=function(){$("#tags_1").tagsInput({width:"auto"})},s=function(){$(".summernote").summernote({height:300,tabsize:2})},p=function(){CKEDITOR.disableAutoInline=!0,$("textarea.ckeditor").ckeditor()};return{init:function(){e(),t(),o(),n(),i(),r(),a(),c(),l(),u(),m(),s(),p()}}}();