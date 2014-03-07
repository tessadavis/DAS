ActiveAdmin.register User do

  
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name



  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit user: [ :first_name, :last_name, :email ]
    end
  end
  
end
