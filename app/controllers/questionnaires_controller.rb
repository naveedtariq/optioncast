class QuestionnairesController < ApplicationController


  def start
    session[:questionnair_params] = nil    
    render 'new'

  end

  def goal
    session[:questionnair_params] = {}
    if params[:goal]
      session[:questionnair_params]["goal"] = params[:goal]
    end
    session[:questionnair_params]["index"] = nil
    session[:questionnair_params]["answers"] = []

    @questionnaire = Questionnaires.new(session[:questionnair_params])

    fill_farm

    return render json: @html
  end

  def create
    if !session[:questionnair_params] || !session[:questionnair_params]["goal"]
      render 'new'
      return
    end

    @questionnaire = Questionnaires.new(session[:questionnair_params])
    session[:questionnair_params]["answers"].push({"question"=>session[:questionnair_params]["index"],"answer"=>params["answer"],"kind"=>params["kind"]})

    if @questionnaire.last_question?
      if user_signed_in?
        session[:questionnair_params]["user_id"] = current_user.id
        @questionnaire.save(session[:questionnair_params])
      end
      session[:questionnair_params] = nil
      @html= [what_is_optioncast_path]                         
    else
      @questionnaire.next_question
      fill_farm
    end
    
    return render json: @html

  end

  def fill_farm
    session[:questionnair_params]["index"] = @questionnaire.get_current_question
    @question_object = Question.find_by_id(@questionnaire.get_current_question)
    @question_text = @question_object.text
    @answer_options = Answer.where(:question_id => @questionnaire.get_current_question).order(:order).collect { |a| [a.text, a.id] }
    @action = "/questionnaires"

    if @question_object.kind == "Value"
      @answer_html = "<input type='hidden' name = 'kind' value='Value'>"
      @answer_html+= "<input type='number' name='answer' required='required' placeholder='Answer' class='form-control' style='width: 97%;margin: 1.5%'' >"
    elsif @question_object.kind == "Dropdown"     
      @answer_html = "<input type='hidden' name = 'kind' value='Dropdown'>"
      @answer_html+= '<select class="form-control" id="answer" required="required" name="answer" style="width: 97%;margin: 1.5%">'
      @answer_html+= '<option value="">Select</option>'
      @answer_options.each do |a|
        @answer_html+= '<option value="' +a[1].to_s+ '">' +a[0]+ '</option>'
      end
      @answer_html+= '</select>'
    end
    @answer_html = @answer_html.html_safe
    @html= [@question_text,@answer_html,@action]

  end

end