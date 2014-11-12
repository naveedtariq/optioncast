ActiveAdmin.register Plan do
  menu :priority => 4
  permit_params :name, :about, :description, :fine_print, :pros, :cons, :recommendation, :link, :goal_id

  index do
    selectable_column
    id_column
    column :name
    column :about
    column :goal
    actions
  end

  action_item :only => :show do
    link_to('New Plan', new_admin_plan_path)
  end

  filter :name
  filter :goal
  
  form do |f|
    f.inputs "Plan Details" do
      f.input :name  
      f.input :about
      f.input :description
      f.input :fine_print
      f.input :pros
      f.input :cons
      f.input :recommendation
      f.input :link
      f.input :goal
    end
    f.actions
  end
  

end
