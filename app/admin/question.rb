ActiveAdmin.register Question do
  menu :priority => 5
  permit_params :text, :kind, :order, :goal_id
  config.sort_order = "order_asc"

  index do
    selectable_column
    id_column
    column :text
    column :kind
    column :order
    actions
  end

  action_item :only => :show do
    link_to('New Question', new_admin_question_path)
  end

  filter :text
  filter :kind
  filter :order
  
  form do |f|
    f.inputs "Question Details" do
      f.input :text
      f.input :kind, :as => :select, :collection => [["Value","Value"],["Dropdown","Dropdown"],["Date","Date"]], :selected => "Value", :include_blank => false
      f.input :order
    end
    f.actions
  end
  

end
