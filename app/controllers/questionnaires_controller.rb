class QuestionnairesController < ApplicationController


  def start
    session[:questionnair_params] = nil
    render 'goal'
  end

  def goal
    session[:questionnair_params] = {}
    if params[:goal]
      session[:questionnair_params]["goal"] = params[:goal]
    end
    session[:questionnair_params]["index"] = nil
    session[:questionnair_params]["answers"] = []

    @questionnaire = Questionnaires.new(session[:questionnair_params])

    session[:questionnair_params]["index"] = @questionnaire.get_current_question
    @question_object = Question.find_by_id(@questionnaire.get_current_question)
    @question_text = @question_object.text
    @question_kind = @question_object.kind
    @answer_options = Answer.where(:question_id => @questionnaire.get_current_question).order(:order).collect { |a| [a.text, a.id] }

    render "new"
  end

  def new
    session[:questionnair_params] ||= {}
    @questionnaire = Questionnaires.new(session[:questionnair_params])
  end

  def create
    if !session[:questionnair_params] || !session[:questionnair_params]["goal"]
      render 'goal'
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
      flash[:notice] = "Questionnaire saved!"
      redirect_to what_is_optioncast_path, :notice => "Successfully created questionnaire."
      return                         
    else
      @questionnaire.next_question
    end
    
    session[:questionnair_params]["index"] = @questionnaire.get_current_question
    @question_object = Question.find_by_id(@questionnaire.get_current_question)
    @question_text = @question_object.text
    @answer_options = Answer.where(:question_id => @questionnaire.get_current_question).order(:order).collect { |a| [a.text, a.id] }

    if @question_object.kind == "Value"
      @answer_html = "<input type='hidden' name = 'kind' value='Value'>"
      @answer_html+= "<input type='text' name='answer' placeholder='Answer' class='form-control' style='width: 97%;margin: 1.5%'' >"
    elsif @question_object.kind == "Dropdown"     
      @answer_html = "<input type='hidden' name = 'kind' value='Dropdown'>"
      @answer_html+= '<select class="form-control" id="answer" name="answer" style="width: 97%;margin: 1.5%">'
      @answer_html+= '<option value="">Select</option>'
      @answer_options.each do |a|
        @answer_html+= '<option value="' +a[1].to_s+ '">' +a[0]+ '</option>'
      end
      @answer_html+= '</select>'
    end
    @answer_html = @answer_html.html_safe

    render "new"

  end



end