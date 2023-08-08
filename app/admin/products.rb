ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :seller, :price, :category
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :seller, :price, :category]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :index, :edit, :update, :create, :destroy, :show, :submit, :new

  permit_params :id, :name, :description, :seller, :price, :category

  index do
    column :name
    column :description
    column :seller 
    column :price 
    column :category
    actions   
  end

  form do |fo|
    fo.inputs do
      fo.input :name
      fo.input :description
      fo.input :seller
      fo.input :price
      fo.input :category
    end
    fo.actions
  end


  # action_item :new, only: :index do
  #   link_to "Crear producto", new_product_url
  # end


end

  

