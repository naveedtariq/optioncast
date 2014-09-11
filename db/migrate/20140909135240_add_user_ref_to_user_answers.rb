class AddUserRefToUserAnswers < ActiveRecord::Migration
  def change
    add_reference :user_answers, :user, index: true
  end
end
