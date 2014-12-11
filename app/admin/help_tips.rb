ActiveAdmin.register HelpTips do
  menu :priority => 11
  permit_params :title, :description

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  action_item :only => :show do
    link_to('New Help Tip', new_admin_help_tip_path)
  end

  filter :title
  
  form do |f|
    f.inputs "Tip Details" do
      f.input :title  
      f.input :description
    end
    f.actions
  end
  

end
