jQuery ->
  answers = undefined
  return_answer = undefined
  return_answer = ->
    escaped_question = undefined
    options = undefined
    question = undefined
    value = undefined
    $("#plan_criteria_answer_id").parent().hide()
    question = $("#plan_criteria_question_id :selected").text()
    escaped_question = question.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, "\\$1")
    options = $(answers).filter("optgroup[label='" + escaped_question + "']").html()
    if options
      options = "<option value=\"\"></option>" + options
      value = $("#plan_criteria_hidden_answer_value").val()
      find = "value=\"" + value + "\""
      replace = "selected=\"selected\" value=\"" + value + "\""
      options = options.replace find, replace
      $("#plan_criteria_answer_id").html options
      $("#plan_criteria_answer_id").parent().show()
    else
      $("#plan_criteria_answer_id").empty()
    return

  answers = $("#plan_criteria_answer_id").html()
  return_answer()
  $("#plan_criteria_question_id").change return_answer
