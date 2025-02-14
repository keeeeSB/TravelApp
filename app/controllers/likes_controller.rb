class LikesController < ApplicationController
  before_action :find_post

  def create
    like = current_user.likes.build(post: @post)
    if like.save
      flash[:success] = "投稿にいいねをしました！"
    else
      flash[:danger] = "いいねをできませんでした。"
    end
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    like = current_user.likes.find_by(post: @post)
    like.destroy!
    flash[:success] = "いいねを取り消しました。"
    redirect_to user_post_path(current_user, @post)
  end

  private

    def find_post
      @post = Post.find(params[:post_id])
    end
end
