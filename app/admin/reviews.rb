ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :body, :product_id, :score, :"{:default=>5}"
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :body, :product_id, :score, :"{:default=>5}"]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :index, :edit, :update, :create, :destroy, :show, :submit, :new

  belongs_to :user, optional: true
  belongs_to :product, optional: true

  permit_params :body, :score

  index do
    column :body
    column :score
    column :user
    column :product
    actions   
  end

  filter :body
  filter :score
  filter :user
  filter :product

  form do |fo|
    fo.inputs do
      fo.input :body
      fo.input :score
      fo.input :user
      fo.input :product
    end
    fo.actions
  end

end
