class ChangeAnswerToAnswerTextInUserAnswers < ActiveRecord::Migration
  def change
    rename_column :user_answers, :answer, :value
  end
end
