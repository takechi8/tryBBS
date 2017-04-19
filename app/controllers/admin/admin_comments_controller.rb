class Admin::AdminCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @comments = Comment.page(params[:page])

    if params[:page].present?
      @page_nth = params[:page]
    else
      @page_nth = "1"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if params[:p].present?
      @page_nth = params[:p]
    else
      @page_nth = "1"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.attributes = admin_comment_params

    #センテンスのvalidate
    if @comment.sentence.length == 0
      @comment.errors.add(:sentence, "センテンスの空欄は不可です。")
      render :edit
      return
    end

    if params[:img_array].present?
      img_array = params[:img_array]
    else
      img_array = {}
    end

    #イメージの更新と新規登録
    3.times do |i|
      if img_array[i.to_s].present?
        if @comment.comment_imgs[i].present?
          @comment.comment_imgs[i].img = img_array[i.to_s]
          @comment.comment_imgs[i].save
        else
          @comment.comment_imgs.new(:img => img_array[i.to_s])
        end
      end
    end

    #validateのスッキプ
    if @comment.save(validate: false)
      if params[:page_nth].present?
        page_nth = params[:page_nth]
      else
        page_nth = "1"
      end
      redirect_to '/admin/admin_comments?page=' + page_nth
    else
      render :edit
    end

  end

  private
  def admin_comment_params
    params.require(:comment).permit(:board_id, :sentence, :user_id, :public_presence, :public_start_date, :public_end_date)
  end

end
