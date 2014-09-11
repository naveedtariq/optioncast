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
