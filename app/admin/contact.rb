ActiveAdmin.register Contact do

index do
    selectable_column
    id_column
    column :name
    column :area
    column :category
    column :email
    column :website
    column :phone
    column :attachment
    actions
  end

  filter :name
  filter :area
  filter :category


  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :area
      f.input :category
      f.input :email
      f.input :website
      f.input :phone
      
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit contact: [ :name, :area, :category, :email, :website, :phone ]
    end
  end
  
end
