class BoardsController < ApplicationController
  # Only login users can access new.
	before_action :authenticate_user!, only: :new

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
  end

  def new
    @board = Board.new
  end

  def create
    return false unless current_user.present?
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to @board, notice: 'スレッドが作成されました'
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title)
    end

end
