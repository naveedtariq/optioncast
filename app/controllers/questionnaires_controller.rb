class QuestionnairesController < ApplicationController


  def start
    session[:questionnair_params] = nil
    render 'goal'
  end

  def goal
  end

  def new
    session[:questionnair_params] ||= {}
    @questionnaire = Questionnaires.new(session[:questionnair_params])
  end

  def create
    session[:questionnair_params] ||= {}
    if params[:goal]
      session[:questionnair_params]["goal"] = params[:goal]
    end
    session[:questionnair_params]["index"] ||= nil
    session[:questionnair_params]["answers"] ||= []

    @questionnaire = Questionnaires.new(session[:questionnair_params])

    if !params[:goal]

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
    end
    session[:questionnair_params]["index"] = @questionnaire.get_current_question
    render "new"

  end

end