ActiveAdmin.register ToolTips do
  menu :priority => 12
  permit_params :rank, :description

  index do
    selectable_column
    id_column
    column :rank
    column :description
    actions
  end

  form do |f|
    f.inputs "Tip Details" do
      f.input :rank  
      f.input :description
    end
    f.actions
  end
  

end
