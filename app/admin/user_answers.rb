ActiveAdmin.register UserAnswer do
  menu :priority => 11

  index do
    selectable_column
    id_column
    column  :question_id
    column  :answer_id
    column  :user_id
    column  :value
    actions
  end

  filter :question_id
  filter :answer_id
  filter :user_id
  filter :value

  form do |f|
    f.inputs "Answer Details" do
      f.input :value
    end
    f.actions
  end
  

end
