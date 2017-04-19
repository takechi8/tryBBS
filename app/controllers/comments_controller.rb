class CommentsController < ApplicationController

  def create
    return false unless current_user.present?
    @comment = current_user.comments.new(comment_params)

    if params[:img_array].present?
      params[:img_array].each do |img|
        @comment.comment_imgs.new(:img => img)
      end
    end

    if @comment.save
      redirect_to '/boards/'+@comment.board_id.to_s, notice: 'アップロードされました。'
    else
      @board = Board.find(@comment.board_id)
      @time = Time.zone.now
      render 'boards/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:board_id, :sentence, :user_id, :public_presence, :public_start_date, :public_end_date)
    end

end
