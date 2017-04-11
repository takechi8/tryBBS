class CommentsController < ApplicationController
  def create
    return false unless current_user.present?
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to board_path(@comment.board_id), notice: 'コメントが投稿されました'
    else
      @board = Board.find(@comment.board_id)
      render template: "boards/show"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:board_id, :sentence, :img)
    end
end
