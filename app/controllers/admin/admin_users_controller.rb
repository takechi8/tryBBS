class Admin::AdminUsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.page(params[:page])

    if params[:page].present?
      @page_nth = params[:page]
    else
      @page_nth = "1"
    end
  end

  def edit
    @user = User.find(params[:id])

    if params[:p].present?
      @page_nth = params[:p]
    else
      @page_nth = "1"
    end

  end

  def update
    @user = User.find(params[:id])
    @user.attributes = admin_user_params

    if @user.save(validate: false)
      if params[:page_nth].present?
        page_nth = params[:page_nth]
      else
        page_nth = "1"
      end
      redirect_to '/admin/admin_users?page=' + page_nth
    else
      render :edit
    end
  end

  private
  def admin_user_params
    params.require(:user).permit(:username, :email, :role)
  end

end
