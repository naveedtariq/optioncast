var ready;
ready = function() {
    Main.init();
    UISliders.init();
    Charts.init();
    FormWizard.init();
};

$(document).ready(ready);
$(document).on('page:load', ready);


//jQuery(document).ready(function() {
//
// });