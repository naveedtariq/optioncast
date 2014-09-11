ActiveAdmin.register Answer do
  menu :priority => 6
  permit_params :text, :order, :question_id

  index do
    selectable_column
    id_column
    column :text
    column :order
    column :question do |q|
      if(q.question)
        link_to q.question.text,admin_question_path(q.question)
      end
    end
    actions
  end

  filter :text
  filter :order
  filter :"question_text", :label => "Question", :as => :select, :collection => Question.all.map(&:text)

  form do |f|
    f.inputs "Answer Details" do
      f.input :text
      f.input :order
      f.input :question, :as => :select, :collection => Question.all.map {|q| [q.text, q.id]}
    end 
    f.actions
  end
end
