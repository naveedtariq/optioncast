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

  action_item :only => :show do
    link_to('New Answer', new_admin_answer_path)
  end

  filter :text
  filter :order
  filter :"question_text", :label => "Question", :as => :select, :collection => proc { Question.all.map(&:text) }

  form do |f|
    f.inputs "Answer Details" do
      f.input :question, :as => :select, :collection => Question.where(:kind => "Dropdown").map {|q| [q.text, q.id]}
      f.input :text
      f.input :order
    end 
    f.actions
  end
end
