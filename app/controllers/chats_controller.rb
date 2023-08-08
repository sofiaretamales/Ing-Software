class ChatsController < ApplicationController


=begin
                                               end
  def index_admin
    @admin = AdminUser.find(params[:admin_id])
    @chats = @admin.chats
    @chats = @chats.uniq.pluck(:user_id)

  end
=end


  def index_user
    @user = User.find(params[:user_id])
    @chats = @user.chats
    #@chats = @chats.uniq.pluck(:admin_user_id)
  end

=begin
  def show_admin
    @admin = AdminUser.find(params[:admin_id])
    @chats = @admin.chats
    @chat = @chats.where(params[:user_id])
  end
=end
  def show_user
    @user = User.find(params[:user_id])
    @chats = @user.chats
    @chat = @chats.where(params[:admin_id])
  end
=begin
  def new_user
    @admins = AdminUser.all
  end

  def new_admin
    @admin = AdminUser.find(params[:admin_id])
    @chat = @admin.chats.new(chat_params)
    @user = User.find(params[:user_id])
    @chat.user = @user
  end

  def create_user
    @admin = AdminUser.find(params[:admin_id])
    @chat = @admin.chats.new(chat_params)
    @user = User.find(params[:user_id])
    @chat.user = @user
    if @chat.save
      redirect_to @chat
    else
      render :new, status: :unprocessable_entity
    end
  end
  def create_admin
    @admin = AdminUser.find(params[:admin_id])
    @chat = @admin.chats.new(chat_params)
    @user = User.find(params[:user_id])
    @chat.user = @user
      if @chat.save
        redirect_to @chat
      else
        render :new, status: :unprocessable_entity
      end
  end



  def destroy
    @admin = AdminUser.find(params[:admin_id])
    @chats = @admin.chats
    @chat = @chats.where(params[:user_id])
    @chat.destroy
    redirect_to chats_path, status: :see_other
  end
=end
  def chat_params
    params.permit(:message, :user_id, :admin_user_id, :chat_id)
  end
end
