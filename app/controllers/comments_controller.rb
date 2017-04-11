class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board_id), notice: 'コメントが投稿されました'
    else
      redirect_to board_path(@comment.board_id),notice: 'コメントエラー'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:board_id, :user_id, :sentence, :img)
    end
end
