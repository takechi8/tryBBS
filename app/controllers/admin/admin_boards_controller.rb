class Admin::AdminBoardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @boards = Board.page(params[:page])

    if params[:page].present?
      @page_nth = params[:page]
    else
      @page_nth = "1"
    end
  end

  def edit
    @board = Board.find(params[:id])
    if params[:p].present?
      @page_nth = params[:p]
    else
      @page_nth = "1"
    end
  end

  def update
    @board = Board.find(params[:id])
    @board.attributes = admin_board_params

    if @board.save(validate: false)
      if params[:page_nth].present?
        page_nth = params[:page_nth]
      else
        page_nth = "1"
      end
      redirect_to '/admin/admin_boards?page=' + page_nth
    else
      render :edit
    end

  end

  private
  def admin_board_params
    params.require(:board).permit(:user_id, :title, :created_at, :updated_at)
  end

end
