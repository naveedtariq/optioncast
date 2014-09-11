ActiveAdmin.register User do
  menu :priority => 2
  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :goal
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :goal

  form do |f|
    f.inputs "User Details" do
      f.input :email
      if f.object.new_record?
            f.input :password
            f.input :password_confirmation
      end
    end
    f.actions
  end
  

end
