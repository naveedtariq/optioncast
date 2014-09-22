ActiveAdmin.register Question do
  menu :priority => 5
  permit_params :text, :kind, :order, :goal_id

  index do
    selectable_column
    id_column
    column :text
    column :kind
    column :order
    column :goal
    actions
  end

  action_item :only => :show do
    link_to('New Question', new_admin_question_path)
  end

  filter :text
  filter :kind
  filter :order
  filter :goal
  
  form do |f|
    f.inputs "Question Details" do
      f.input :text
      f.input :kind, :as => :select, :collection => [["Value","Value"],["Dropdown","Dropdown"]]
      f.input :order
      f.input :goal
    end
    f.actions
  end
  

end
