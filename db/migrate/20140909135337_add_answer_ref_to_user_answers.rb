class AddAnswerRefToUserAnswers < ActiveRecord::Migration
  def change
    add_reference :user_answers, :answer, index: true
  end
end
