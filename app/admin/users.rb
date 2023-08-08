ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, 
                :name, :phone
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at
  # , :remember_created_at, :name, :phone]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  actions :index, :edit, :update, :create, :destroy, :show, :submit, :new

  #permit_params :name, :email, :phone, :image, :password

  index do
    column :name
    column :email
    column :phone
    actions   
  end

  form do |fo|
    fo.inputs do
      fo.input :name
      fo.input :email
      fo.input :phone
      fo.input :password
    end
    fo.actions
  end

end
