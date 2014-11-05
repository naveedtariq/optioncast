(function() {
  jQuery(function() {
    var answers, return_answer;
    answers = void 0;
    return_answer = void 0;
    return_answer = function() {
      var escaped_question, find, options, question, replace, value;
      escaped_question = void 0;
      options = void 0;
      question = void 0;
      value = void 0;
      $("#plan_criteria_answer_id").parent().hide();
      question = $("#plan_criteria_question_id :selected").text();
      escaped_question = question.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, "\\$1");
      options = $(answers).filter("optgroup[label='" + escaped_question + "']").html();
      if (options) {
        options = "<option value=\"\"></option>" + options;
        value = $("#plan_criteria_hidden_answer_value").val();
        find = "value=\"" + value + "\"";
        replace = "selected=\"selected\" value=\"" + value + "\"";
        options = options.replace(find, replace);
        $("#plan_criteria_answer_id").html(options);
        $("#plan_criteria_answer_id").parent().show();
      } else {
        $("#plan_criteria_answer_id").empty();
      }
    };
    answers = $("#plan_criteria_answer_id").html();
    return_answer();
    return $("#plan_criteria_question_id").change(return_answer);
  });

}).call(this);
