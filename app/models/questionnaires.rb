class Questionnaires
  attr_accessor :goal, :current_question, :questions_list, :answers
  def initialize(attributes = {})
    self.goal = attributes["goal"]
    self.current_question = attributes["index"]

    get_current_question
  end

  def get_current_question
    @current_question ||= questions.first
  end

  def questions
    @questions_list ||= Question.select(:id).where(:goal => @goal).order(:order).collect{ |q| q.id }
  end

  def next_question
    self.current_question = questions[questions.index(get_current_question)+1]
  end

  def previous_question
    self.current_question = questions[questions.index(get_current_question)-1]
  end

  def first_question?
    get_current_question == questions.first
  end

  def last_question?
    get_current_question == questions.last
  end

  def save(attributes = {})
    self.answers = attributes["answers"]
    self.answers.each do |a|
      @q = UserAnswers.new
      @q.user_id = attributes["user_id"]
      @q.question_id = a["question"]
      if a["kind"]== Question::Kind::VALUE
        @q.value = a["answer"]
      elsif a["kind"] == Question::Kind::DROPDOWN
        @q.answer_id = a["answer"]
      end
      
      @u = User.find_by_id(@q.user_id)
      if @u
        @u.goal_id = attributes["goal"]
        if @u.save
          @q.save  
        end
      end
    end
  end

end