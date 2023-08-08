ActiveAdmin.register Request do

  actions :index, :edit, :update, :create, :destroy, :show, :submit, :new

  permit_params :request_date, :status, :description

  belongs_to :user, optional: true
  belongs_to :product, optional: true

  index do
    column :request_date
    column :status
    column :description
    actions   
  end

  form do |fo|
    fo.inputs do
      fo.input :request_date
      fo.input :status
      fo.input :description
    end
    fo.actions
  end
  
end
