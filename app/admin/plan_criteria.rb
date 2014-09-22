ActiveAdmin.register PlanCriteria do
  permit_params :plan_id, :question_id, :answer_id
  menu :priority => 7
  index do
    selectable_column
    id_column
    column :goal do |g|
      link_to g.plan.goal.name,admin_goal_path(g.plan.goal)
    end
    column :plan
    column :question do |q|
      if(q.question)
        link_to q.question.text,admin_question_path(q.question)
      end
    end
    column :answer do |a|
      if(a.answer)
        link_to a.answer.text,admin_answer_path(a.answer)
      end
    end
    actions
  end

  filter :"plan_goal_name" ,:label=> "Goal", :as => :select, :collection => proc{ Goal.all.map{|g| g.name} }
  filter :plan
  filter :question , :as => :select, :collection => proc { Question.all.map{|q| [q.text, q.id]} }
  
  form do |f|
    f.inputs "Plan Criteria Details" do
      f.input :plan
      f.input :question_id, :as => :select, :collection => Question.all.map {|q| [q.text, q.id]}
      f.input :answer_id, :as => :select, :collection => option_groups_from_collection_for_select(Question.all, :answers, :text, :id, :text)
      if f.object.answer
            f.input :hidden_answer_value, :as => :hidden, :value => f.object.answer.id
      else
            f.input :hidden_answer_value, :as => :hidden, :value => ""
      end 
    end
    f.actions
  end
  

end
