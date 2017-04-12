class CommentsController < ApplicationController
  def create
    return false unless current_user.present?
    @comment = current_user.comments.new(comment_params)

    @comment.save

    # render json: @comment
    # else
    #   @board = Board.find(@comment.board_id)
    #render template: "boards/show"
  end

  def edit_button
    @comment = Comment.find(params[:id])
    render :layout => nil
  end

  def update
    @comment = Comment.find(params[:id])
    print ("")
      # if current_user.id == @comment.user.id
    @comment.update(comment_params)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:board_id, :sentence, :img)
    end
end

#redirect_to board_path(@comment.board_id), notice: 'コメントが投稿されました'