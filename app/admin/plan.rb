ActiveAdmin.register Plan do
  menu :priority => 4
  permit_params :name, :details, :goal_id

  index do
    selectable_column
    id_column
    column :name
    column :details
    column :goal
    actions
  end

  filter :name
  filter :details
  filter :goal
  
  form do |f|
    f.inputs "Plan Details" do
      f.input :name
      f.input :details
      f.input :goal
    end
    f.actions
  end
  

end
