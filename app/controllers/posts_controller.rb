class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "旅の記録を作成しました。"
      redirect_to user_posts_path(current_user)
    else
      flash.now[:danger] = "記録を作成できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "旅の記録を更新しました。"
      redierct_to user_posts_path(current_user)
    else
      flash.now[:danger] = "記録を更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    flash[:success] = "記録を削除しました。"
    redirect_to user_posts_path(current_user), status: :see_other
  end

  private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :location, :image)
    end
end
