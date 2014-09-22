ActiveAdmin.register Goal do
  menu :priority => 3
  permit_params :name, :order

  index do
    selectable_column
    id_column
    column :name
    column :order
    actions
  end

  action_item :only => :show do
    link_to('New Goal', new_admin_goal_path)
  end


  filter :name
  filter :order
  
  form do |f|
    f.inputs "Goal Details" do
      f.input :name
      f.input :order
    end
    f.actions
  end
  

end
