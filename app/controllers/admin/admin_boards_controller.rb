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

    #日時の更新
    @board.created_at = Time.zone.parse(
                          params[:board]["created_at"] +
                          ' '                          +
                          params[:created_time][0]     +
                          ':'                          +
                          params[:created_time][1])

    @board.updated_at = Time.zone.parse(
                          params[:board]["updated_at"] +
                          ' '                          +
                          params[:updated_time][0]     +
                          ':'                          +
                          params[:updated_time][1])

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

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    if params[:p].present?
      page_nth = params[:p]
    else
      page_nth = "1"
    end
    redirect_to '/admin/admin_boards?page=' + page_nth
  end

  private
  def admin_board_params
    params.require(:board).permit(:title)
  end

end
