class Admin::AdminCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @comments = Comment.page(params[:page])
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

    #日時の更新
    @comment.public_start_date = Time.zone.parse(
                                    params[:comment]["public_start_date"] +
                                    ' '                                   +
                                    params[:start_time][0]                +
                                    ':'                                   +
                                    params[:start_time][1])

    @comment.public_end_date = Time.zone.parse(
                                    params[:comment]["public_end_date"] +
                                    ' '                                 +
                                    params[:end_time][0]                +
                                    ':'                                 +
                                    params[:end_time][1])

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

    #イメージの削除
    if params[:delete].present?
      params[:delete].each do |id|
        @comment_imgs = CommentImg.find(id)
        @comment_imgs.destroy
      end
    end

    #validateのスキップ
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if params[:p].present?
      page_nth = params[:p]
    else
      page_nth = "1"
    end
    redirect_to '/admin/admin_comments?page=' + page_nth
  end

  private
  def admin_comment_params
    params.require(:comment).permit(:board_id, :sentence, :public_presence)
  end

end
